import Header from '@/components/Header';
import Footer from '@/components/Footer';
import { reciters } from '@/data/poems';

export const metadata = {
  title: 'المقرئون | وزير الفصيد',
  description: 'التعرف على أفضل قراء الشعر النبطي والمقرئين المحترفين',
};

export default function RecitersPage() {
  return (
    <>
      <Header />

      <main className="flex-1">
        {/* Page Header */}
        <section className="py-16 px-4 bg-gradient-to-b from-primary-900 to-primary-950 border-b border-primary-800">
          <div className="max-w-7xl mx-auto text-center">
            <h1 className="text-5xl md:text-6xl font-heading font-bold mb-4">
              <span className="text-gradient">المقرئون المحترفون</span>
            </h1>
            <p className="text-gray-400 text-lg max-w-2xl mx-auto">
              التعرف على أفضل الأصوات والمقرئين المتخصصين في الشعر النبطي الأصيل
            </p>
          </div>
        </section>

        {/* Reciters Grid */}
        <section className="py-20 px-4">
          <div className="max-w-7xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {reciters.map((reciter) => (
                <div key={reciter.id} className="card card-hover p-8 text-center">
                  {/* Avatar */}
                  <div className="text-7xl mb-6 inline-block">{reciter.image}</div>

                  {/* Name */}
                  <h3 className="text-2xl font-bold text-accent-400 mb-3">
                    {reciter.name}
                  </h3>

                  {/* Bio */}
                  <p className="text-gray-400 mb-6">{reciter.bio}</p>

                  {/* Stats */}
                  <div className="bg-primary-800/50 rounded-lg p-4 mb-6">
                    <p className="text-sm text-gray-500 mb-1">القصائد المقروءة</p>
                    <p className="text-3xl font-bold text-accent-400">{reciter.poemsCount}</p>
                  </div>

                  {/* View Button */}
                  <button className="btn-primary w-full">
                    استمع للقصائد →
                  </button>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Why Choose Section */}
        <section className="py-20 px-4 bg-primary-900/50">
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl font-heading font-bold mb-8 text-center text-accent-400">
              لماذا أصواتنا مميزة؟
            </h2>

            <div className="space-y-6">
              {[
                {
                  icon: '🎓',
                  title: 'تدريب عالي',
                  desc: 'جميع المقرئين متدربون بعناية ولديهم خبرة طويلة في مجال الشعر النبطي',
                },
                {
                  icon: '🎤',
                  title: 'أصوات فريدة',
                  desc: 'كل قارئ له أسلوبه الخاص الذي يضيف جمالاً فريداً للقصائد',
                },
                {
                  icon: '🏆',
                  title: 'معروفون وموثوقون',
                  desc: 'قراء معروفون ومشهورون حول العالم العربي',
                },
                {
                  icon: '📅',
                  title: 'تحديثات منتظمة',
                  desc: 'نضيف قصائد جديدة من المقرئين بشكل منتظم',
                },
              ].map((feature, i) => (
                <div key={i} className="card p-6 flex gap-4">
                  <div className="text-4xl flex-shrink-0">{feature.icon}</div>
                  <div>
                    <h3 className="text-lg font-bold text-accent-400 mb-2">
                      {feature.title}
                    </h3>
                    <p className="text-gray-400">{feature.desc}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </>
  );
}
