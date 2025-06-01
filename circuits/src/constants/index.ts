// Colors
export const COLORS = {
  primary: '#007AFF',
  background: '#FFFFFF',
  text: {
    primary: '#000000',
    secondary: '#666666',
    tertiary: '#999999',
  },
  border: '#E5E5E5',
  error: '#FF3B30',
  success: '#34C759',
  warning: '#FF9500',
} as const;

// Typography
export const TYPOGRAPHY = {
  sizes: {
    xs: 12,
    sm: 14,
    base: 16,
    lg: 18,
    xl: 20,
    '2xl': 24,
    '3xl': 30,
    '4xl': 36,
  },
  weights: {
    regular: '400',
    medium: '500',
    semibold: '600',
    bold: '700',
  },
  lineHeights: {
    tight: 1.2,
    normal: 1.5,
    relaxed: 1.75,
  },
} as const;

// Spacing
export const SPACING = {
  xs: 4,
  sm: 8,
  base: 16,
  lg: 24,
  xl: 32,
  '2xl': 48,
  '3xl': 64,
} as const;

// Screen Names
export const SCREENS = {
  HOME: 'Home',
  PROFILE: 'Profile',
  WORKOUTS: 'Workouts',
  EXERCISES: 'Exercises',
  WORKOUT_DETAILS: 'WorkoutDetails',
  EXERCISE_DETAILS: 'ExerciseDetails',
  SETTINGS: 'Settings',
} as const;

// Animation
export const ANIMATION = {
  duration: {
    fast: 200,
    normal: 300,
    slow: 500,
  },
  easing: {
    easeInOut: 'ease-in-out',
    easeOut: 'ease-out',
    easeIn: 'ease-in',
  },
} as const; 