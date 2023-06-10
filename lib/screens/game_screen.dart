import 'package:flutter/material.dart';
import 'package:tiktaktoe/components/styled_title.dart';
import 'package:tiktaktoe/components/tiktactoe_field.dart';

import 'package:tiktaktoe/logic/tiktactoe.dart';

class Game extends StatefulWidget {
  const Game({
    super.key,
    required this.finishGame,
  });

  final void Function(String winner) finishGame;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  TikTacToe game = TikTacToe();

  void changeCurrentPlayer() {
    setState(() {
      game.changeCurrentPlayer();
    });
  }

  void updateField(int rowIndex, int fieldIndex, String value) {
    if (value == " ") {
      setState(() {
        game.board[rowIndex][fieldIndex] = game.currentPlayer;
      });
      changeCurrentPlayer();
      game.checkForWinner();

      if (game.isComplete) {
        widget.finishGame(game.winner);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...game.board.map((row) {
            int rowIndex = game.board.indexOf(row);
            int columnIndex = 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((field) {
                int fieldIndex = columnIndex;
                columnIndex++;
                return TikTacToeField(
                  value: field,
                  rowIndex: rowIndex,
                  fieldIndex: fieldIndex,
                  setField: updateField,
                );
              }).toList(),
            );
          }).toList(),
          const SizedBox(
            height: 30,
          ),
          StyledTitle("${game.currentPlayer}'s turn"),
        ],
      ),
    );
  }
}
