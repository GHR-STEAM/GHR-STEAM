<#
.SYNOPSIS
    Detect and repair broken Windows service/task/registry paths.
.DESCRIPTION
    Scans services, scheduled tasks, registry Run keys, and common directories
    for missing executable files.  By default runs in report-only mode.
    Use -Repair to disable broken services, remove broken tasks, and clean
    broken registry entries.
.PARAMETER Repair
    Actually apply fixes (disable services, delete tasks, remove reg entries).
    Without this switch the script only reports.
.PARAMETER LogPath
    Path to save the HTML report.  Default: "$env:USERPROFILE\Desktop\BrokenPathsReport.html"
.EXAMPLE
    .\Repair-WindowsBrokenPaths.ps1
    .\Repair-WindowsBrokenPaths.ps1 -Repair
#>

param(
    [switch]$Repair,
    [string]$LogPath = "$env:USERPROFILE\Desktop\BrokenPathsReport.html"
)

#Requires -RunAsAdministrator

$results = @()

# ---------- helpers ----------
function Add-Result($Category, $Target, $Path, $Exists, $Action, $Detail) {
    $results += [PSCustomObject]@{
        Category = $Category
        Target   = $Target
        Path     = $Path
        Exists   = $Exists
        Action   = $Action
        Detail   = $Detail
    }
}

function Test-FileExists($Path) {
    if (-not $Path -or $Path.Trim() -eq '') { return $null }
    # resolve env vars like %SystemRoot%
    $resolved = [System.Environment]::ExpandEnvironmentVariables($Path)
    # strip any arguments after .exe (services often have "C:\path\svc.exe" --arg)
    $exeOnly = ($resolved -split '"' | Where-Object { $_ -match '\.exe$' } | Select-Object -First 1)
    if (-not $exeOnly) { $exeOnly = ($resolved -split '\s+' | Select-Object -First 1) }
    if (-not $exeOnly -or $exeOnly.Trim() -eq '') { return $null }
    return (Test-Path -LiteralPath $exeOnly -ErrorAction SilentlyContinue)
}

# =====================================================
# 1.  SERVICES
# =====================================================
Write-Host "[1/5] Scanning services..." -ForegroundColor Cyan
$services = Get-WmiObject Win32_Service | Where-Object { $_.State -eq 'Running' -or $_.StartMode -ne 'Disabled' }
foreach ($svc in $services) {
    $exists = Test-FileExists $svc.PathName
    if ($exists -eq $false) {
        Add-Result -Category 'Service' -Target $svc.Name -Path $svc.PathName -Exists $false -Action $($Repair ? 'Disabled' : 'Reported') -Detail "Service '$($svc.Name)' ($($svc.DisplayName)) points to missing path"
        if ($Repair) {
            sc.exe config $svc.Name start=disabled | Out-Null
            sc.exe stop $svc.Name | Out-Null
            Write-Host "  -> Disabled service: $($svc.Name)" -ForegroundColor Yellow
        }
    }
}

# =====================================================
# 2.  REGISTRY RUN / RUNONCE
# =====================================================
Write-Host "[2/5] Scanning registry Run keys..." -ForegroundColor Cyan
$regPaths = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Run',
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce',
    'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce'
)
foreach ($rp in $regPaths) {
    if (-not (Test-Path $rp)) { continue }
    Get-ItemProperty -Path $rp -ErrorAction SilentlyContinue | ForEach-Object {
        $_.PSObject.Properties | Where-Object { $_.Name -notin @('PSPath','PSParentPath','PSChildName','PSDrive','PSProvider') } | ForEach-Object {
            $exists = Test-FileExists $_.Value
            if ($exists -eq $false) {
                Add-Result -Category 'Registry' -Target "$rp :: $($_.Name)" -Path $_.Value -Exists $false -Action $($Repair ? 'Removed' : 'Reported') -Detail "Registry value '$($_.Name)' points to missing file"
                if ($Repair) {
                    Remove-ItemProperty -Path $rp -Name $_.Name -ErrorAction SilentlyContinue
                    Write-Host "  -> Removed registry value: $($rp) :: $($_.Name)" -ForegroundColor Yellow
                }
            }
        }
    }
}

