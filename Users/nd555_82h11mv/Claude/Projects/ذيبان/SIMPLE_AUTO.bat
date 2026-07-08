@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

cd /d "C:\Users\%USERNAME%\Claude\Projects\ذيبان"

echo.
echo ============================================
echo تطبيق الاعدادات بسهولة
echo ============================================
echo.

REM 1. High Performance
echo 1. تفعيل High Performance...
powercfg /setactive 8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61

REM 2. Screen Timeout
echo 2. اعداد الشاشة - 15 دقيقة...
powercfg /change monitor-timeout-ac 15

REM 3. Disk Timeout
echo 3. تعطيل Disk Sleep...
powercfg /change disk-timeout-ac 0

REM 4. USB
echo 4. اعدادات USB...
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 0

REM 5. PCI
echo 5. اعدادات PCI...
powercfg /setacvalue scheme_current sub_pciexpress aspm 0

REM 6. Disk Idle
echo 6. اعدادات القرص...
powercfg /setacvalue scheme_current sub_disk diskidle 0

REM 7. ClearType
echo 7. تفعيل ClearType...
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v FontSmoothingType /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v FontSmoothingGamma /t REG_DWORD /d 1024 /f

echo.
echo ============================================
echo DONE! اكتمل كل حاجة!
echo ============================================
pause
