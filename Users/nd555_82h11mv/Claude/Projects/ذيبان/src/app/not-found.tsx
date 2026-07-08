import Header from '@/components/Header';
import Footer from '@/components/Footer';
import Link from 'next/link';

export default function NotFound() {
  return (
    <>
      <Header />

      <main className="flex-1 py-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          {/* 404 Message */}
          <div className="text-8xl font-bold text-accent-600 mb-6">404</div>

          <h1 className="text-4xl font-heading font-bold text-accent-400 mb-4">
            الصفحة غير موجودة
          </h1>

          <p className="text-gray-400 text-lg mb-8">
            آسفون، الصفحة التي تبحث عنها غير موجودة. قد تكون تمت إزالتها أو تغيير عنوانها.
          </p>

          {/* Icon */}
          <div className="text-8xl mb-8">🌙</div>

          {/* Links */}
          <div className="flex gap-4 justify-center flex-wrap">
            <Link href="/" className="btn-primary">
              العودة للرئيسية 🏠
            </Link>
            <Link href="/categories" className="btn-secondary">
              استكشف التصنيفات 📚
            </Link>
          </div>
        </div>
      </main>

      <Footer />
    </>
  );
}
