import Header from '@/components/Header';
import Footer from '@/components/Footer';

export const metadata = {
  title: 'عن وزير الفصيد',
  description: 'معلومات عن منصة الشعر النبطي الأصيل',
};

export default function AboutPage() {
  return (
    <>
      <Header />

      <main className="flex-1">
        {/* Page Header */}
        <section className="py-16 px-4 bg-gradient-to-b from-primary-900 to-primary-950 border-b border-primary-800">
          <div className="max-w-7xl mx-auto text-center">
            <h1 className="text-5xl md:text-6xl font-heading font-bold mb-4">
              <span className="text-gradient">عن وزير الفصيد</span>
            </h1>
          </div>
        </section>

        {/* Main Content */}
        <section className="py-20 px-4">
          <div className="max-w-4xl mx-auto">
            {/* Our Story */}
            <div className="mb-16">
              <h2 className="text-3xl font-heading font-bold mb-6 text-accent-400">
                قصتنا
              </h2>
              <div className="card p-8">
                <p className="text-gray-400 text-lg leading-relaxed mb-4">
                  وزير الفصيد هي منصة متخصصة وحديثة مكرسة للحفاظ على الشعر النبطي الأصيل وتعريف الأجيال الجديدة به. تأسست برؤية واضحة: أن نجعل الشعر النبطي في متناول الجميع بجودة عالية وسهولة استخدام.
                </p>
                <p className="text-gray-400 text-lg leading-relaxed">
                  من خلال مجموعة مختارة من أفضل الشعراء والمقرئين، نقدم تجربة فريدة لاستكشاف وتقدير جمال الشعر العربي الأصيل.
                </p>
              </div>
            </div>

            {/* Mission & Vision */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-16">
              <div className="card p-8">
                <h3 className="text-2xl font-heading font-bold mb-4 text-accent-400">
                  🎯 رسالتنا
                </h3>
                <p className="text-gray-400">
                  توفير منصة متطورة للشعر النبطي تجمع بين الأصالة والحداثة، لنشر الثقافة الشعرية والحفاظ على التراث العربي الغني.
                </p>
              </div>

              <div className="card p-8">
                <h3 className="text-2xl font-heading font-bold mb-4 text-accent-400">
                  ✨ رؤيتنا
                </h3>
                <p className="text-gray-400">
                  أن نكون الوجهة الأولى والموثوقة للشعر النبطي الأصيل عالمياً، حيث يلتقي المتذوقون والعاشقون للشعر الجيد.
                </p>
              </div>
            </div>

            {/* Values */}
            <div className="mb-16">
              <h2 className="text-3xl font-heading font-bold mb-6 text-accent-400">
                قيمنا الأساسية
              </h2>

              <div className="space-y-4">
                {[
                  {
                    title: 'الأصالة',
                    desc: 'نحافظ على الشعر الأصيل بلا تحريف أو تعديل',
                  },
                  {
                    title: 'الجودة',
                    desc: 'نختار أفضل القصائد والأصوات لضمان تجربة متميزة',
                  },
                  {
                    title: 'الوصولية',
                    desc: 'نجعل الشعر متاحاً للجميع بسهولة وبدون حواجز',
                  },
                  {
                    title: 'الاحترافية',
                    desc: 'نعمل بكل احترافية لتقديم أفضل خدمة ممكنة',
                  },
                ].map((value, i) => (
                  <div key={i} className="card p-6 border-r-4 border-accent-600">
                    <h3 className="text-lg font-bold text-accent-400 mb-2">
                      {value.title}
                    </h3>
                    <p className="text-gray-400">{value.desc}</p>
                  </div>
                ))}
              </div>
            </div>

            {/* Team */}
            <div className="mb-16">
              <h2 className="text-3xl font-heading font-bold mb-6 text-accent-400">
                فريقنا
              </h2>
              <div className="card p-8">
                <p className="text-gray-400 mb-4">
                  فريقنا مؤلف من عشاق الشعر والمتخصصين في المجال، يعملون بشغف لإحياء الشعر النبطي وجعله متاحاً للأجيال الحالية والقادمة.
                </p>
                <p className="text-gray-400">
                  كل عضو في فريقنا لديه رؤية واضحة: الحفاظ على التراث وتطويره بطرق حديثة.
                </p>
              </div>
            </div>

            {/* Contact CTA */}
            <div className="bg-gradient-to-r from-primary-900 to-primary-800 border-2 border-accent-600 rounded-xl p-8 text-center">
              <h3 className="text-2xl font-bold text-accent-400 mb-4">
                هل لديك أسئلة؟
              </h3>
              <p className="text-gray-400 mb-6">
                نحب سماع آرائك واقتراحاتك. لا تتردد في التواصل معنا
              </p>
              <button className="btn-primary">
                اتصل بنا الآن 💬
              </button>
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </>
  );
}
