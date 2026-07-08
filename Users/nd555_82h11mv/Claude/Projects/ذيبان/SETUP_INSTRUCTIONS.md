# ⚡ تعليمات الإعداد السريع

## ✅ ما تم إنجازه

تم إنشاء منصة شعر نبطي حديثة وكاملة مع:

✨ **التصميم:**
- واجهة داكنة فاخرة بلمسات ذهبية
- دعم RTL عربي كامل
- تصميم متجاوب (Mobile-First)
- أنماط احترافية وحديثة

🎵 **الميزات:**
- مشغل صوت متقدم
- 6 تصنيفات منظمة
- قائمة مقرئين
- نظام ملاحة كامل
- صفحات متعددة (الرئيسية، التصنيفات، المقرئون، حول)

🛠️ **البنية التقنية:**
- Next.js 14 (أحدث إصدار)
- TypeScript للأمان
- Tailwind CSS للتصميم
- إعدادات Vercel جاهزة

---

## 📋 الملفات المُنشأة

```
📁 ذيبان/
├── 📁 src/
│   ├── 📁 app/
│   │   ├── layout.tsx              # تخطيط التطبيق
│   │   ├── page.tsx                # الصفحة الرئيسية
│   │   ├── globals.css             # الأنماط العامة
│   │   ├── 📁 categories/          # صفحة التصنيفات
│   │   ├── 📁 reciters/            # صفحة المقرئين
│   │   ├── 📁 about/               # صفحة المعلومات
│   │   └── not-found.tsx           # صفحة 404
│   ├── 📁 components/
│   │   ├── Header.tsx              # الرأس والقائمة
│   │   ├── Footer.tsx              # التذييل
│   │   ├── PoemCard.tsx            # بطاقة القصيدة
│   │   ├── AudioPlayer.tsx         # مشغل الصوت
│   │   └── CategoryCard.tsx        # بطاقة التصنيف
│   └── 📁 data/
│       └── poems.ts                # البيانات
├── 📁 public/                      # الملفات العامة
│   └── 📁 audio/                   # ملفات الصوت (أضفها هنا)
├── package.json                    # المتطلبات
├── next.config.js                  # إعدادات Next.js
├── tailwind.config.js              # إعدادات Tailwind
├── tsconfig.json                   # إعدادات TypeScript
├── postcss.config.js               # إعدادات PostCSS
├── vercel.json                     # إعدادات Vercel
├── .gitignore                      # ملفات Git المستبعدة
├── README_AR.md                    # التعليمات بالعربية
├── DEPLOYMENT.md                   # دليل النشر
└── هذا الملف                      # تعليمات الإعداد

```

---

## 🚀 خطوات البدء

### الخطوة 1: فتح Terminal في المجلد

```bash
cd "C:\Users\nd555_82h11mv\Claude\Projects\ذيبان"
```

### الخطوة 2: تثبيت المتطلبات

```bash
npm install
```

(سيستغرق 2-3 دقائق)

### الخطوة 3: تشغيل التطبيق محلياً

```bash
npm run dev
```

اذهب إلى: `http://localhost:3000`

**ستري الموقع بشكل مباشر! 🎉**

---

## 📝 إضافة الملفات الصوتية

1. ضع ملفات MP3 في المجلد: `public/audio/`

مثال:
```
public/
└── audio/
    ├── poem1-1.mp3
    ├── poem1-2.mp3
    ├── poem2-1.mp3
    └── ...
```

2. في `src/data/poems.ts`، أضف المسارات:
```typescript
audioUrl: '/audio/poem1-1.mp3'
```

---

## 🌐 النشر على Vercel (خطوات سريعة)

### الخطوة 1: إعداد Git

```bash
git init
git add .
git commit -m "Initial commit"
```

### الخطوة 2: دفع إلى GitHub

1. أنشئ مستودع على GitHub
2. اربط المستودع:
```bash
git remote add origin <github-url>
git push -u origin main
```

### الخطوة 3: النشر على Vercel

1. اذهب إلى https://vercel.com
2. اضغط "New Project"
3. اختر المستودع
4. اضغط "Deploy"

**تم! الموقع مباشر الآن! 🎊**

---

## ✏️ تخصيص المحتوى

### تغيير البيانات

في `src/data/poems.ts`:

**إضافة قصيدة:**
```typescript
{
  id: 'poem-new',
  title: 'عنوان القصيدة',
  poet: 'الشاعر',
  category: 'love',  // أو أي تصنيف آخر
  text: 'نص القصيدة...',
  reciters: [
    {
      id: 'reciter-x',
      name: 'اسم المقرئ',
      audioUrl: '/audio/poem-file.mp3',
      duration: '3:45',
    },
  ],
}
```

### تغيير الألوان

في `tailwind.config.js`:
- `colors.primary` - الألوان الداكنة
- `colors.accent` - ألوان الذهب

---

## 🎯 الخطوات التالية

- [ ] تثبيت المتطلبات: `npm install`
- [ ] اختبار محلياً: `npm run dev`
- [ ] إضافة ملفات الصوت
- [ ] إعداد GitHub
- [ ] النشر على Vercel
- [ ] اختبار الموقع المباشر
- [ ] إضافة نطاق مخصص (اختياري)

---

## 📚 الموارد الإضافية

📖 **ملفات التوثيق:**
- `README_AR.md` - معلومات عامة
- `DEPLOYMENT.md` - دليل النشر المفصل
- `next.config.js` - إعدادات التطبيق

🔗 **روابط مفيدة:**
- https://nextjs.org/docs - توثيق Next.js
- https://vercel.com/docs - توثيق Vercel
- https://tailwindcss.com - Tailwind CSS

---

## 🆘 استكشاف الأخطاء الشائعة

| المشكلة | الحل |
|--------|------|
| الأصوات لا تعمل | تأكد من وضع ملفات mp3 في `public/audio/` |
| خطأ في البناء | شغّل `npm run build` محلياً لرؤية الخطأ |
| الموقع بطيء | تأكد من تحسين الصور والملفات الصوتية |
| مشاكل RTL | تأكد من وجود `dir="rtl"` في `html` |

---

## 🎉 تم النشر!

عندما يكون موقعك مباشراً على Vercel، ستحصل على رابط مثل:
```
https://your-project-name.vercel.app
```

**شارك الرابط مع الجميع! 🌍**

---

## 📞 هل تحتاج المساعدة؟

راجع:
1. `README_AR.md` - للمعلومات العامة
2. `DEPLOYMENT.md` - لمشاكل النشر
3. `src/` - للتعديلات البرمجية

---

**استمتع بمنصتك الشعرية الجديدة! 🌙✨**

صُنع بـ ❤️ لعشاق الشعر النبطي الأصيل
