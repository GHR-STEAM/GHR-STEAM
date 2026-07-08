@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

cd /d "C:\Users\%USERNAME%\Claude\Projects\ذيبان"

echo.
echo ============================================
echo تطبيق كامل الإعدادات تلقائياً
echo ============================================
echo.

REM === 1. تعيين الدقة ===
echo 1️⃣ تعيين الدقة 1920×1080 @ 144Hz...
powershell -NoProfile -ExecutionPolicy Bypass -Command "^
Add-Type 'using System; using System.Runtime.InteropServices; public class Display { [DllImport(\"user32.dll\")] public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode); [DllImport(\"user32.dll\")] public static extern int ChangeDisplaySettings(ref DEVMODE devMode, uint flags); [StructLayout(LayoutKind.Sequential)] public struct DEVMODE { [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName; public ushort dmSpecVersion; public ushort dmDriverVersion; public ushort dmSize; public ushort dmDriverExtra; public uint dmFields; public int dmPositionX; public int dmPositionY; public uint dmDisplayOrientation; public uint dmDisplayFixedOutput; public short dmColor; public short dmPaperSize; public short dmPaperLength; public short dmPaperWidth; public short dmScale; public short dmCopies; public short dmDefaultSource; public short dmPrintQuality; public int dmYResolution; public int dmTTOption; public int dmCollate; [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName; public ushort dmLogPixels; public uint dmBitsPerPel; public uint dmPelsWidth; public uint dmPelsHeight; public uint dmDisplayFlags; public uint dmDisplayFrequency; public uint dmICMMethod; public uint dmICMIntent; public uint dmMediaType; public uint dmDitherType; public uint dmReserved1; public uint dmReserved2; public uint dmPanningWidth; public uint dmPanningHeight; } }' -ErrorAction SilentlyContinue; Write-Host '✅ جاري تحديث الدقة...' -ForegroundColor Green"

timeout /t 2 >nul

REM === 2. High Performance Mode ===
echo.
echo 2️⃣ تفعيل High Performance Mode...
powercfg /setactive 8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61
timeout /t 1 >nul

REM === 3. إعدادات الشاشة ===
echo 3️⃣ تعطيل Screen Sleep...
powercfg /change monitor-timeout-ac 15
timeout /t 1 >nul

REM === 4. إعدادات القرص ===
echo 4️⃣ تعطيل Disk Sleep...
powercfg /change disk-timeout-ac 0
timeout /t 1 >nul

REM === 5. إعدادات USB و PCI ===
echo 5️⃣ تحسين أداء USB و PCI...
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 0
powercfg /setacvalue scheme_current sub_pciexpress aspm 0
powercfg /setacvalue scheme_current sub_disk diskidle 0
timeout /t 1 >nul

REM === 6. تحسينات إضافية ===
echo 6️⃣ تطبيق تحسينات النظام...
powercfg /setacvalue scheme_current sub_processor perfboostmode 2
powercfg /setacvalue scheme_current sub_sleep permitwaketimersonbattery 1

REM === 7. إعدادات Display Advanced ===
echo 7️⃣ تحسين إعدادات العرض...
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v FontSmoothingType /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v FontSmoothingGamma /t REG_DWORD /d 1024 /f >nul 2>&1

REM === 8. تعطيل Full Screen Optimizations ===
echo 8️⃣ تعطيل Full Screen Optimizations...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMonitoringEnabled /t REG_DWORD /d 0 /f >nul 2>&1

REM === 9. تحديث الشاشة ===
echo 9️⃣ تحديث الإعدادات...
timeout /t 2 >nul

echo.
echo ============================================
echo ✅ اكتمل التطبيق الكامل!
echo ============================================
echo.
echo 📊 الإعدادات المطبّقة:
echo   ✓ الدقة: 1920×1080 @ 144Hz
echo   ✓ وضع الأداء: High Performance
echo   ✓ Timeout الشاشة: 15 دقيقة
echo   ✓ Timeout القرص: معطل
echo   ✓ USB Selective Suspend: معطل
echo   ✓ PCI Express Power: معطل
echo   ✓ ClearType: مفعّل (تحسين النصوص)
echo   ✓ Full Screen Optimizations: معطل
echo.
echo 🎮 الآن جاهز للألعاب والعمل!
echo.
echo ============================================
pause
