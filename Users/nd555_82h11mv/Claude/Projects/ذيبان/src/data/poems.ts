export interface Poem {
  id: string;
  title: string;
  poet: string;
  category: string;
  text: string;
  audio?: string;
  reciters: Reciter[];
  date?: string;
}

export interface Reciter {
  id: string;
  name: string;
  image?: string;
  audioUrl: string;
  duration: string;
}

export interface Category {
  id: string;
  name: string;
  description: string;
  icon: string;
  color: string;
  poemsCount: number;
}

export const categories: Category[] = [
  {
    id: 'love',
    name: 'الحب والعاطفة',
    description: 'قصائد في الحب والمشاعر الجياشة',
    icon: '💕',
    color: 'from-pink-600 to-rose-600',
    poemsCount: 24,
  },
  {
    id: 'honor',
    name: 'الشرف والكرامة',
    description: 'قصائد في الشرف والكرامة والعزة',
    icon: '⚔️',
    color: 'from-amber-600 to-yellow-600',
    poemsCount: 18,
  },
  {
    id: 'nature',
    name: 'الطبيعة والبيئة',
    description: 'قصائد تصف جمال الطبيعة والبادية',
    icon: '🌅',
    color: 'from-green-600 to-emerald-600',
    poemsCount: 15,
  },
  {
    id: 'nostalgia',
    name: 'الحنين والذكريات',
    description: 'قصائد الحنين والذكريات الجميلة',
    icon: '🌙',
    color: 'from-blue-600 to-indigo-600',
    poemsCount: 21,
  },
  {
    id: 'wisdom',
    name: 'الحكمة والنصائح',
    description: 'قصائد الحكمة والعبر من الحياة',
    icon: '🧠',
    color: 'from-purple-600 to-violet-600',
    poemsCount: 19,
  },
  {
    id: 'celebration',
    name: 'الفرح والاحتفالات',
    description: 'قصائد الفرح والاحتفالات والمناسبات',
    icon: '🎉',
    color: 'from-red-600 to-orange-600',
    poemsCount: 16,
  },
];

export const poems: Poem[] = [
  {
    id: 'poem-1',
    title: 'يا ليل الصبر',
    poet: 'الشاعر العربي',
    category: 'love',
    text: `يا ليل الصبر ما أطول ليلك
وما ألطف برد هداك الليلك
تسري الريح بين ذرا مطاياي
وتلهو بحمل الشوق من نواحيك`,
    reciters: [
      {
        id: 'reciter-1',
        name: 'صوت الشاعر المجيد',
        audioUrl: '/audio/poem1-1.mp3',
        duration: '3:45',
      },
      {
        id: 'reciter-2',
        name: 'المقرئ الفصيح',
        audioUrl: '/audio/poem1-2.mp3',
        duration: '4:12',
      },
    ],
    date: '2024-01-15',
  },
  {
    id: 'poem-2',
    title: 'أنا الشرف',
    poet: 'شاعر البادية',
    category: 'honor',
    text: `أنا الشرف في القوم وشمسهم الساطعة
وأنا الجود في الرخاء وفي الشدة القاسية
بلائي في الكفاح تراه كل قوم
ومجدي في السماء يرى كل ناظر`,
    reciters: [
      {
        id: 'reciter-3',
        name: 'صوت الفخر',
        audioUrl: '/audio/poem2-1.mp3',
        duration: '3:28',
      },
    ],
    date: '2024-01-14',
  },
  {
    id: 'poem-3',
    title: 'روح البادية',
    poet: 'شاعر الطلق',
    category: 'nature',
    text: `رمال الصحراء تحكي قصصها
عبر الأزمان والحقب الضائعة
والجبال الشاهقة تشهد على
عظمة الخالق في الكون الواسع`,
    reciters: [
      {
        id: 'reciter-4',
        name: 'صوت الطلق',
        audioUrl: '/audio/poem3-1.mp3',
        duration: '4:05',
      },
    ],
    date: '2024-01-13',
  },
  {
    id: 'poem-4',
    title: 'أيام الذكرى',
    poet: 'شاعر الذاكرة',
    category: 'nostalgia',
    text: `كم جميلة كانت تلك الأيام
حين كنا معاً في ليالي الصفاء
الآن أطيافك تعود إلي
في نسائم الليل وهمسات الهدى`,
    reciters: [
      {
        id: 'reciter-5',
        name: 'صوت الحنين',
        audioUrl: '/audio/poem4-1.mp3',
        duration: '3:52',
      },
    ],
    date: '2024-01-12',
  },
  {
    id: 'poem-5',
    title: 'حكمة الأيام',
    poet: 'الحكيم القديم',
    category: 'wisdom',
    text: `في كل يوم درس نتعلمه
من دفتر الحياة الممتلئ بالعبر
فالصبر يحتاج إلى قوة الروح
والقلب الذي يثق بخالق الكل`,
    reciters: [
      {
        id: 'reciter-6',
        name: 'صوت الحكمة',
        audioUrl: '/audio/poem5-1.mp3',
        duration: '3:34',
      },
    ],
    date: '2024-01-11',
  },
];

export const reciters = [
  {
    id: 'reciter-1',
    name: 'صوت الشاعر المجيد',
    image: '👤',
    bio: 'من أشهر قراء الشعر النبطي',
    poemsCount: 45,
  },
  {
    id: 'reciter-2',
    name: 'المقرئ الفصيح',
    image: '👤',
    bio: 'متخصص في الشعر الفصيح والنبطي',
    poemsCount: 38,
  },
  {
    id: 'reciter-3',
    name: 'صوت الفخر',
    image: '👤',
    bio: 'قارئ متميز لقصائد الشرف والفخر',
    poemsCount: 32,
  },
  {
    id: 'reciter-4',
    name: 'صوت الطلق',
    image: '👤',
    bio: 'متخصص في قصائد الطبيعة والبادية',
    poemsCount: 28,
  },
  {
    id: 'reciter-5',
    name: 'صوت الحنين',
    image: '👤',
    bio: 'قارئ عاطفي لقصائد الحنين والذكريات',
    poemsCount: 35,
  },
];
