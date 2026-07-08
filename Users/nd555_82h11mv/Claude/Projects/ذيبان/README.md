# 📦 مشروع إعداد Windows 11 الشامل
## AI Tools Setup + Display & Graphics Optimization

**الإصدار:** 1.0  
**التاريخ:** 2026-07-08  
**الحالة:** ✅ جاهز للاستخدام

---

## 📋 المحتويات

هذا المشروع يحتوي على دليل شامل وسكريبتات جاهزة لـ:

### 🎯 المسار الأول: إعداد أدوات الذكاء الاصطناعي (AI Tools)
- ✅ تثبيت Claude Desktop
- ✅ إضافة Anthropic API Key
- ✅ إعداد OpenClaw Gateway
- ✅ ربط Claude Desktop مع OpenClaw
- ✅ اختبار الاتصال

### 🎨 المسار الثاني: تحسين الشاشة والألوان (Display & Graphics)
- ✅ ضبط الدقة ومعدل التحديث
- ✅ تفعيل HDR
- ✅ تحسين وضوح النصوص
- ✅ إعدادات NVIDIA Control Panel
- ✅ إعدادات AMD Adrenalin
- ✅ تفعيل وضع الأداء الأقصى

---

## 📂 الملفات المتضمنة

### 📖 الأدلة (Guides)
| الملف | الوصف |
|------|-------|
| `Windows11_Setup_Complete_Guide.md` | دليل شامل لكل شيء |
| `HOW_TO_RUN_SCRIPTS.md` | تعليمات تشغيل السكريبتات |
| `README.md` | هذا الملف |

### 🔧 السكريبتات (Scripts)

#### 📊 سكريبتات الفحص والمساعدة:
| الملف | الوصف | الاستخدام |
|------|-------|----------|
| `Check-CurrentSettings.ps1` | ✨ **جديد** - فحص سريع للإعدادات الحالية | `.\Check-CurrentSettings.ps1` |
| `Get-SupportedRefreshRates.ps1` | ✨ **جديد** - البحث عن الترددات المدعومة | `.\Get-SupportedRefreshRates.ps1` |

#### ⚙️ سكريبتات التطبيق الرئيسية:
| الملف | الوصف | الاستخدام |
|------|-------|----------|
| `Set-Resolution.ps1` | 🔧 **محسّن** - تعيين الدقة مع اختيار معدل التحديث | `.\Set-Resolution.ps1` |
| `Set-PerformanceMode.ps1` | تفعيل وضع الأداء الأقصى | `.\Set-PerformanceMode.ps1` |
| `Reset-DisplaySettings.ps1` | 🔧 **محسّن** - إعادة تعيين شاملة (Power + Display) | `.\Reset-DisplaySettings.ps1` |

### ⚙️ الإعدادات (Configuration)
| الملف | الوصف |
|------|-------|
| `Display_Color_Settings.json` | إعدادات جاهزة (NVIDIA, AMD, Windows) |

---

## 🚀 البدء السريع

### الطريقة الأسرع (4 خطوات محسّنة):

#### 1️⃣ افتح PowerShell كمسؤول
```powershell
Win + X → Windows PowerShell (Admin)
```

#### 2️⃣ اذهب إلى مجلد السكريبتات
```powershell
cd "C:\Users\$env:USERNAME\Claude\Projects\ذيبان"
```

#### 3️⃣ السماح بتشغيل السكريبتات
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

#### 4️⃣ شغّل السكريبتات (الترتيب الموصى به):
```powershell
# ✨ جديد: فحص الإعدادات الحالية أولاً
.\Check-CurrentSettings.ps1

# ✨ جديد: (اختياري) البحث عن الترددات المدعومة
.\Get-SupportedRefreshRates.ps1

# تعيين الدقة ومعدل التحديث (مع خيارات تفاعلية)
.\Set-Resolution.ps1

# تفعيل الأداء الأقصى
.\Set-PerformanceMode.ps1
```

### 💡 ملاحظات مهمة:
- **Check-CurrentSettings.ps1** يعرض الإعدادات الحالية قبل البدء
- **Get-SupportedRefreshRates.ps1** يساعد على اختيار التردد الصحيح للشاشة
- **Set-Resolution.ps1** الآن يوفر خيارات متعددة بدلاً من 144Hz الثابت
- **Reset-DisplaySettings.ps1** الآن يعيد الدقة أيضاً (لا فقط Power Plan)

---

## 📊 الإعدادات المثالية

### Windows Display
- **الدقة:** 1920×1080
- **معدل التحديث:** 144Hz
- **HDR:** مفعّل (إذا كان مدعوم)
- **Scaling:** 100%

### NVIDIA
```
• Brightness: 50
• Contrast: 50
• Gamma: 1.0
• Digital Vibrance: 80 (ألعاب), 50 (عمل)
• V-Sync: معطل (ألعاب), مفعّل (عمل)
```

### AMD
```
• Saturation: 50
• Brightness: 50
• Contrast: 50
• Sharpness: 1.5
• Anti-Lag: مفعّل
• Boost: مفعّل
```

### Power Management
```
• Power Plan: High Performance (ألعاب)
• Power Plan: Balanced (عمل)
• Screen Timeout: 15 دقيقة
• Disk Timeout: معطل
```

