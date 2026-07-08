'use client';

import Link from 'next/link';
import { Category } from '@/data/poems';

interface CategoryCardProps {
  category: Category;
}

export default function CategoryCard({ category }: CategoryCardProps) {
  return (
    <Link href={`/category/${category.id}`}>
      <div className="card card-hover p-8 h-full flex flex-col cursor-pointer group">
        {/* Icon */}
        <div className="text-6xl mb-4 transition-transform group-hover:scale-110 group-hover:rotate-6">
          {category.icon}
        </div>

        {/* Title */}
        <h3 className="text-2xl font-heading text-accent-400 mb-3 group-hover:text-accent-300 transition-colors">
          {category.name}
        </h3>

        {/* Description */}
        <p className="text-gray-400 text-sm leading-relaxed flex-1 mb-4">
          {category.description}
        </p>

        {/* Count and Arrow */}
        <div className="flex items-center justify-between mt-auto pt-4 border-t border-primary-800">
          <span className="text-sm font-semibold">
            <span className="text-accent-500">{category.poemsCount}</span>
            <span className="text-gray-500"> قصيدة</span>
          </span>
          <span className="text-accent-400 group-hover:translate-x-2 transition-transform">
            ←
          </span>
        </div>
      </div>
    </Link>
  );
}
