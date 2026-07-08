# ============================================
# Check-CurrentSettings.ps1
# فحص وعرض الإعدادات الحالية
# ============================================

Write-Host ""
Write-Host "📊 جاري فحص الإعدادات الحالية..." -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# ============================================
# 1. إعدادات الشاشة
# ============================================

Write-Host "🖥️  إعدادات الشاشة (Display Settings):" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────" -ForegroundColor Gray

Add-Type @"
using System;
using System.Runtime.InteropServices;

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
}
"@

$devMode = New-Object DisplaySettings+DEVMODE
$devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)

[DisplaySettings]::EnumDisplaySettings($null, -1, [ref]$devMode)

Write-Host "   الدقة (Resolution):      $($devMode.dmPelsWidth)x$($devMode.dmPelsHeight)" -ForegroundColor Green
Write-Host "   معدل التحديث (Hz):       $($devMode.dmDisplayFrequency) Hz" -ForegroundColor Green
Write-Host ""

# ============================================
# 2. Power Plan النشطة
# ============================================

Write-Host "⚡ خطة الطاقة (Power Plan):" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────" -ForegroundColor Gray

$activePlan = powercfg /getactivescheme
if ($LASTEXITCODE -eq 0) {
    # استخراج اسم الخطة من النتيجة
    if ($activePlan -match "High Performance") {
        Write-Host "   الخطة النشطة:            High Performance 🔴" -ForegroundColor Red
    } elseif ($activePlan -match "Balanced") {
        Write-Host "   الخطة النشطة:            Balanced ⚪" -ForegroundColor Green
    } elseif ($activePlan -match "Power Saver") {
        Write-Host "   الخطة النشطة:            Power Saver 🟢" -ForegroundColor Cyan
    } else {
        Write-Host "   الخطة النشطة:            $activePlan" -ForegroundColor Green
    }
} else {
    Write-Host "   ❌ فشل الحصول على معلومات Power Plan" -ForegroundColor Red
}

Write-Host ""

# ============================================
# 3. Monitor Timeout
# ============================================

Write-Host "⏱️  إعدادات المراقبة (Monitor Settings):" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────" -ForegroundColor Gray

# الحصول على Monitor Timeout
$monitorTimeout = powercfg /query scheme_current sub_video videoidle
if ($LASTEXITCODE -eq 0) {
    # محاولة استخراج القيمة
    if ($monitorTimeout -match "Current AC Power Setting Index: (\d+)") {
        $timeoutSeconds = [int]$matches[1]
        $timeoutMinutes = [math]::Ceiling($timeoutSeconds / 60)
        Write-Host "   Monitor Timeout (AC):    $timeoutMinutes دقيقة" -ForegroundColor Green
    } else {
        Write-Host "   Monitor Timeout (AC):    غير محدد" -ForegroundColor Yellow
    }
} else {
    Write-Host "   Monitor Timeout (AC):    غير متوفر" -ForegroundColor Yellow
}

Write-Host ""

# ============================================
# 4. معلومات GPU
# ============================================

Write-Host "🎮 معلومات بطاقة الرسومات (GPU):" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────" -ForegroundColor Gray

$gpu = Get-WmiObject Win32_VideoController | Select-Object -First 1

if ($gpu) {
    Write-Host "   البطاقة:                  $($gpu.Name)" -ForegroundColor Green
    Write-Host "   الذاكرة:                  $([math]::Round($gpu.AdapterRAM / 1GB, 2)) GB" -ForegroundColor Green
} else {
    Write-Host "   ❌ فشل الحصول على معلومات GPU" -ForegroundColor Red
}

Write-Host ""

# ============================================
# 5. معلومات النظام
# ============================================

Write-Host "🖥️  معلومات النظام (System Info):" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────" -ForegroundColor Gray

$os = Get-WmiObject Win32_OperatingSystem

Write-Host "   نظام التشغيل:            $($os.Caption)" -ForegroundColor Green

$sysInfo = Get-ComputerInfo
Write-Host "   المعالج:                 $($sysInfo.CsProcessors[0].Name)" -ForegroundColor Green
Write-Host "   الذاكرة (RAM):           $([math]::Round($sysInfo.CsTotalPhysicalMemory / 1GB, 2)) GB" -ForegroundColor Green

Write-Host ""

# ============================================
# الملخص
# ============================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✅ انتهى الفحص" -ForegroundColor Green
Write-Host ""
Write-Host "💡 الملاحظات:" -ForegroundColor Cyan
Write-Host "   • استخدم Set-Resolution.ps1 لتغيير الدقة" -ForegroundColor Gray
Write-Host "   • استخدم Set-PerformanceMode.ps1 للأداء الأقصى" -ForegroundColor Gray
Write-Host "   • استخدم Reset-DisplaySettings.ps1 لإعادة التعيين" -ForegroundColor Gray

Write-Host ""
pause
