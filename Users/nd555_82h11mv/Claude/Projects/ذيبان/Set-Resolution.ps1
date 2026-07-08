# ============================================
# Set-Resolution.ps1
# تعيين الدقة ومعدل التحديث الأقصى
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
Write-Host "🖥️  تعيين الدقة ومعدل التحديث" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# حصول على إعدادات الشاشة الحالية
$devMode = New-Object DisplaySettings+DEVMODE
$devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)

Write-Host "🔍 جاري البحث عن إعدادات الشاشة الحالية..." -ForegroundColor Cyan
[DisplaySettings]::EnumDisplaySettings($null, -1, [ref]$devMode)

$currentWidth = $devMode.dmPelsWidth
$currentHeight = $devMode.dmPelsHeight
$currentFrequency = $devMode.dmDisplayFrequency

Write-Host "✅ الدقة الحالية: $currentWidth x $currentHeight" -ForegroundColor Yellow
Write-Host "✅ معدل التحديث الحالي: $currentFrequency Hz" -ForegroundColor Yellow
Write-Host ""

# ============================================
# اختيار الدقة
# ============================================

Write-Host "❓ اختر الدقة:" -ForegroundColor Cyan
Write-Host "   [1] 1920 × 1080 (Full HD) - موصى به" -ForegroundColor Green
Write-Host "   [2] 1680 × 1050" -ForegroundColor White
Write-Host "   [3] 1600 × 900" -ForegroundColor White
Write-Host "   [4] 1280 × 720" -ForegroundColor White
Write-Host "   [5] مخصص (اكتب الدقة)" -ForegroundColor Yellow
Write-Host ""

$resChoice = Read-Host "اختر الخيار (1-5) أو اضغط Enter للافتراضي (1)"

if ([string]::IsNullOrWhiteSpace($resChoice)) {
    $resChoice = "1"
}

$newWidth = 1920
$newHeight = 1080

switch ($resChoice) {
    "1" { $newWidth = 1920; $newHeight = 1080 }
    "2" { $newWidth = 1680; $newHeight = 1050 }
    "3" { $newWidth = 1600; $newHeight = 900 }
    "4" { $newWidth = 1280; $newHeight = 720 }
    "5" {
        $customRes = Read-Host "أدخل الدقة (مثال: 1920x1080)"
        if ($customRes -match "(\d+)x(\d+)") {
            $newWidth = [int]$matches[1]
            $newHeight = [int]$matches[2]
        }
    }
    default { $newWidth = 1920; $newHeight = 1080 }
}

Write-Host ""

# ============================================
# اختيار معدل التحديث
# ============================================

Write-Host "❓ اختر معدل التحديث:" -ForegroundColor Cyan
Write-Host "   [1] 60 Hz (عام)" -ForegroundColor White
Write-Host "   [2] 75 Hz" -ForegroundColor White
Write-Host "   [3] 120 Hz" -ForegroundColor White
Write-Host "   [4] 144 Hz (موصى به) 🎮" -ForegroundColor Green
Write-Host "   [5] 165 Hz" -ForegroundColor White
Write-Host "   [6] 240 Hz" -ForegroundColor White
Write-Host "   [7] مخصص (اكتب القيمة)" -ForegroundColor Yellow
Write-Host ""

$freqChoice = Read-Host "اختر الخيار (1-7) أو اضغط Enter للافتراضي (4)"

if ([string]::IsNullOrWhiteSpace($freqChoice)) {
    $freqChoice = "4"
}

$newFrequency = 144

switch ($freqChoice) {
    "1" { $newFrequency = 60 }
    "2" { $newFrequency = 75 }
    "3" { $newFrequency = 120 }
    "4" { $newFrequency = 144 }
    "5" { $newFrequency = 165 }
    "6" { $newFrequency = 240 }
    "7" {
        $customFreq = Read-Host "أدخل معدل التحديث (مثال: 144)"
        if ($customFreq -match "\d+") {
            $newFrequency = [int]$customFreq
        }
    }
    default { $newFrequency = 144 }
}

Write-Host ""

# ============================================
# التطبيق
# ============================================

Write-Host "⚙️  جاري تطبيق الإعدادات..." -ForegroundColor Cyan
Write-Host "   الدقة الجديدة:           ${newWidth}x${newHeight}" -ForegroundColor Yellow
Write-Host "   معدل التحديث الجديد:    $newFrequency Hz" -ForegroundColor Yellow
Write-Host ""

# تعيين الإعدادات الجديدة
$devMode.dmPelsWidth = $newWidth
$devMode.dmPelsHeight = $newHeight
$devMode.dmDisplayFrequency = $newFrequency
$devMode.dmFields = [DisplaySettings]::DM_PELSWIDTH -bor [DisplaySettings]::DM_PELSHEIGHT -bor [DisplaySettings]::DM_DISPLAYFREQUENCY

# طبّق الإعدادات
$result = [DisplaySettings]::ChangeDisplaySettings([ref]$devMode, [DisplaySettings]::CDS_UPDATEREGISTRY)

Write-Host ""

if ($result -eq 0) {
    Write-Host "✅ تم تطبيق الإعدادات بنجاح!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📊 الإعدادات الجديدة:" -ForegroundColor Cyan
    Write-Host "   الدقة:                   ${newWidth}x${newHeight}" -ForegroundColor Green
    Write-Host "   معدل التحديث:           $newFrequency Hz" -ForegroundColor Green
} elseif ($result -eq 1) {
    Write-Host "⚠️  تم تطبيق الإعدادات بشكل مؤقت (Temporary)" -ForegroundColor Yellow
    Write-Host "💡 سيتم إعادة تشغيل الشاشة في 15 ثانية..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "ملاحظة: إذا لم تكن الإعدادات تناسبك، اضغط أي مفتاح لإلغاء" -ForegroundColor Yellow
    Start-Sleep -Seconds 15
} else {
    Write-Host "❌ فشل تطبيق الإعدادات (رمز الخطأ: $result)" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 الحلول المقترحة:" -ForegroundColor Yellow
    Write-Host "   1. قد لا تدعم الشاشة هذه الدقة أو التردد" -ForegroundColor Gray
    Write-Host "   2. جرب قيم أقل (مثلاً 1920x1080 @ 60Hz)" -ForegroundColor Gray
    Write-Host "   3. شغّل Get-SupportedRefreshRates.ps1 لرؤية الترددات المدعومة" -ForegroundColor Gray
    Write-Host "   4. حدّث تعريفات بطاقة الرسومات" -ForegroundColor Gray
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✨ اكتمل السكريبت" -ForegroundColor Cyan
Write-Host ""
pause
