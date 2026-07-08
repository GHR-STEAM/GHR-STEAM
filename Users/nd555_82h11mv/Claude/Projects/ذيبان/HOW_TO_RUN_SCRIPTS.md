# 🚀 كيفية تشغيل السكريبتات

## المتطلبات المسبقة
- Windows 11 (64-bit)
- PowerShell (مدمج في Windows)
- صلاحيات المسؤول (Admin)

---

## الطريقة 1️⃣: تشغيل السكريبت مباشرة

### الخطوة 1: فتح PowerShell كمسؤول
```
1. اضغط: Win + X
2. اختر: Windows PowerShell (Admin)
   أو: Windows Terminal (Admin)
```

### الخطوة 2: الانتقال إلى مجلد السكريبتات
```powershell
cd "C:\Users\$env:USERNAME\Claude\Projects\ذيبان"
```

### الخطوة 3: السماح بتشغيل السكريبتات (مرة واحدة فقط)
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

### الخطوة 4: تشغيل السكريبت المطلوب

#### 📊 السكريبتات الجديدة (الفحص):
```powershell
# ✨ جديد: فحص الإعدادات الحالية
.\Check-CurrentSettings.ps1

# ✨ جديد: البحث عن الترددات المدعومة
.\Get-SupportedRefreshRates.ps1
```

#### ⚙️ السكريبتات الرئيسية:
```powershell
# 🔧 محسّن: تعيين الدقة مع خيارات تفاعلية
.\Set-Resolution.ps1

# تفعيل وضع الأداء الأقصى
.\Set-PerformanceMode.ps1

# 🔧 محسّن: إعادة تعيين شاملة (Power + Display)
.\Reset-DisplaySettings.ps1
```

---

## 🎯 شرح السكريبتات الجديدة والمحسّنة

### ✨ Check-CurrentSettings.ps1 (جديد)
**الغرض:** فحص سريع للإعدادات الحالية

**ما يعرضه:**
- الدقة الحالية ومعدل التحديث
- خطة الطاقة النشطة
- معلومات GPU
- معلومات النظام

**الاستخدام:**
```powershell
.\Check-CurrentSettings.ps1
```

**متى تستخدمه:** قبل تطبيق أي تغييرات

---

### ✨ Get-SupportedRefreshRates.ps1 (جديد)
**الغرض:** البحث عن جميع الترددات المدعومة من الشاشة

**ما يفعله:**
- يبحث عن جميع معدلات التحديث المتاحة
- يعرض التردد الحالي والأعلى المدعوم
- يوصي بالتردد حسب الاستخدام

**الاستخدام:**
```powershell
.\Get-SupportedRefreshRates.ps1
```

**متى تستخدمه:** إذا كنت غير متأكد من الترددات المدعومة

---

### 🔧 Set-Resolution.ps1 (محسّن)
**التحسينات:**
- الآن يوفر خيارات متعددة للدقة بدلاً من 1920x1080 الثابت
- واجهة تفاعلية لاختيار معدل التحديث بدلاً من 144Hz الثابت
- دعم الدقات المخصصة والترددات المخصصة

**الخيارات المتاحة:**
- دقات: 1920×1080, 1680×1050, 1600×900, 1280×720, مخصص
- ترددات: 60Hz, 75Hz, 120Hz, 144Hz, 165Hz, 240Hz, مخصص

**الاستخدام:**
```powershell
.\Set-Resolution.ps1
# ثم اتبع التعليمات التفاعلية
```

---

### 🔧 Reset-DisplaySettings.ps1 (محسّن)
**التحسينات:**
- الآن يعيد الدقة أيضاً (وليس فقط Power Plan)
- يعيد الدقة إلى 1920×1080 @ 60Hz الافتراضية
- رسائل أوضح عن الإعدادات المُعادة

**الاستخدام:**
```powershell
.\Reset-DisplaySettings.ps1
```

---

## 📋 الترتيب الموصى به للاستخدام

### للاستخدام الأول:
```powershell
1. .\Check-CurrentSettings.ps1        # افحص الإعدادات الحالية
2. .\Get-SupportedRefreshRates.ps1    # تحقق من الترددات المدعومة
3. .\Set-Resolution.ps1                # طبّق الإعدادات المطلوبة
4. .\Set-PerformanceMode.ps1          # فعّل الأداء الأقصى
```

### للاستخدام اليومي:
```powershell
# فقط شغّل:
.\Set-PerformanceMode.ps1
```

### للعودة للإعدادات الافتراضية:
```powershell
.\Reset-DisplaySettings.ps1
```

---

## الطريقة 2️⃣: إنشاء اختصار سريع (Shortcut)

### لـ Set-Resolution.ps1:

1. **انقر بزر الماوس الأيمن على سطح المكتب**
2. **اختر: New → Shortcut**
3. **أدخل المسار التالي:**
```
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Users\%USERNAME%\Claude\Projects\ذيبان\Set-Resolution.ps1'"
```
4. **اضغط: Next**
5. **اكتب الاسم:** Set Resolution
6. **اضغط: Finish**

### لـ Set-PerformanceMode.ps1:

1. **انقر بزر الماوس الأيمن على سطح المكتب**
2. **اختر: New → Shortcut**
3. **أدخل المسار التالي:**
```
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Users\%USERNAME%\Claude\Projects\ذيبان\Set-PerformanceMode.ps1'"
```
4. **اضغط: Next**
5. **اكتب الاسم:** Performance Mode
6. **اضغط: Finish**

