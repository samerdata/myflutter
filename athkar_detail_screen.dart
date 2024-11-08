import 'package:flutter/material.dart';
import '../models/athkar_item.dart';
import 'theme_selection_screen.dart';

class AthkarDetailScreen extends StatefulWidget {
  final AthkarItem athkar;
  final ValueChanged<int> onCountUpdate;
  final ValueChanged<ThemeData> onChangeTheme;

  AthkarDetailScreen({
    required this.athkar,
    required this.onCountUpdate,
    required this.onChangeTheme,
  });

  @override
  _AthkarDetailScreenState createState() => _AthkarDetailScreenState();
}

class _AthkarDetailScreenState extends State<AthkarDetailScreen> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.athkar.count;
  }

  void incrementCount() {
    setState(() {
      count += 1;
    });
    widget.onCountUpdate(count);
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
    widget.onCountUpdate(count);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.athkar.theme, // Apply the specific theme for this athkar
      child: Scaffold(
        appBar: AppBar(
          title: Text("عرض الذكر"),
          actions: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThemeSelectionScreen(
                      onThemeSelected: widget.onChangeTheme,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior
              .opaque, // Ensure taps register across the entire screen
          onTap: incrementCount, // Increment count when tapping anywhere
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.athkar.text,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'العدد: $count', // Display updated count in Arabic
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: resetCount,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16), // Bigger reset button
                  ),
                  child: Text("إعادة التعيين", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
