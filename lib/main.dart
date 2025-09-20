// This is the main file for the Sales Bets Flutter application.
//
// It demonstrates structures including
// UI components, state management, and placeholders for Firebase integration.
//
// For simplicity, this code uses
// mock data and placeholder functions for backend interactions.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/feature/onboarding/onboarding_view.dart';

import 'package:salesbets/repository/app_state.dart';

// Placeholder for Firebase packages.
// In a real project, you would add these to your pubspec.yaml:
// firebase_core: ^2.24.2
// firebase_auth: ^4.15.3
// cloud_firestore: ^4.13.5
// firebase_messaging: ^14.7.9

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // In a real app, this would initialize Firebase.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const SalesBetsApp(),
    ),
  );
}

class SalesBetsApp extends StatelessWidget {
  const SalesBetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Bets',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1E),
        primaryColor: const Color(0xFFE50914),
        hintColor: const Color(0xFFE50914),
        cardColor: const Color(0xFF2C2C2E),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1C1C1E),
          selectedItemColor: Color(0xFFE50914),
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914),
          secondary: Color(0xFF007BFF),
          surface: Color(0xFF2C2C2E),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}
