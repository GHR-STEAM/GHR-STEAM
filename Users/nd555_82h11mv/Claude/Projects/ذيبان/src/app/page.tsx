import Header from '@/components/Header';
import Footer from '@/components/Footer';
import PoemCard from '@/components/PoemCard';
import CategoryCard from '@/components/CategoryCard';
import { poems, categories } from '@/data/poems';

export default function Home() {
  const latestPoems = poems.slice(0, 3);

  return (
    <>
      <Header />

      <main className="flex-1">
        {/* Hero Section */}
        <section className="relative py-20 px-4 overflow-hidden">
          {/* Background gradient */}
          <div className="absolute inset-0 bg-gradient-to-b from-primary-900 to-primary-950 -z-10" />
          <div className="absolute inset-0 opacity-30 -z-10">
            <div className="absolute top-20 right-10 w-96 h-96 bg-accent-600/20 rounded-full blur-3xl" />
            <div className="absolute bottom-20 left-10 w-96 h-96 bg-accent-600/10 rounded-full blur-3xl" />
          </div>

          <div className="max-w-7xl mx-auto text-center">
            {/* Main Icon */}
            <div className="text-8xl mb-6 animate-bounce">🌙</div>

            {/* Title */}
            <h1 className="text-5xl md:text-7xl font-heading font-bold mb-6">
              <span className="text-gradient">وزير الفصيد</span>
            </h1>

            {/* Subtitle */}
            <p className="text-2xl text-accent-400 mb-8 font-semibold">
              منصة الشعر النبطي الأصيل
            </p>

            {/* Description */}
            <p className="text-gray-400 text-lg max-w-2xl mx-auto mb-8 leading-relaxed">
              اسمع أجمل القصائد النبطية من أفضل الشعراء والمقرئين، استكشف التصنيفات المختلفة، وانغمس في عالم الشعر الأصيل
            </p>

            {/* CTA Buttons */}
            <div className="flex gap-4 justify-center flex-wrap">
              <button className="btn-primary">
                استكشف القصائد ✨
              </button>
              <button className="btn-secondary">
                اعرف أكثر 📖
              </button>
            </div>
          </div>
        </section>

        {/* Stats Section */}
        <section className="py-16 px-4 bg-primary-900/50 border-y border-primary-800">
          <div className="max-w-7xl mx-auto">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
              {[
                { number: poems.length, label: 'قصيدة' },
                { number: 'أكثر من 15', label: 'قارئ محترف' },
                { number: categories.length, label: 'تصنيف' },
                { number: 'آلاف', label: 'المستمعين' },
              ].map((stat, i) => (
                <div key={i} className="text-center">
                  <div className="text-3xl md:text-4xl font-bold text-accent-400 mb-2">
                    {stat.number}
                  </div>
                  <div className="text-gray-400 text-sm md:text-base">{stat.label}</div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Categories Section */}
        <section className="py-20 px-4">
          <div className="max-w-7xl mx-auto">
            <h2 className="text-4xl font-heading font-bold text-center mb-4 text-accent-400">
              تصنيفات الشعر
            </h2>
            <p className="text-center text-gray-400 mb-12">
              استكشف أنواع الشعر النبطي المختلفة واختر ما يناسب ذوقك
            </p>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {categories.map((category) => (
                <CategoryCard key={category.id} category={category} />
              ))}
            </div>
          </div>
        </section>

        {/* Latest Poems Section */}
        <section className="py-20 px-4 bg-primary-900/30">
          <div className="max-w-7xl mx-auto">
            <h2 className="text-4xl font-heading font-bold text-center mb-4 text-accent-400">
              أحدث القصائد
            </h2>
            <p className="text-center text-gray-400 mb-12">
              اكتشف أحدث الإضافات في مجموعتنا من الشعر النبطي الفريد
            </p>

            <div className="grid grid-cols-1 gap-8">
              {latestPoems.map((poem) => (
                <PoemCard key={poem.id} poem={poem} />
              ))}
            </div>

            <div className="text-center mt-12">
              <button className="btn-primary">
                عرض جميع القصائد →
              </button>
            </div>
          </div>
        </section>

        {/* Features Section */}
        <section className="py-20 px-4">
          <div className="max-w-7xl mx-auto">
            <h2 className="text-4xl font-heading font-bold text-center mb-12 text-accent-400">
              لماذا تختار وزير الفصيد؟
            </h2>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
              {[
                {
                  icon: '🎵',
                  title: 'جودة صوتية عالية',
                  desc: 'استمع للقصائد بأفضل جودة صوت متاحة',
                },
                {
                  icon: '👥',
                  title: 'قراء محترفون',
                  desc: 'أفضل الأصوات والمقرئين المتخصصين',
                },
                {
                  icon: '📚',
                  title: 'مجموعة غنية',
                  desc: 'مئات القصائد الأصيلة والنادرة',
                },
                {
                  icon: '🌐',
                  title: 'متاح للجميع',
                  desc: 'واجهة سهلة وتجربة ممتازة على جميع الأجهزة',
                },
              ].map((feature, i) => (
                <div key={i} className="card p-6 text-center">
                  <div className="text-5xl mb-4">{feature.icon}</div>
                  <h3 className="text-xl font-bold text-accent-400 mb-3">{feature.title}</h3>
                  <p className="text-gray-400 text-sm">{feature.desc}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Newsletter Section */}
        <section className="py-20 px-4 bg-gradient-to-r from-primary-900 to-primary-800 border-y border-accent-600/50">
          <div className="max-w-2xl mx-auto text-center">
            <h2 className="text-3xl font-heading font-bold mb-4 text-accent-400">
              تابع أحدث القصائد
            </h2>
            <p className="text-gray-400 mb-8">
              اشترك في نشرتنا البريدية واحصل على تنبيهات عند إضافة قصائد جديدة
            </p>

            <form className="flex gap-3 flex-col sm:flex-row">
              <input
                type="email"
                placeholder="ادخل بريدك الإلكتروني"
                className="flex-1 px-4 py-3 bg-primary-800 border-2 border-primary-700 text-gray-100 placeholder-gray-500 rounded-lg focus:outline-none focus:border-accent-600 transition-colors"
              />
              <button type="submit" className="btn-primary whitespace-nowrap">
                اشترك الآن
              </button>
            </form>
          </div>
        </section>
      </main>

      <Footer />
    </>
  );
}
