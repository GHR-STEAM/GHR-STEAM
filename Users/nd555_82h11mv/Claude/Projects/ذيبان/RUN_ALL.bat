@echo off
chcp 65001 >nul
echo ============================================
echo تطبيق الإعدادات الكاملة
echo ============================================
echo.

cd /d "C:\Users\%USERNAME%\Claude\Projects\ذيبان"

echo.
echo 1️⃣ جاري تعيين الدقة...
echo ============================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '.\Set-Resolution.ps1'"

echo.
echo 2️⃣ جاري تفعيل الأداء...
echo ============================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '.\Set-PerformanceMode.ps1'"

echo.
echo ✅ اكتمل التطبيق!
echo ============================================
echo.
echo 📊 الخطوة التالية: إعدادات NVIDIA/AMD (يدويًا)
echo.
pause
