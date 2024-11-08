import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  ThemeToggle({required this.isDarkMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(isDarkMode ? Icons.nightlight_round : Icons.wb_sunny, color: Colors.white),
        Switch(
          value: isDarkMode,
          onChanged: (value) => onToggle(),
          activeColor: Colors.yellow,
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.blueGrey,
        ),
      ],
    );
  }
}
