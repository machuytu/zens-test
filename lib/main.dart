import 'package:flutter/material.dart';
import 'package:zens_test/views/drink/drink_screen.dart';

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
          seedColor: const Color(0xFFFE724C),
          primary: const Color(0xFFFE724C),
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
