import 'package:flutter/material.dart';
import 'athkar_screen.dart';
import '../widgets/theme_toggle.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    "أذكاري",
    "اذكار الصباح",
    "اذكار المساء",
    "اذكار النوم",
    "اذكار الاستيقاظ",
    "اذكار الصلاة",
    "اذكار منوعة"
  ];

  final List<Color> categoryColors = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.brown
  ];

  final ValueNotifier<bool> isDarkMode; // Accept ValueNotifier<bool>
  final VoidCallback onToggleTheme;

  CategoryScreen({required this.isDarkMode, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تطبيق الأذكار"),
        actions: [
          ThemeToggle(isDarkMode: isDarkMode.value, onToggle: onToggleTheme), // Pass isDarkMode.value to the widget
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: categoryColors[index],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AthkarScreen(
                        category: categories[index],
                        allowAdding: categories[index] == "أذكاري",
                        appBarColor: categoryColors[index],
                        isDarkMode: isDarkMode,
                        onToggleTheme: onToggleTheme,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