# =====================================================
# 3.  SCHEDULED TASKS
# =====================================================
Write-Host "[3/5] Scanning scheduled tasks..." -ForegroundColor Cyan
try {
    $tasks = Get-ScheduledTask -ErrorAction Stop
    foreach ($task in $tasks) {
        $actions = $task.Actions
        if (-not $actions) { continue }
        foreach ($action in $actions) {
            $path = $action.Execute
            if (-not $path) { continue }
            $exists = Test-FileExists $path
            if ($exists -eq $false) {
                Add-Result -Category 'ScheduledTask' -Target $task.TaskPath -Path $path -Exists $false -Action $($Repair ? 'Disabled' : 'Reported') -Detail "Task '$($task.TaskName)' runs missing executable"
                if ($Repair) {
                    Disable-ScheduledTask -TaskPath $task.TaskPath -TaskName $task.TaskName -ErrorAction SilentlyContinue
                    Write-Host "  -> Disabled task: $($task.TaskName)" -ForegroundColor Yellow
                }
            }
        }
    }
}
catch {
    Write-Warning "Could not read scheduled tasks (run as Admin)."
}

# =====================================================
# 4.  PACKAGE CACHE + COMMON DIRS (orphaned entries)
# =====================================================
Write-Host "[4/5] Scanning Package Cache for broken shortcuts..." -ForegroundColor Cyan
$scanDirs = @(
    "$env:ProgramData\Package Cache",
    "$env:ProgramFiles",
    "${env:ProgramFiles(x86)}",
    "$env:ProgramData"
)
foreach ($dir in $scanDirs) {
    if (-not (Test-Path $dir)) { continue }
    # Look for .lnk files that point to missing targets
    Get-ChildItem -Path $dir -Recurse -Depth 3 -Filter '*.lnk' -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            $shell = New-Object -ComObject WScript.Shell
            $shortcut = $shell.CreateShortcut($_.FullName)
            $target = $shortcut.TargetPath
            [System.Runtime.InteropServices.Marshal]::ReleaseComObject($shell) | Out-Null
            if ($target -and (Test-Path -LiteralPath $target -ErrorAction SilentlyContinue) -eq $false) {
                Add-Result -Category 'Shortcut' -Target $_.FullName -Path $target -Exists $false -Action 'Reported' -Detail "Broken shortcut -> missing target"
            }
        }
        catch { }
    }
}

# =====================================================
# 5.  REPORT
# =====================================================
Write-Host "[5/5] Generating report..." -ForegroundColor Cyan

$brokenServices   = $results | Where-Object { $_.Category -eq 'Service' }
$brokenRegistry   = $results | Where-Object { $_.Category -eq 'Registry' }
$brokenTasks      = $results | Where-Object { $_.Category -eq 'ScheduledTask' }
$brokenShortcuts  = $results | Where-Object { $_.Category -eq 'Shortcut' }
$totalBroken      = $results | Where-Object { $_.Exists -eq $false } | Measure-Object | Select-Object -ExpandProperty Count

$repairMode = if ($Repair) { 'مفعل' } else { 'تقرير فقط' }

