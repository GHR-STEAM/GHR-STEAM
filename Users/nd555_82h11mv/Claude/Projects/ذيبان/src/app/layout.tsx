import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'منصة الشعر النبطي | وزير الفصيد',
  description: 'منصة متخصصة في الشعر النبطي الأصيل. اسمع أجمل القصائد من أفضل الشعراء والمقرئين',
  viewport: 'width=device-width, initial-scale=1',
  icons: {
    icon: '/favicon.ico',
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ar" dir="rtl">
      <head>
        <meta charSet="utf-8" />
        <meta name="theme-color" content="#0a0804" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
      </head>
      <body className="bg-primary-950 text-gray-100">
        <div className="min-h-screen flex flex-col">
          {children}
        </div>
      </body>
    </html>
  );
}
