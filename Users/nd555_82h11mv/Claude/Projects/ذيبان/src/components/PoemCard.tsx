'use client';

import { Poem } from '@/data/poems';
import { useState } from 'react';
import AudioPlayer from './AudioPlayer';

interface PoemCardProps {
  poem: Poem;
}

export default function PoemCard({ poem }: PoemCardProps) {
  const [selectedReciter, setSelectedReciter] = useState(0);
  const [showFullText, setShowFullText] = useState(false);

  const currentReciter = poem.reciters[selectedReciter];

  return (
    <div className="card card-hover p-6">
      {/* Header */}
      <div className="mb-6 pb-4 border-b border-primary-800">
        <h3 className="text-2xl font-heading text-accent-400 mb-2">{poem.title}</h3>
        <p className="text-gray-400">للشاعر: {poem.poet}</p>
        <div className="flex items-center gap-2 mt-3">
          <span className="category-badge">{poem.category}</span>
          {poem.date && (
            <span className="text-xs text-gray-500">{poem.date}</span>
          )}
        </div>
      </div>

      {/* Poetry Text */}
      <div className="mb-6">
        <p className="poetry-text">
          {showFullText ? poem.text : `${poem.text.substring(0, 150)}...`}
        </p>
        <button
          onClick={() => setShowFullText(!showFullText)}
          className="text-accent-400 hover:text-accent-300 text-sm font-semibold mt-2 transition-colors"
        >
          {showFullText ? 'اقرأ أقل ↑' : 'اقرأ المزيد ↓'}
        </button>
      </div>

      {/* Audio Player */}
      {currentReciter && (
        <div className="mb-6">
          <div className="mb-3 flex items-center justify-between">
            <p className="text-sm text-gray-400">القارئ: {currentReciter.name}</p>
            <span className="text-xs text-accent-500 font-semibold">{currentReciter.duration}</span>
          </div>
          <AudioPlayer audioUrl={currentReciter.audioUrl} />
        </div>
      )}

      {/* Reciter Selection */}
      {poem.reciters.length > 1 && (
        <div className="pt-4 border-t border-primary-800">
          <p className="text-sm text-gray-400 mb-3">اختر القارئ المفضل:</p>
          <div className="grid grid-cols-2 gap-2">
            {poem.reciters.map((reciter, index) => (
              <button
                key={reciter.id}
                onClick={() => setSelectedReciter(index)}
                className={`py-2 px-3 rounded-lg text-sm font-semibold transition-all duration-300 ${
                  selectedReciter === index
                    ? 'bg-accent-600 text-primary-950'
                    : 'bg-primary-800 text-accent-400 hover:bg-primary-700'
                }`}
              >
                {reciter.name}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
