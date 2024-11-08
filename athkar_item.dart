import 'package:flutter/material.dart';

class AthkarItem {
  final String text;
  int count;
  ThemeData theme; // Each thikr can have its own theme

  AthkarItem({required this.text, this.count = 0, required this.theme});
}
