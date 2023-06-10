import 'package:flutter/material.dart';

import 'package:tiktaktoe/components/styled_button.dart';
import 'package:tiktaktoe/components/styled_title.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startGame,
  });

  final void Function() startGame;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StyledTitle("Tik Tac Toe"),
          const SizedBox(
            height: 30,
          ),
          StyledButton(
            text: "Play Game",
            icon: const Icon(
              Icons.play_arrow_rounded,
            ),
            onTap: startGame,
          ),
        ],
      ),
    );
  }
}
