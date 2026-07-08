# 🖥️ دليل إعداد Windows 11 الشامل
## AI Tools + Display & Graphics Optimization

---

## 📋 **جدول المحتويات**
1. [المسار 1: إعداد أدوات AI](#المسار-1-إعداد-أدوات-ai)
2. [المسار 2: ضبط الشاشة والألوان](#المسار-2-ضبط-الشاشة-والألوان)
3. [السكريبتات والملفات الجاهزة](#السكريبتات-والملفات-الجاهزة)

---

# المسار 1: إعداد أدوات AI

## الخطوة 1️⃣: Claude Desktop

### أ) التحقق من التثبيت
```powershell
# تحقق إذا كان Claude Desktop مثبت
$claudePath = "$env:APPDATA\Claude"
if (Test-Path $claudePath) {
    Write-Host "✅ Claude Desktop موجود في: $claudePath"
} else {
    Write-Host "❌ Claude Desktop غير مثبت"
}
```

### ب) التحميل والتثبيت
- اذهب إلى: https://claude.ai/download
- اختر Windows 11 (64-bit)
- اتبع المثبت
- أعد تشغيل الكمبيوتر بعد الانتهاء

### ج) إعداد المفتاح (API Key)
1. اذهب إلى: https://console.anthropic.com
2. سجل دخول أو أنشئ حساب
3. اذهب إلى "API Keys"
4. انقر "Create Key"
5. انسخ المفتاح (احفظه في مكان آمن)

### د) إضافة المفتاح إلى Claude Desktop
1. افتح Claude Desktop
2. اذهب إلى Settings ⚙️
3. ابحث عن "API Key"
4. الصق المفتاح
5. احفظ التغييرات

---

## الخطوة 2️⃣: OpenClaw Gateway

### أ) التحقق من التثبيت
- ابحث في قائمة البدء عن "OpenClaw Gateway Setup"
- إذا كان موجود، انقر عليه

### ب) إعدادات OpenClaw
```
1. OpenClaw Gateway Setup
   ↓
2. اختر Provider (Anthropic)
   ↓
3. أضف API Key من Claude
   ↓
4. اختر Model: claude-opus-4-1
   ↓
5. تفعيل MCP Servers
   ↓
6. اختبر الاتصال
```

### ج) ربط Claude Desktop مع OpenClaw
1. في Claude Desktop → Settings
2. ابحث عن "MCP Servers"
3. أضف:
   ```
   Name: OpenClaw
   URL: http://localhost:8000
   ```
4. احفظ وأعد التشغيل

---

## الخطوة 3️⃣: اختبار الاتصال
```powershell
# اختبر إذا كان OpenClaw يعمل
$response = Invoke-WebRequest -Uri "http://localhost:8000/health" -ErrorAction SilentlyContinue
if ($response.StatusCode -eq 200) {
    Write-Host "✅ OpenClaw يعمل بشكل صحيح"
} else {
    Write-Host "❌ OpenClaw غير متصل"
}
```

---

# المسار 2: ضبط الشاشة والألوان

## الخطوة 1️⃣: Windows 11 Display Settings

### أ) الدقة ومعدل التحديث
1. اضغط: `Win + I` (Settings)
2. اذهب إلى: System → Display → Advanced Display
3. **اختر:**
   - Resolution: 1920×1080 أو أعلى (حسب الشاشة)
   - Refresh Rate: 144Hz أو أعلى (إن أمكن)
   - Color Depth: 32-bit

### ب) تفعيل HDR (إذا كان مدعوم)
1. Settings → System → Display
2. ابحث عن "HDR and color"
3. فعّل "Use HDR"
4. اختر "HDR Standard" أو "HDR Premium"

### ج) تحسين وضوح النصوص (ClearType)
1. اضغط: `Win + R`
2. اكتب: `cttune.exe`
3. اتبع الخطوات لتحسين النصوص

### د) إعدادات Scale
1. Settings → System → Display
2. اختر Scale: 100% (للوضوح الأفضل)
3. إذا كانت الأيقونات صغيرة، استخدم 125% أو 150%

---

## الخطوة 2️⃣: إعدادات NVIDIA Control Panel

### أ) الألوان (Color Settings)
1. انقر بزر الماوس الأيمن على سطح المكتب
2. اختر "NVIDIA Control Panel"
3. اذهب إلى: Display → Adjust Desktop Color Settings

**الإعدادات المثالية:**
- **Brightness:** 50
- **Contrast:** 50
- **Gamma:** 1.0
- **Digital Vibrance:** 80 (للألعاب، 50 للعمل)
- **Hue:** 0

### ب) إعدادات الفيديو
1. في Control Panel: Display → Adjust Video Color Settings
2. **اختر:**
   - Output Color Format: RGB
   - Output Color Depth: 8 bpc (أو 10 bpc إذا كان HDR)
   - Color Range: Full
   - Dynamic Range: Full

### ج) إعدادات الألعاب (Gaming Optimization)
1. اذهب إلى: 3D Settings → Manage 3D Settings
2. اضغط على "Global Settings" وعدّل:

**الإعدادات الموصى بها:**
```
- FXAA: Off (استخدم DLSS بدلاً منه)
- Anti-Aliasing: On
- Anti-Aliasing - FXAA: Off
- Anti-Aliasing - Transparency: Off
- Maximum Pre-rendered Frames: 1
- Power management mode: Prefer maximum performance
- Shader Cache: On
- Texture Filtering - Negative LOD Bias: Clamp
- Vertical Sync: Off (للأداء الأفضل)
- Virtual Reality Pre-rendered frames: 1
```

---

## الخطوة 3️⃣: إعدادات AMD Adrenalin

### أ) الألوان (Color Settings)
1. انقر بزر الماوس الأيمن على سطح المكتب
2. اختر "AMD Radeon Settings"
3. اذهب إلى: Display → Color

**الإعدادات المثالية:**
```
- Saturation: 50
- Brightness: 50
- Contrast: 50
- Hue: 0
- Sharpness: 1.5
```

### ب) الفيديو
1. اذهب إلى: Display → Colour
2. **اختر:**
   - Color Depth: 12-bit أو 10-bit (للألوان الأفضل)
   - Color Space: RGB Full

### ج) إعدادات الألعاب
1. اذهب إلى: Gaming → Global Graphics
2. **اختر:**
   - Tessellation: On
   - Texture Filtering: High Performance
   - Surface Format Optimization: On
   - Anti-Lag: On (للألعاب)
   - Boost: On
   - Frame Rate Target Control: Off

---

## الخطوة 4️⃣: وضع الطاقة (Power Mode)

### أ) تفعيل Maximum Performance
```powershell
# فتح Power Settings
powercfg /getactivescheme

# تعيين High Performance
powercfg /setactive 8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61

# تحقق من الإعداد الحالي
powercfg /query
```

### ب) تعطيل Sleep Mode للألعاب
1. Settings → System → Power & battery
2. اختر "High performance"
3. في "Screen and sleep" اختر:
   - Screen: 5 minutes
   - Sleep: Never (للألعاب)

---

# السكريبتات والملفات الجاهزة

## 📝 السكريبت 1: تعيين الدقة ومعدل التحديث

```powershell
# Set-Resolution.ps1
# تعيين الدقة على 1920x1080 ومعدل التحديث الأقصى

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

$devMode = New-Object DisplaySettings+DEVMODE
$devMode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devMode)

# احصل على إعدادات الشاشة الحالية
[DisplaySettings]::EnumDisplaySettings($null, -1, [ref]$devMode)

# عيّن الدقة والتحديث
$devMode.dmPelsWidth = 1920
$devMode.dmPelsHeight = 1080
$devMode.dmDisplayFrequency = 144  # غيّر إلى أعلى تردد تدعمه شاشتك
$devMode.dmFields = [DisplaySettings]::DM_PELSWIDTH -bor [DisplaySettings]::DM_PELSHEIGHT -bor [DisplaySettings]::DM_DISPLAYFREQUENCY

# طبّق الإعدادات
$result = [DisplaySettings]::ChangeDisplaySettings([ref]$devMode, [DisplaySettings]::CDS_UPDATEREGISTRY)

if ($result -eq 0) {
    Write-Host "✅ تم تعيين الدقة على 1920x1080 بمعدل تحديث 144Hz"
} else {
    Write-Host "❌ فشل تغيير الإعدادات. قد لا تدعم الشاشة هذه الإعدادات."
}
```

**كيفية الاستخدام:**
1. احفظ السكريبت باسم `Set-Resolution.ps1`
2. افتح PowerShell كمسؤول
3. اكتب: `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`
4. اكتب: `.\Set-Resolution.ps1`

---

## 📝 السكريبت 2: تفعيل Maximum Performance

```powershell
# Set-PerformanceMode.ps1

Write-Host "🚀 تفعيل وضع الأداء الأقصى..."

# تعيين High Performance Power Plan
$perfGuid = "8c5e7fda-e8bf-45a6-a6cc-4b3c619a2a61"
powercfg /setactive $perfGuid

# تعطيل Sleep للشاشة (15 دقيقة)
powercfg /change monitor-timeout-ac 15

# تعطيل Sleep للقرص الصلب
powercfg /change disk-timeout-ac 0

# تفعيل USB Selective Suspend
powercfg /setacvalue scheme_current sub_usb usbselectivesuspend 0

# تفعيل PCI Express Link State Power Management
powercfg /setacvalue scheme_current sub_pciexpress aspm 0

Write-Host "✅ تم تفعيل وضع الأداء الأقصى"
powercfg /getactivescheme
```

---

## 📝 السكريبت 3: إعادة تعيين الإعدادات الافتراضية

```powershell
# Reset-DisplaySettings.ps1

Write-Host "↩️ إعادة تعيين الإعدادات الافتراضية..."

# تعيين Balanced Power Plan
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e

# إعادة تعيين Sleep
powercfg /change monitor-timeout-ac 10
powercfg /change disk-timeout-ac 0

Write-Host "✅ تم إعادة تعيين الإعدادات"
```

---

## 🎮 إعدادات NVIDIA جاهزة

### ملف إعدادات الألعاب (للمجلد):
```
C:\Program Files\NVIDIA Corporation\NVIDIA ControlPanel\tools\nvidiaProfileInspector.exe

التصدير:
1. افتح nvidiaProfileInspector
2. اختر "Global Default Profile"
3. عدّل الإعدادات حسب الجدول أدناه
4. اضغط "Export"
```

**الإعدادات المثالية:**
| الإعداد | القيمة | الفائدة |
|--------|--------|--------|
| Antialiasing | 8x MSAA | وضوح الحواف |
| Texture Filtering | High Quality | وضوح النسيج |
| Vertical Sync | Off | أداء أسرع |
| Max Prerendered Frames | 1 | تقليل التأخير |
| Power Management | Prefer Max Performance | أداء كاملة |
| Shader Cache | On | أداء أسرع |
| FXAA | Off | استخدم DLSS بدلاً منه |

---

## 🎮 إعدادات AMD جاهزة

**Game Profile للألعاب:**
| الإعداد | القيمة | الفائدة |
|--------|--------|--------|
| Texture Filtering | High Performance | سرعة أفضل |
| Anti-Lag | On | تقليل التأخير |
| Boost | On | أداء أسرع |
| Ray Tracing | On | جودة بصرية |
| FXAA | On | مكافحة التسنين |

---

## ✅ قائمة التحقق النهائية

- [ ] تثبيت Claude Desktop
- [ ] إضافة API Key من Anthropic
- [ ] إعداد OpenClaw Gateway
- [ ] ربط Claude Desktop مع OpenClaw
- [ ] اختبار الاتصال
- [ ] تعيين الدقة على 1920×1080
- [ ] تعيين معدل التحديث الأقصى
- [ ] تفعيل HDR (إذا كان مدعوم)
- [ ] ضبط إعدادات الألوان
- [ ] تفعيل وضع الأداء الأقصى
- [ ] اختبار الألعاب/التطبيقات

---

## 🆘 استكشاف الأخطاء

### المشكلة: Claude Desktop لا يتصل
**الحل:**
```powershell
# أعد تشغيل خدمة Claude
Stop-Process -Name "claude" -Force
Start-Process "C:\Users\$env:USERNAME\AppData\Local\Programs\Claude\Claude.exe"
```

### المشكلة: OpenClaw يعطي خطأ في الاتصال
**الحل:**
```powershell
# تحقق من الجدار الناري
netsh advfirewall firewall add rule name="OpenClaw" dir=in action=allow program="C:\path\to\openclaw.exe"
```

### المشكلة: الشاشة سوداء بعد تغيير الدقة
**الحل:**
1. اضغط: `Win + X` ثم اختر "Device Manager"
2. ابحث عن "Display Adapters"
3. انقر بزر الماوس الأيمن واختر "Disable"
4. أعد التشغيل
5. فعّل من جديد

---

## 📚 موارد إضافية

- [NVIDIA Control Panel Guide](https://www.nvidia.com)
- [AMD Radeon Settings Guide](https://www.amd.com)
- [Windows 11 Display Settings](https://support.microsoft.com/windows)
- [nvidiaProfileInspector Download](https://github.com/Orbmu2k/nvidiaProfileInspector)

---

**تم إنشاء هذا الدليل في: 2026-07-08**
**الإصدار: 1.0**
