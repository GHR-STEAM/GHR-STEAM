# ============================================
# Reset-DisplaySettings.ps1
# إعادة تعيين الإعدادات الافتراضية
# ============================================

# ============================================
# Reset-DisplaySettings.ps1 - نسخة محسّنة
# إعادة تعيين الإعدادات الافتراضية (Power Plan + Display)
# ============================================

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class DisplaySettings {
    [DllImport("user32.dll")]
    public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

    [DllImport("user32.dll")]
    public static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);

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
    public const int CDS_UPDATEREGISTRY = 0x01;
}
"@

Write-Host ""
Write-Host "↩️  جاري إعادة تعيين الإعدادات الافتراضية..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""

# تحقق من صلاحيات المسؤول
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "❌ هذا السكريبت يتطلب صلاحيات المسؤول!" -ForegroundColor Red
    Write-Host "💡 الحل: افتح PowerShell كمسؤول وحاول مرة أخرى" -ForegroundColor Yellow
    pause
    exit
}

# 1. تعيين Balanced Power Plan
Write-Host "1️⃣  تعيين Balanced Power Plan..." -ForegroundColor Cyan
$balancedGuid = "381b4222-f694-41f0-9685-ff5bb260df2e"
powercfg /setactive $balancedGuid
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم تعيين Balanced" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل تعيين الخطة" -ForegroundColor Red
}

# 2. إعادة تعيين Screen Timeout
Write-Host "2️⃣  إعادة تعيين Screen Timeout..." -ForegroundColor Cyan
powercfg /change monitor-timeout-ac 10
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ وقت الشاشة: 10 دقائق" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل التعديل" -ForegroundColor Red
}

# 3. إعادة تعيين Disk Timeout
Write-Host "3️⃣  إعادة تعيين Disk Timeout..." -ForegroundColor Cyan
powercfg /change disk-timeout-ac 20
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ وقت القرص: 20 دقيقة" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل التعديل" -ForegroundColor Red
}

# 4. إعادة تعيين USB Selective Suspend
Write-Host "4️⃣  إعادة تعيين USB Selective Suspend..." -ForegroundColor Cyan
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ تم إعادة تعيين USB" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل التعديل" -ForegroundColor Red
}

# 5. إعادة تعيين الدقة إلى 1920x1080 @ 60Hz
Write-Host "5️⃣  إعادة تعيين دقة الشاشة..." -ForegroundColor Cyan

$devMode = New-Object DisplaySettings+DEVMODE
$devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)

# حصول على الإعدادات الحالية أولاً
[DisplaySettings]::EnumDisplaySettings($null, -1, [ref]$devMode)

# تعيين الدقة الافتراضية (1920x1080 @ 60Hz)
$devMode.dmPelsWidth = 1920
$devMode.dmPelsHeight = 1080
$devMode.dmDisplayFrequency = 60
$devMode.dmFields = [DisplaySettings]::DM_PELSWIDTH -bor [DisplaySettings]::DM_PELSHEIGHT -bor [DisplaySettings]::DM_DISPLAYFREQUENCY

$result = [DisplaySettings]::ChangeDisplaySettings([ref]$devMode, [DisplaySettings]::CDS_UPDATEREGISTRY)

if ($result -eq 0 -or $result -eq 1) {
    Write-Host "   ✅ تم إعادة تعيين الدقة إلى 1920x1080 @ 60Hz" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  قد تحتاج إلى إعادة التعيين يدويًا" -ForegroundColor Yellow
}

# 6. عرض الخطة النشطة الحالية
Write-Host ""
Write-Host "📊 الخطة الحالية:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
powercfg /getactivescheme
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✅ اكتمل إعادة تعيين الإعدادات!" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

Write-Host "💡 الإعدادات المُعادة:" -ForegroundColor Cyan
Write-Host "   • Power Plan:            Balanced" -ForegroundColor Green
Write-Host "   • Screen Timeout:        10 دقائق" -ForegroundColor Green
Write-Host "   • Disk Timeout:          20 دقيقة" -ForegroundColor Green
Write-Host "   • USB Suspend:           مفعّل" -ForegroundColor Green
Write-Host "   • Display Resolution:    1920x1080 @ 60Hz" -ForegroundColor Green

Write-Host ""
Write-Host "✨ جميع الإعدادات أعيدت إلى الافتراضية" -ForegroundColor Cyan
Write-Host ""
pause
