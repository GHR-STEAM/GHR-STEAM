# ============================================
# Get-SupportedRefreshRates.ps1
# البحث عن جميع الترددات المدعومة
# ============================================

Write-Host ""
Write-Host "🔍 جاري البحث عن الترددات المدعومة..." -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;

public class DisplaySettings {
    [DllImport("user32.dll")]
    public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

    [StructLayout(LayoutKind.Sequential)]
    public struct DEVMODE {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string dmDeviceName;

        public short dmSpecVersion;
        public short dmDriverVersion;
        public short dmSize;
        public short dmDriverExtra;
        public int dmFields;
        public int dmPositionX;
        public int dmPositionY;
        public int dmDisplayOrientation;
        public int dmDisplayFixedOutput;
        public short dmColor;
        public short dmXResolution;
        public short dmYResolution;
        public short dmXPrintResolution;
        public short dmYPrintResolution;
        public short dmInterlaced;
        public short dmCopies;
        public short dmICMMethod;
        public short dmICMIntent;
        public short dmMediaType;
        public short dmDitherType;
        public int dmReserved1;
        public int dmReserved2;
        public int dmPanningWidth;
        public int dmPanningHeight;
    }

    public const int DM_DISPLAYFREQUENCY = 0x400000;
    public const int DM_PELSWIDTH = 0x80000;
    public const int DM_PELSHEIGHT = 0x100000;
}
"@

# الحصول على الدقة الحالية
$devMode = New-Object DisplaySettings+DEVMODE
$devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)
[DisplaySettings]::EnumDisplaySettings($null, -1, [ref]$devMode)

$currentResolution = "$($devMode.dmPelsWidth)x$($devMode.dmPelsHeight)"
$currentFrequency = $devMode.dmDisplayFrequency

Write-Host "📺 الشاشة الحالية: $currentResolution" -ForegroundColor Yellow
Write-Host "🔄 معدل التحديث الحالي: $currentFrequency Hz" -ForegroundColor Yellow
Write-Host ""

# البحث عن جميع الترددات المدعومة للدقة الحالية
Write-Host "🔎 البحث عن الترددات المدعومة للدقة $currentResolution..." -ForegroundColor Cyan
Write-Host "─────────────────────────────────────" -ForegroundColor Gray
Write-Host ""

$supportedRates = @()
$modeIndex = 0

# التكرار عبر جميع أوضاع العرض
while ($true) {
    $devMode = New-Object DisplaySettings+DEVMODE
    $devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)

    $result = [DisplaySettings]::EnumDisplaySettings($null, $modeIndex, [ref]$devMode)

    if (-not $result) {
        break
    }

    # التحقق من أن الدقة تطابق الدقة الحالية
    if ($devMode.dmPelsWidth -eq $devMode.dmXResolution -and
        $devMode.dmPelsHeight -eq $devMode.dmYResolution) {

        if ($devMode.dmPelsWidth -eq [int]$currentResolution.Split('x')[0] -and
            $devMode.dmPelsHeight -eq [int]$currentResolution.Split('x')[1]) {

            # إضافة التردد إذا لم يكن موجود بالفعل
            if ($devMode.dmDisplayFrequency -notin $supportedRates) {
                $supportedRates += $devMode.dmDisplayFrequency
            }
        }
    }

    $modeIndex++
}

# ترتيب الترددات
$supportedRates = $supportedRates | Sort-Object

if ($supportedRates.Count -gt 0) {
    Write-Host "✅ الترددات المدعومة:" -ForegroundColor Green
    Write-Host ""

    $count = 1
    foreach ($rate in $supportedRates) {
        if ($rate -eq $currentFrequency) {
            Write-Host "   [$count] $rate Hz  ← الحالي 🟢" -ForegroundColor Green
        } else {
            Write-Host "   [$count] $rate Hz" -ForegroundColor White
        }
        $count++
    }

    Write-Host ""
    Write-Host "💡 التوصيات:" -ForegroundColor Cyan
    Write-Host "─────────────────────────────────────" -ForegroundColor Gray

    $maxRate = $supportedRates[-1]
    Write-Host "   أعلى تردد مدعوم:         $maxRate Hz" -ForegroundColor Green

    if ($maxRate -ge 144) {
        Write-Host "   لـ الألعاب:              استخدم $maxRate Hz أو 144Hz" -ForegroundColor Yellow
    } elseif ($maxRate -ge 120) {
        Write-Host "   لـ الألعاب:              استخدم $maxRate Hz أو 120Hz" -ForegroundColor Yellow
    } else {
        Write-Host "   لـ الألعاب:              استخدم 60Hz (الشاشة تدعم ترددات منخفضة فقط)" -ForegroundColor Yellow
    }

    Write-Host "   لـ العمل:                استخدم 60Hz" -ForegroundColor Cyan

    Write-Host ""
    Write-Host "🚀 كيفية التطبيق:" -ForegroundColor Cyan
    Write-Host "─────────────────────────────────────" -ForegroundColor Gray
    Write-Host "   1. افتح Set-Resolution.ps1" -ForegroundColor Gray
    Write-Host "   2. عدّل القيمة من 144 إلى التردد المطلوب" -ForegroundColor Gray
    Write-Host "   3. مثال:" -ForegroundColor Gray
    Write-Host "      `$devMode.dmDisplayFrequency = $maxRate" -ForegroundColor Cyan

} else {
    Write-Host "❌ لم يتم العثور على ترددات مدعومة" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 الحلول:" -ForegroundColor Cyan
    Write-Host "   • تحديث تعريفات بطاقة الشاشة" -ForegroundColor Yellow
    Write-Host "   • تحديث Windows" -ForegroundColor Yellow
    Write-Host "   • التحقق من كبل HDMI/DisplayPort" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✨ انتهى البحث" -ForegroundColor Green
Write-Host ""
pause