$html = @"
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<title>تقرير إصلاح المسارات المعطوبة</title>
<style>
  body { font-family: 'Segoe UI', Tahoma, sans-serif; background: #f5f5f5; margin: 20px; }
  h1 { color: #d32f2f; }
  h2 { color: #1976d2; border-bottom: 1px solid #ccc; padding-bottom: 4px; }
  table { border-collapse: collapse; width: 100%; margin-bottom: 20px; background: #fff; box-shadow: 0 1px 3px rgba(0,0,0,.2); }
  th, td { padding: 8px 12px; text-align: right; border-bottom: 1px solid #e0e0e0; font-size: 13px; }
  th { background: #1976d2; color: white; }
  tr:hover { background: #e3f2fd; }
  .badge { display: inline-block; padding: 2px 8px; border-radius: 4px; color: #fff; font-size: 11px; }
  .badge-red { background: #d32f2f; }
  .badge-green { background: #388e3c; }
  .badge-gray { background: #757575; }
  .summary { display: flex; gap: 16px; margin-bottom: 20px; }
  .summary-card { background: #fff; padding: 16px 24px; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,.2); flex: 1; text-align: center; }
  .summary-card h3 { margin: 0 0 4px; font-size: 14px; color: #555; }
  .summary-card .num { font-size: 28px; font-weight: bold; color: #1976d2; }
</style>
</head>
<body>
<h1>🔧 تقرير إصلاح المسارات المعطوبة</h1>
<p>التاريخ: $(Get-Date -Format 'yyyy-MM-dd HH:mm') &nbsp;|&nbsp; وضع الإصلاح: $repairMode</p>

<div class="summary">
  <div class="summary-card"><h3>إجمالي المشاكل</h3><div class="num">$totalBroken</div></div>
  <div class="summary-card"><h3>خدمات معطوبة</h3><div class="num">$($brokenServices.Count)</div></div>
  <div class="summary-card"><h3>مهام معطوبة</h3><div class="num">$($brokenTasks.Count)</div></div>
  <div class="summary-card"><h3>مسارات Registry</h3><div class="num">$($brokenRegistry.Count)</div></div>
</div>
"@

if ($brokenServices.Count -gt 0) {
    $html += @"
<h2>🛑 الخدمات المعطوبة</h2>
<table><tr><th>اسم الخدمة</th><th>المسار المفقود</th><th>الإجراء</th></tr>
"@
    foreach ($r in $brokenServices) {
        $html += "<tr><td>$($r.Target)</td><td style='direction:ltr;text-align:left;font-size:12px'>$($r.Path)</td><td><span class='badge badge-red'>$($r.Action)</span></td></tr>"
    }
    $html += "</table>"
}

if ($brokenTasks.Count -gt 0) {
    $html += @"
<h2>⏰ المهام المجدولة المعطوبة</h2>
<table><tr><th>المهمة</th><th>المسار المفقود</th><th>الإجراء</th></tr>
"@
    foreach ($r in $brokenTasks) {
        $html += "<tr><td>$($r.Target)</td><td style='direction:ltr;text-align:left;font-size:12px'>$($r.Path)</td><td><span class='badge badge-red'>$($r.Action)</span></td></tr>"
    }
    $html += "</table>"
}

if ($brokenRegistry.Count -gt 0) {
    $html += @"
<h2>📝 مسارات Registry المعطوبة</h2>
<table><tr><th>المفتاح :: القيمة</th><th>المسار المفقود</th><th>الإجراء</th></tr>
"@
    foreach ($r in $brokenRegistry) {
        $html += "<tr><td style='font-size:11px'>$($r.Target)</td><td style='direction:ltr;text-align:left;font-size:12px'>$($r.Path)</td><td><span class='badge badge-red'>$($r.Action)</span></td></tr>"
    }
    $html += "</table>"
}

if ($brokenShortcuts.Count -gt 0) {
    $html += @"
<h2>🔗 اختصارات معطوبة</h2>
<table><tr><th>الاختصار</th><th>الهدف المفقود</th></tr>
"@
    foreach ($r in $brokenShortcuts) {
        $html += "<tr><td style='font-size:11px'>$($r.Target)</td><td style='direction:ltr;text-align:left;font-size:12px'>$($r.Path)</td></tr>"
    }
    $html += "</table>"
}

$html += @"
<h2>✅ تم الانتهاء</h2>
<p>الملف: $LogPath</p>
</body>
</html>
"@

$html | Out-File -FilePath $LogPath -Encoding utf8
Write-Host "`n📄 Report saved to: $LogPath" -ForegroundColor Green

Write-Host "`n========== SUMMARY ==========" -ForegroundColor Cyan
Write-Host "Services broken:     $($brokenServices.Count)" -ForegroundColor $(if($brokenServices.Count -gt 0){'Red'}else{'Green'})
Write-Host "Tasks broken:        $($brokenTasks.Count)" -ForegroundColor $(if($brokenTasks.Count -gt 0){'Red'}else{'Green'})
Write-Host "Registry broken:     $($brokenRegistry.Count)" -ForegroundColor $(if($brokenRegistry.Count -gt 0){'Red'}else{'Green'})
Write-Host "Shortcuts broken:    $($brokenShortcuts.Count)" -ForegroundColor $(if($brokenShortcuts.Count -gt 0){'Yellow'}else{'Green'})
Write-Host "==============================" -ForegroundColor Cyan

if (-not $Repair) {
    Write-Host "`n⚠️  تشغيل بدون -Repair (تقرير فقط). للإصلاح أعد التشغيل مع المفتاح -Repair" -ForegroundColor Yellow
    Write-Host "Example: .\Repair-WindowsBrokenPaths.ps1 -Repair" -ForegroundColor Yellow
}
