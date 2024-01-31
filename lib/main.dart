import 'package:flutter/material.dart';
import 'package:zens_test/views/drink/drink_screen.dart';

import 'resources/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StateManager.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        useMaterial3: true,
      ),
      home: const DrinkScreen(),
    );
  }
}

/// A class that manages the state of the application.
class StateManager {
  /// A global key used to access the navigator state.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
