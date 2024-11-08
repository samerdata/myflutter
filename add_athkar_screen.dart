import 'package:flutter/material.dart';

class AddAthkarScreen extends StatelessWidget {
  final Function(String) onSubmit;

  AddAthkarScreen({required this.onSubmit});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إضافة ذكر")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: "أدخل الذكر"),
            ),
            ElevatedButton(
              onPressed: () {
                onSubmit(_controller.text);
                Navigator.pop(context);
              },
              child: Text("إضافة الذكر"),
            ),
          ],
        ),
      ),
    );
  }
}
