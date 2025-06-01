export type WorkoutType = 'strength' | 'cardio' | 'flexibility';

export interface User {
  id: string;
  name: string;
  email: string;
  profilePicture?: string;
}

export interface Exercise {
  id: string;
  name: string;
  type: WorkoutType;
  muscleGroup: string;
}

export interface Workout {
  id: string;
  type: WorkoutType;
  date: Date;
  notes?: string;
} 