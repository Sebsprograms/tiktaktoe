import 'package:flutter/material.dart';
import 'package:tiktaktoe/screens/screen_controller.dart';

void main() {
  runApp(const TikTakToe());
}

class TikTakToe extends StatelessWidget {
  const TikTakToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.amber[700],
          child: const ScreenController(),
        ),
      ),
    );
  }
}
