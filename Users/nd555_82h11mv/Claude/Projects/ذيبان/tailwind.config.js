/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          950: '#0a0804',
          900: '#1a140d',
          800: '#2a2314',
          700: '#3d321f',
          600: '#50422a',
        },
        accent: {
          50: '#fefce8',
          100: '#fffacd',
          200: '#fff59b',
          300: '#fff068',
          400: '#ffed4e',
          500: '#fde047',
          600: '#eab308',
          700: '#ca8a04',
          800: '#a16207',
          900: '#854d0e',
        },
      },
      fontFamily: {
        arabic: [
          'Tajawal',
          'Cairo',
          'var(--font-tajawal)',
          'sans-serif',
        ],
        heading: [
          'Scheherazade New',
          'var(--font-scheherazade)',
          'serif',
        ],
      },
    },
  },
  plugins: [],
};
