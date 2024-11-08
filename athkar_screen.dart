import 'package:flutter/material.dart';
import '../models/athkar_item.dart';
import 'athkar_detail_screen.dart';
import 'add_athkar_screen.dart';
import 'theme_selection_screen.dart';
import '../widgets/theme_toggle.dart';

class AthkarScreen extends StatefulWidget {
  final String category;
  final bool allowAdding;
  final Color appBarColor;
  final ValueNotifier<bool> isDarkMode; // Accept ValueNotifier<bool>
  final VoidCallback onToggleTheme;

  AthkarScreen({
    required this.category,
    required this.allowAdding,
    required this.appBarColor,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  _AthkarScreenState createState() => _AthkarScreenState();
}

class _AthkarScreenState extends State<AthkarScreen> {
  List<AthkarItem> athkarList = [];

  void addAthkar(String athkar) {
    setState(() {
      athkarList.add(AthkarItem(
        text: athkar,
        count: 0,
        theme: ThemeData(primarySwatch: Colors.blue),
      ));
    });
  }

  void updateAthkarTheme(int index, ThemeData newTheme) {
    setState(() {
      athkarList[index].theme = newTheme;
    });
  }

  void updateCount(int index, int newCount) {
    setState(() {
      athkarList[index].count = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text(widget.category),
        actions: [
          ThemeToggle(isDarkMode: widget.isDarkMode.value, onToggle: widget.onToggleTheme), // Pass isDarkMode.value to the widget
        ],
      ),
      body: ListView.builder(
        itemCount: athkarList.length,
        itemBuilder: (context, index) {
          final athkar = athkarList[index];
          return ListTile(
            title: Text(
              athkar.text,
              textAlign: TextAlign.right,
            ),
            subtitle: Text(
              'العدد: ${athkar.count}',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AthkarDetailScreen(
                    athkar: athkar,
                    onCountUpdate: (newCount) => updateCount(index, newCount),
                    onChangeTheme: (newTheme) =>
                        updateAthkarTheme(index, newTheme),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: widget.allowAdding
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAthkarScreen(onSubmit: addAthkar),
                  ),
                );
              },
              label: Text("اضف ذكر", style: TextStyle(fontSize: 18)),
              icon: Icon(Icons.add),
              backgroundColor: Colors.green,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




