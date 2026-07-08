# ============================================
# Set-PerformanceMode.ps1
# تفعيل وضع الأداء الأقصى
# ============================================

Write-Host "🚀 جاري تفعيل وضع الأداء الأقصى..." -ForegroundColor Cyan
Write-Host ""

# تحقق من صلاحيات المسؤول
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "❌ هذا السكريبت يتطلب صلاحيات المسؤول!" -ForegroundColor Red
    Write-Host "💡 الحل: افتح PowerShell كمسؤول وحاول مرة أخرى" -ForegroundColor Yellow
    pause
    exit
}

# 1. تعيين High Performance Power Plan
Write-Host "1️⃣  تعيين High Performance Power Plan..." -ForegroundColor Cyan
$perfGuid = "8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61"
powercfg /setactive $perfGuid
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تعيين High Performance" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعيين الخطة" -ForegroundColor Red
}

# 2. تعطيل Sleep للشاشة (15 دقيقة)
Write-Host "2️⃣  تعطيل Sleep للشاشة..." -ForegroundColor Cyan
powercfg /change monitor-timeout-ac 15
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ وقت الشاشة: 15 دقيقة" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعديل إعدادات الشاشة" -ForegroundColor Red
}

# 3. تعطيل Sleep للقرص الصلب
Write-Host "3️⃣  تعطيل Sleep للقرص الصلب..." -ForegroundColor Cyan
powercfg /change disk-timeout-ac 0
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تعطيل Sleep للقرص" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعديل إعدادات القرص" -ForegroundColor Red
}

# 4. تفعيل USB Selective Suspend
Write-Host "4️⃣  تفعيل USB Selective Suspend..." -ForegroundColor Cyan
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 0
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تفعيل USB" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعديل إعدادات USB" -ForegroundColor Red
}

# 5. تفعيل PCI Express Link State Power Management
Write-Host "5️⃣  تفعيل PCI Express Power Management..." -ForegroundColor Cyan
powercfg /setacvalue scheme_current sub_pciexpress aspm 0
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تفعيل PCI Express" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعديل إعدادات PCI Express" -ForegroundColor Red
}

# 6. تعطيل Turn off hard disk after
Write-Host "6️⃣  تعطيل Turn off hard disk after..." -ForegroundColor Cyan
powercfg /setacvalue scheme_current sub_disk diskidle 0
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تعطيل Hard disk sleep" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعديل إعدادات Hard disk" -ForegroundColor Red
}

# 7. عرض الخطة النشطة الحالية
Write-Host ""
Write-Host "📊 الخطة الحالية:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
powercfg /getactivescheme
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

Write-Host ""
Write-Host "✅ اكتمل تفعيل وضع الأداء الأقصى!" -ForegroundColor Green
Write-Host ""
Write-Host "💡 ملخص الإعدادات:" -ForegroundColor Cyan
Write-Host "   • Power Plan: High Performance" -ForegroundColor Green
Write-Host "   • Screen Timeout: 15 دقيقة" -ForegroundColor Green
Write-Host "   • Disk Timeout: معطل" -ForegroundColor Green
Write-Host "   • USB Suspend: معطل" -ForegroundColor Green
Write-Host "   • PCI-E Power Management: معطل" -ForegroundColor Green

Write-Host ""
Write-Host "⚠️  ملاحظة: هذه الإعدادات قد تزيد استهلاك البطارية على أجهزة اللاب توب" -ForegroundColor Yellow

pause
