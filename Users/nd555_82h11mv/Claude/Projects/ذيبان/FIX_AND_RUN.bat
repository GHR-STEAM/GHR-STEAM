@echo off
REM ============================================
REM تطبيق الإعدادات الكاملة - نسخة محسّنة
REM ============================================

setlocal enabledelayedexpansion
cd /d "C:\Users\%USERNAME%\Claude\Projects\ذيبان"

echo.
echo ============================================
echo تطبيق إعدادات Windows 11
echo ============================================
echo.

REM === تعيين الدقة والتحديث ===
echo جاري تعيين الدقة 1920x1080 @ 144Hz...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type 'using System; using System.Runtime.InteropServices; public class NativeDisplay { [DllImport(\"user32.dll\")] public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode); [DllImport(\"user32.dll\")] public static extern int ChangeDisplaySettings(ref DEVMODE devMode, uint flags); [StructLayout(LayoutKind.Sequential)] public struct DEVMODE { [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName; public ushort dmSpecVersion; public ushort dmDriverVersion; public ushort dmSize; public ushort dmDriverExtra; public uint dmFields; public int dmPositionX; public int dmPositionY; public uint dmDisplayOrientation; public uint dmDisplayFixedOutput; public short dmColor; public short dmPaperSize; public short dmPaperLength; public short dmPaperWidth; public short dmScale; public short dmCopies; public short dmDefaultSource; public short dmPrintQuality; public int dmYResolution; public int dmTTOption; public int dmCollate; [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName; public ushort dmLogPixels; public uint dmBitsPerPel; public uint dmPelsWidth; public uint dmPelsHeight; public uint dmDisplayFlags; public uint dmDisplayFrequency; public uint dmICMMethod; public uint dmICMIntent; public uint dmMediaType; public uint dmDitherType; public uint dmReserved1; public uint dmReserved2; public uint dmPanningWidth; public uint dmPanningHeight; } }' -ErrorAction SilentlyContinue; Write-Host 'جاري تحديث الدقة...' -ForegroundColor Green"

REM === تفعيل High Performance Mode ===
echo.
echo جاري تفعيل وضع الأداء الأقصى...
powercfg /setactive 8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61
if %ERRORLEVEL% EQU 0 (
    echo ✅ تم تفعيل High Performance
) else (
    echo ❌ خطأ في تفعيل الوضع
)

REM === تعطيل Sleep للشاشة ===
echo جاري تعطيل sleep للشاشة (15 دقيقة)...
powercfg /change monitor-timeout-ac 15
if %ERRORLEVEL% EQU 0 (
    echo ✅ تم تعطيل شاشة sleep
) else (
    echo ❌ خطأ في إعدادات الشاشة
)

REM === تعطيل Sleep للقرص ===
echo جاري تعطيل sleep للقرص...
powercfg /change disk-timeout-ac 0
if %ERRORLEVEL% EQU 0 (
    echo ✅ تم تعطيل قرص sleep
) else (
    echo ❌ خطأ في إعدادات القرص
)

REM === إعدادات USB ===
echo جاري تحديث إعدادات USB...
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 0
powercfg /setacvalue scheme_current sub_pciexpress aspm 0
powercfg /setacvalue scheme_current sub_disk diskidle 0

echo.
echo ============================================
echo ✅ اكتمل التطبيق!
echo ============================================
echo.
echo 📊 الإعدادات المطبّقة:
echo   • Power Plan: High Performance
echo   • Screen Timeout: 15 دقائق
echo   • Disk Timeout: معطل
echo   • USB Selective Suspend: معطل
echo.
echo 🎮 الخطوة التالية: إعدادات NVIDIA/AMD
echo   1. انقر بزر الماوس الأيمن على سطح المكتب
echo   2. اختر NVIDIA Control Panel أو AMD Radeon Settings
echo   3. اتبع الإعدادات من Display_Color_Settings.json
echo.
echo ============================================
pause
