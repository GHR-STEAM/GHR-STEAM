'use client';

export default function Footer() {
  return (
    <footer className="bg-primary-900 border-t-2 border-accent-600 mt-16">
      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
          {/* About Section */}
          <div>
            <h3 className="text-xl font-bold text-gradient mb-4">وزير الفصيد</h3>
            <p className="text-gray-400 leading-relaxed">
              منصة متخصصة في الشعر النبطي الأصيل، توفر مجموعة نادرة من القصائد من أشهر الشعراء والمقرئين.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-lg font-bold text-accent-400 mb-4">الروابط السريعة</h3>
            <ul className="space-y-2 text-gray-400">
              <li>
                <a href="/categories" className="hover:text-accent-400 transition-colors">
                  التصنيفات
                </a>
              </li>
              <li>
                <a href="/reciters" className="hover:text-accent-400 transition-colors">
                  المقرئون
                </a>
              </li>
              <li>
                <a href="/about" className="hover:text-accent-400 transition-colors">
                  عن المنصة
                </a>
              </li>
              <li>
                <a href="/contact" className="hover:text-accent-400 transition-colors">
                  اتصل بنا
                </a>
              </li>
            </ul>
          </div>

          {/* Contact */}
          <div>
            <h3 className="text-lg font-bold text-accent-400 mb-4">تواصل معنا</h3>
            <ul className="space-y-2 text-gray-400">
              <li>البريد الإلكتروني: info@alqaseed.com</li>
              <li>الهاتف: +966 50 XXX XXXX</li>
              <li>العنوان: المملكة العربية السعودية</li>
            </ul>
          </div>
        </div>

        {/* Social Links */}
        <div className="flex justify-center gap-6 mb-8 border-t border-primary-800 pt-8">
          <a href="#" className="text-2xl hover:text-accent-400 transition-colors">
            📱
          </a>
          <a href="#" className="text-2xl hover:text-accent-400 transition-colors">
            🐦
          </a>
          <a href="#" className="text-2xl hover:text-accent-400 transition-colors">
            📧
          </a>
          <a href="#" className="text-2xl hover:text-accent-400 transition-colors">
            🎥
          </a>
        </div>

        {/* Copyright */}
        <div className="text-center text-gray-500 border-t border-primary-800 pt-8">
          <p>© 2024 وزير الفصيد. جميع الحقوق محفوظة</p>
          <p className="text-sm mt-2">صُنع بـ ❤️ لعشاق الشعر النبطي الأصيل</p>
        </div>
      </div>
    </footer>
  );
}
