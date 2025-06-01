# Circuits - Client

A modern fitness tracking application built with React Native and Expo, designed to help users track their workouts, manage exercises, and monitor their fitness journey.

## Description

Circuits is a comprehensive fitness tracking app that allows users to:
- Track different types of workouts (strength, cardio, flexibility)
- Manage and organize exercises
- Monitor progress over time
- Create and save workout routines
- Track personal fitness goals

## Technology Stack

- **Framework**: React Native with Expo
- **Language**: TypeScript
- **Navigation**: React Navigation
- **State Management**: React Context
- **Storage**: AsyncStorage & SecureStore
- **UI Components**: React Native Core Components
- **Development Tools**: TypeScript, ESLint

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/circuits.git
cd circuits
```

2. Install dependencies:
```bash
npm install
```

## Development Setup

1. Make sure you have the following prerequisites:
   - Node.js (v14 or higher)
   - npm or yarn
   - Expo CLI (`npm install -g expo-cli`)
   - iOS Simulator (for Mac) or Android Studio (for Android development)

2. Start the development server:
```bash
npm start
```

3. Run on specific platforms:
```bash
# iOS
npm run ios

# Android
npm run android

# Web
npm run web
```

## Available Scripts

- `npm start` - Start the Expo development server
- `npm run android` - Start the app on Android
- `npm run ios` - Start the app on iOS
- `npm run web` - Start the app in web browser
- `npm run type-check` - Run TypeScript type checking

## Project Structure

```
circuits/
├── src/
│   ├── components/     # Reusable UI components
│   ├── screens/        # Screen components
│   ├── navigation/     # Navigation configuration
│   ├── contexts/       # React Context providers
│   ├── types/          # TypeScript type definitions
│   ├── utils/          # Utility functions
│   ├── constants/      # App-wide constants
│   └── assets/         # Images, fonts, etc.
├── assets/            # Root assets folder
├── App.tsx           # Root component
└── package.json      # Project dependencies and scripts
```

## Features

- [ ] User authentication
- [ ] Workout tracking
- [ ] Exercise library
- [ ] Progress monitoring
- [ ] Custom workout creation
- [ ] Profile management
- [ ] Settings and preferences

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 
