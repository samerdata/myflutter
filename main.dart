import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'widgets/theme_toggle.dart';

void main() {
  runApp(AthkarApp());
}

class AthkarApp extends StatefulWidget {
  @override
  _AthkarAppState createState() => _AthkarAppState();
}

class _AthkarAppState extends State<AthkarApp> {
  // Create a ValueNotifier to track dark mode
  ValueNotifier<bool> isDarkMode = ValueNotifier(false); // Default to light mode

  @override
  void dispose() {
    isDarkMode.dispose(); // Dispose the notifier to avoid memory leaks
    super.dispose();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value; // Toggle theme mode
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode, // Listening to the ValueNotifier
      builder: (context, isDarkModeValue, child) {
        return MaterialApp(
          title: 'تطبيق الأذكار',
          theme: ThemeData(
            brightness: isDarkModeValue ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: isDarkModeValue ? Color(0xFF1A1A2E) : Color(0xFFF5F5DC), // Dark blue or beige background
            appBarTheme: AppBarTheme(
              backgroundColor: isDarkModeValue ? Color(0xFF0D0D20) : Color(0xFFD2B48C), // Dark beige in light mode, dark blue in dark mode
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
          home: CategoryScreen(
            isDarkMode: isDarkMode, // Pass the ValueNotifier instead of bool
            onToggleTheme: toggleTheme,
          ),
        );
      },
    );
  }
}