---

## 🎮 حالات الاستخدام

### للألعاب (Gaming)
```
1. تشغيل Set-Resolution.ps1 (1920×1080 @ 144Hz)
2. تشغيل Set-PerformanceMode.ps1
3. إعدادات NVIDIA/AMD (Gaming Profile)
4. النتيجة: أداء أعلى + جودة بصرية جيدة
```

### للعمل (Productivity)
```
1. تشغيل Set-Resolution.ps1 (1920×1080 @ 60Hz)
2. تشغيل Reset-DisplaySettings.ps1 (Balanced Mode)
3. إعدادات NVIDIA/AMD (Productivity Profile)
4. النتيجة: توازن بين الأداء والقوة
```

### لمشاهدة الأفلام (Movies)
```
1. تفعيل HDR (إذا كان مدعوم)
2. Digital Vibrance: 60-70
3. Brightness/Contrast: متوازن
4. النتيجة: جودة بصرية عالية
```

---

## ⚠️ ملاحظات مهمة

### قبل التطبيق
- ✅ تأكد من فتح PowerShell كمسؤول
- ✅ عمل نسخة احتياطية من الإعدادات الحالية
- ✅ إغلاق البرامج التي تستخدم الشاشة
- ✅ تحديث تعريفات الشاشة

### بعد التطبيق
- 📷 اختبر الإعدادات في لعبة أو برنامج
- 🔄 إذا كانت هناك مشاكل، استخدم Reset-DisplaySettings.ps1
- 💾 احفظ الإعدادات المفضلة لك

### استهلاك البطارية
- ⚠️ تفعيل High Performance قد يزيد استهلاك البطارية على اللاب توب
- 💡 استخدم Balanced Mode للعمل اليومي
- 🎮 استخدم High Performance فقط عند اللعب

---

## 🔧 استكشاف الأخطاء

### المشكلة: دقة الشاشة لا تتغير
```
الحل: 
1. تأكد من أن الدقة مدعومة من الشاشة
2. عدّل قيمة معدل التحديث إلى أقل (60Hz أو 75Hz)
3. أعد تشغيل البرنامج
```

### المشكلة: PowerShell لا يسمح بتشغيل السكريبتات
```
الحل:
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

### المشكلة: الإعدادات لم تتطبق
```
الحل:
1. افتح PowerShell كمسؤول بالفعل
2. أعد التشغيل
3. شغّل السكريبت مرة أخرى
```

---

## 📚 موارد إضافية

- [Windows 11 Display Settings](https://support.microsoft.com/windows)
- [NVIDIA Control Panel](https://www.nvidia.com/Download/driverDetails.aspx)
- [AMD Radeon Settings](https://www.amd.com/en/support)
- [PowerShell Documentation](https://docs.microsoft.com/powershell)

---

## 🆘 الحصول على الدعم

### إذا واجهت مشاكل:

1. **اقرأ الدليل:**
   - `Windows11_Setup_Complete_Guide.md`
   - `HOW_TO_RUN_SCRIPTS.md`

2. **استعد الإعدادات الافتراضية:**
   ```powershell
   .\Reset-DisplaySettings.ps1
   ```

3. **ابحث عن حلول في:**
   - قسم "استكشاف الأخطاء" في الأدلة
   - موقع NVIDIA أو AMD الرسمي
   - Microsoft Support

---

## 📝 التحديثات

### الإصدار 1.0 (2026-07-08)
- ✅ دليل شامل (English + Arabic)
- ✅ 3 سكريبتات PowerShell
- ✅ ملف إعدادات JSON
- ✅ تعليمات مفصلة
- ✅ حل مشاكل شامل

---

## ✨ الميزات

- ✅ **سهل الاستخدام:** انقر نقرتين لتشغيل السكريبتات
- ✅ **معطّل آمن:** إعادة تعيين بسيطة للإعدادات
- ✅ **موثق بالكامل:** أدلة مفصلة لكل خطوة
- ✅ **متعدد اللغات:** English + العربية
- ✅ **مرن:** يعمل مع NVIDIA و AMD
- ✅ **منظم:** ملفات منظمة وسهلة الاستخدام

---

## 🎯 أهداف المشروع

| الهدف | الحالة |
|------|--------|
| إعداد أدوات الذكاء الاصطناعي | ✅ اكتمل |
| تحسين الشاشة والألوان | ✅ اكتمل |
| توفير سكريبتات جاهزة | ✅ اكتمل |
| توثيق شامل | ✅ اكتمل |
| حل مشاكل شامل | ✅ اكتمل |

---

## 📞 تواصل وملاحظات

إذا كان لديك أي:
- ✉️ **استفسارات:** اقرأ الأدلة أولاً
- 🐛 **مشاكل:** استخدم Reset-DisplaySettings.ps1
- 💡 **اقتراحات:** أخبرني بالتحسينات المطلوبة

---

**شكراً لاستخدام هذا المشروع!** 🎉

**آخر تحديث:** 2026-07-08  
**الإصدار:** 1.0  
**الحالة:** ✅ مستقر وجاهز للاستخدام
