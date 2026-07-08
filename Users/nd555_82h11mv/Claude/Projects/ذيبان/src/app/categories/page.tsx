import Header from '@/components/Header';
import Footer from '@/components/Footer';
import CategoryCard from '@/components/CategoryCard';
import { categories } from '@/data/poems';

export const metadata = {
  title: 'التصنيفات | وزير الفصيد',
  description: 'استكشف جميع تصنيفات الشعر النبطي',
};

export default function CategoriesPage() {
  return (
    <>
      <Header />

      <main className="flex-1">
        {/* Page Header */}
        <section className="py-16 px-4 bg-gradient-to-b from-primary-900 to-primary-950 border-b border-primary-800">
          <div className="max-w-7xl mx-auto text-center">
            <h1 className="text-5xl md:text-6xl font-heading font-bold mb-4">
              <span className="text-gradient">تصنيفات الشعر</span>
            </h1>
            <p className="text-gray-400 text-lg max-w-2xl mx-auto">
              اكتشف أنواع الشعر النبطي المختلفة واستكشف كل تصنيف من تصنيفاتنا الغنية
            </p>
          </div>
        </section>

        {/* Categories Grid */}
        <section className="py-20 px-4">
          <div className="max-w-7xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {categories.map((category) => (
                <CategoryCard key={category.id} category={category} />
              ))}
            </div>
          </div>
        </section>

        {/* Info Section */}
        <section className="py-16 px-4 bg-primary-900/50">
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl font-heading font-bold mb-8 text-center text-accent-400">
              عن تصنيفاتنا
            </h2>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="card p-6">
                <h3 className="text-xl font-bold text-accent-400 mb-3">🎨 متنوعة وشاملة</h3>
                <p className="text-gray-400">
                  تجميع شامل لجميع أنواع الشعر النبطي من الحب والرومانسية إلى الشرف والكرامة
                </p>
              </div>

              <div className="card p-6">
                <h3 className="text-xl font-bold text-accent-400 mb-3">🎯 منظم بعناية</h3>
                <p className="text-gray-400">
                  كل قصيدة مصنفة بدقة لسهولة البحث والاستكشاف والعثور على ما تحب
                </p>
              </div>

              <div className="card p-6">
                <h3 className="text-xl font-bold text-accent-400 mb-3">📊 إحصائيات محدثة</h3>
                <p className="text-gray-400">
                  عدد القصائد في كل تصنيف محدّث باستمرار مع إضافة القصائد الجديدة
                </p>
              </div>

              <div className="card p-6">
                <h3 className="text-xl font-bold text-accent-400 mb-3">🌟 اختيار متميز</h3>
                <p className="text-gray-400">
                  اختيار دقيق من أفضل القصائد والأصوات لكل تصنيف ليمثله بشكل أمثل
                </p>
              </div>
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </>
  );
}
