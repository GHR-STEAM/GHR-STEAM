'use client';

import { useRef, useState, useEffect } from 'react';

interface AudioPlayerProps {
  audioUrl: string;
}

export default function AudioPlayer({ audioUrl }: AudioPlayerProps) {
  const audioRef = useRef<HTMLAudioElement>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;

    const updateTime = () => setCurrentTime(audio.currentTime);
    const updateDuration = () => setDuration(audio.duration);
    const handleEnded = () => setIsPlaying(false);

    audio.addEventListener('timeupdate', updateTime);
    audio.addEventListener('loadedmetadata', updateDuration);
    audio.addEventListener('ended', handleEnded);

    return () => {
      audio.removeEventListener('timeupdate', updateTime);
      audio.removeEventListener('loadedmetadata', updateDuration);
      audio.removeEventListener('ended', handleEnded);
    };
  }, []);

  const togglePlay = () => {
    if (audioRef.current) {
      if (isPlaying) {
        audioRef.current.pause();
      } else {
        audioRef.current.play();
      }
      setIsPlaying(!isPlaying);
    }
  };

  const handleProgressClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (audioRef.current && duration) {
      const rect = e.currentTarget.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const percentage = x / rect.width;
      audioRef.current.currentTime = percentage * duration;
    }
  };

  const formatTime = (time: number) => {
    if (isNaN(time)) return '0:00';
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds.toString().padStart(2, '0')}`;
  };

  return (
    <div className="audio-player">
      <audio ref={audioRef} src={audioUrl} crossOrigin="anonymous" />

      {/* Play Button */}
      <div className="flex items-center gap-4 mb-4">
        <button
          onClick={togglePlay}
          className="flex-shrink-0 w-12 h-12 bg-accent-600 hover:bg-accent-500 text-primary-950 rounded-full flex items-center justify-center font-bold text-lg transition-all duration-300 active:scale-95"
        >
          {isPlaying ? '⏸' : '▶'}
        </button>

        {/* Time Display */}
        <div className="flex-1 text-sm text-gray-400">
          <div className="flex justify-between mb-1">
            <span>{formatTime(currentTime)}</span>
            <span>{formatTime(duration)}</span>
          </div>

          {/* Progress Bar */}
          <div
            onClick={handleProgressClick}
            className="h-2 bg-primary-800 rounded-full cursor-pointer hover:bg-primary-700 transition-colors relative group"
          >
            <div
              className="h-full bg-gradient-to-r from-accent-600 to-accent-400 rounded-full"
              style={{ width: `${duration ? (currentTime / duration) * 100 : 0}%` }}
            />
            {/* Progress circle on hover */}
            <div
              className="absolute h-4 w-4 bg-accent-400 rounded-full -top-1 transform -translate-x-1/2 opacity-0 group-hover:opacity-100 transition-opacity"
              style={{ left: `${duration ? (currentTime / duration) * 100 : 0}%` }}
            />
          </div>
        </div>
      </div>

      {/* Volume Control */}
      <div className="flex items-center gap-2">
        <span className="text-sm text-gray-400">🔊</span>
        <input
          type="range"
          min="0"
          max="1"
          step="0.1"
          defaultValue="1"
          onChange={(e) => {
            if (audioRef.current) {
              audioRef.current.volume = parseFloat(e.target.value);
            }
          }}
          className="flex-1 h-2 bg-primary-800 rounded-full cursor-pointer accent-accent-600"
        />
      </div>
    </div>
  );
}
