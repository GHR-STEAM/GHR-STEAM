'use client';

import Link from 'next/link';
import { useState } from 'react';

export default function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 bg-primary-900/95 backdrop-blur border-b-2 border-accent-600">
      <div className="max-w-7xl mx-auto px-4 py-4">
        <div className="flex justify-between items-center">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3 group">
            <div className="text-4xl">🌙</div>
            <div>
              <h1 className="text-2xl font-bold text-gradient">وزير الفصيد</h1>
              <p className="text-sm text-accent-400">منصة الشعر النبطي الأصيل</p>
            </div>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center gap-8">
            <Link
              href="/"
              className="text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              الرئيسية
            </Link>
            <Link
              href="/categories"
              className="text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              التصنيفات
            </Link>
            <Link
              href="/reciters"
              className="text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              المقرئون
            </Link>
            <Link
              href="/about"
              className="text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              عننا
            </Link>
          </nav>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden text-accent-400 text-2xl"
          >
            ☰
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <nav className="md:hidden mt-4 pt-4 border-t border-primary-800 space-y-3">
            <Link
              href="/"
              className="block text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              الرئيسية
            </Link>
            <Link
              href="/categories"
              className="block text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              التصنيفات
            </Link>
            <Link
              href="/reciters"
              className="block text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              المقرئون
            </Link>
            <Link
              href="/about"
              className="block text-gray-300 hover:text-accent-400 font-semibold transition-colors"
            >
              عننا
            </Link>
          </nav>
        )}
      </div>
    </header>
  );
}
