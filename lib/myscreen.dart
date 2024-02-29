import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String title = "I m here";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("my app"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    title = "I m there";
                  });
                },
                child: Text(
                  "Click here",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