### إعدادات الاختصار (للتشغيل كمسؤول):

1. **انقر بزر الماوس الأيمن على الاختصار**
2. **اختر: Properties**
3. **اذهب إلى: Advanced**
4. **فعّل: "Run as administrator"**
5. **اضغط: OK**

---

## الطريقة 3️⃣: إنشاء ملف Batch (BAT)

### إنشاء ملف Set-Resolution.bat:

1. **افتح Notepad**
2. **انسخ المحتوى التالي:**
```batch
@echo off
cd /d "%USERPROFILE%\Claude\Projects\ذيبان"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '.\Set-Resolution.ps1'"
pause
```
3. **احفظ باسم:** `Set-Resolution.bat`
4. **انقر بزر الماوس الأيمن → Properties**
5. **اختر: Advanced**
6. **فعّل: "Run as administrator"**
7. **اضغط OK**

### تشغيل ملف BAT:
```
1. انقر نقرتين على الملف
2. أو انقر بزر الماوس الأيمن واختر: Run as administrator
```

---

## 🎮 خطوات تطبيق الإعدادات الكاملة

### الخطوة 1: إعداد الشاشة والدقة
```powershell
# شغّل هذا السكريبت أولاً
.\Set-Resolution.ps1
```
**الإعدادات:**
- الدقة: 1920x1080
- معدل التحديث: 144Hz (عدّل حسب شاشتك)

### الخطوة 2: تفعيل الأداء الأقصى
```powershell
# شغّل هذا السكريبت ثانياً
.\Set-PerformanceMode.ps1
```
**الإعدادات:**
- Power Plan: High Performance
- Screen Timeout: 15 دقيقة
- Disk Timeout: معطل

### الخطوة 3: إعدادات NVIDIA (يدويًا)
1. انقر بزر الماوس الأيمن على سطح المكتب
2. اختر: NVIDIA Control Panel
3. اذهب إلى: Display → Adjust Desktop Color Settings
4. طبّق الإعدادات من الملف `Display_Color_Settings.json`

### الخطوة 4: إعدادات AMD (يدويًا)
1. انقر بزر الماوس الأيمن على سطح المكتب
2. اختر: AMD Radeon Settings
3. اذهب إلى: Display → Color
4. طبّق الإعدادات من الملف `Display_Color_Settings.json`

---

## ⚠️ استكشاف الأخطاء

### المشكلة: "لم يتم العثور على الملف"
**الحل:**
```powershell
# تحقق من المسار الصحيح
Get-ChildItem -Path "C:\Users\$env:USERNAME\Claude\Projects\ذيبان" -Filter "*.ps1"
```

### المشكلة: "لا توجد صلاحيات كافية"
**الحل:**
```
1. افتح PowerShell كمسؤول
2. اكتب: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
3. اكتب: Y (لتأكيد)
4. شغّل السكريبت مرة أخرى
```

### المشكلة: السكريبت لا يعمل
**الحل:**
```powershell
# جرب هذا الأمر
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
# ثم شغّل السكريبت
.\Set-Resolution.ps1
```

---

## 📊 ملفات الإعدادات

### Display_Color_Settings.json
**يحتوي على:**
- ✅ إعدادات Windows Display
- ✅ إعدادات NVIDIA (Global + Gaming)
- ✅ إعدادات AMD (Color + Gaming)
- ✅ إعدادات Power Management
- ✅ Gaming vs Productivity Profiles

**كيفية الاستخدام:**
```
1. افتح الملف بـ Notepad
2. ابحث عن الإعدادات المطلوبة
3. اكتبها يدويًا في الإعدادات المقابلة
4. أو استخدمها كمرجع
```

---

## 🔄 تسلسل التطبيق الموصى به

### للألعاب (Gaming):
```
1. .\Set-Resolution.ps1      → 1920x1080 @ 144Hz
2. .\Set-PerformanceMode.ps1 → High Performance
3. إعدادات NVIDIA/AMD (يدويًا) → Gaming Profile
4. اختبر في لعبة
```

### للعمل (Productivity):
```
1. .\Set-Resolution.ps1      → 1920x1080 @ 60Hz
2. .\Reset-DisplaySettings.ps1 → Balanced Mode
3. إعدادات NVIDIA/AMD (يدويًا) → Productivity Profile
4. اختبر في التطبيقات
```

---

## ✅ قائمة التحقق

- [ ] فتح PowerShell كمسؤول
- [ ] الانتقال إلى مجلد السكريبتات
- [ ] السماح بتشغيل السكريبتات
- [ ] تشغيل Set-Resolution.ps1
- [ ] تشغيل Set-PerformanceMode.ps1
- [ ] تطبيق إعدادات NVIDIA أو AMD
- [ ] اختبار الإعدادات
- [ ] إعادة تشغيل الكمبيوتر (اختياري)

---

## 📞 المساعدة

- **في حالة المشاكل:** استخدم Reset-DisplaySettings.ps1 لإعادة الإعدادات الافتراضية
- **للمزيد من المعلومات:** اقرأ Windows11_Setup_Complete_Guide.md
- **لتعديل الإعدادات:** عدّل القيم في Display_Color_Settings.json

---

**آخر تحديث:** 2026-07-08
**الإصدار:** 1.0
