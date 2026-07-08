# 🚀 دليل النشر - وزير الفصيد

## خطوات النشر على Vercel (الخيار الأسهل)

### 1️⃣ إعداد GitHub

```bash
# تهيئة git إذا لم يكن موجوداً
git init
git add .
git commit -m "Initial commit"

# إنشاء مستودع على GitHub وربطه
git remote add origin <your-github-url>
git push -u origin main
```

### 2️⃣ النشر على Vercel

**طريقة 1: عبر واجهة Vercel**
1. اذهب إلى https://vercel.com
2. انقر على "Log in" وسجل دخولك بـ GitHub
3. انقر على "Add New..." → "Project"
4. اختر المستودع الذي أنشأته
5. اضغط "Import"
6. في الإعدادات:
   - **Framework Preset**: Next.js
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next`
7. انقر **Deploy**

✨ **تم! موقعك مباشر الآن!**

**طريقة 2: عبر CLI**
```bash
# تثبيت Vercel CLI
npm install -g vercel

# تسجيل الدخول
vercel login

# نشر المشروع
vercel
```

### 3️⃣ الحصول على رابط مباشر

بعد النشر، ستحصل على رابط مشابه لهذا:
```
https://wazir-alqaseed.vercel.app
```

## 🎯 التحقق من النشر

✅ تأكد من:
- [ ] الموقع يحمل بسرعة
- [ ] التصميم يظهر صحيحاً
- [ ] الأصوات تعمل
- [ ] التنقل يعمل على الجوال
- [ ] جميع الصفحات متاحة

## 📝 تحديثات المستقبل

كلما دفعت تحديثات جديدة إلى GitHub:
```bash
git add .
git commit -m "Your update message"
git push
```

**Vercel سينشر تلقائياً! 🎉**

## 🔧 إضافة نطاق مخصص (Domain)

1. اشتر نطاق من:
   - Namecheap
   - GoDaddy
   - أو أي موفر آخر

2. في Vercel:
   - اذهب إلى Project Settings
   - اختر "Domains"
   - أضف نطاقك الجديد
   - اتبع التعليمات

## 🚨 استكشاف الأخطاء

### الموقع بطيء؟
- تحقق من Lighthouse Score في Vercel
- تأكد من أن الصور محسنة
- فعّل compression

### الأصوات لا تعمل؟
- تأكد من أن ملفات mp3 موجودة في `public/audio/`
- تحقق من المسارات في `src/data/poems.ts`

### خطأ في البناء؟
- شغّل `npm run build` محلياً للتحقق
- تحقق من الأخطاء في التطبيق

## 📊 المراقبة

في لوحة Vercel:
- مراقبة سرعة البناء
- عرض الأخطاء والتحذيرات
- إحصائيات الأداء

## 🎉 هنيئاً!

موقعك الآن **مباشر وجاهز للعالم**! 🌍

---

**هل تحتاج مساعدة؟** تواصل معنا: info@alqaseed.com
