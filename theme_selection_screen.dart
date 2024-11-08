import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatelessWidget {
  final ValueChanged<ThemeData> onThemeSelected;

  ThemeSelectionScreen({required this.onThemeSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختر سمة")),
      body: ListView(
        children: [
          ListTile(
            title: Text("أخضر"),
            onTap: () =>
                onThemeSelected(ThemeData(primarySwatch: Colors.green)),
          ),
          ListTile(
            title: Text("أزرق"),
            onTap: () => onThemeSelected(ThemeData(primarySwatch: Colors.blue)),
          ),
          ListTile(
            title: Text("أحمر"),
            onTap: () => onThemeSelected(ThemeData(primarySwatch: Colors.red)),
          ),
          ListTile(
            title: Text("أرجواني"),
            onTap: () =>
                onThemeSelected(ThemeData(primarySwatch: Colors.purple)),
          ),
        ],
      ),
    );
  }
}
