import 'package:flutter/material.dart';
import 'package:tiktaktoe/components/styled_button.dart';
import 'package:tiktaktoe/components/styled_title.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.winner,
    required this.restartGame,
  });
  final String winner;
  final void Function() restartGame;

  @override
  Widget build(BuildContext context) {
    String result = winner == "-" ? "Draw!" : "$winner won!";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyledTitle(result),
          const SizedBox(
            height: 30,
          ),
          StyledButton(
            text: "Restart",
            icon: const Icon(
              Icons.refresh_sharp,
            ),
            onTap: restartGame,
          ),
        ],
      ),
    );
  }
}
