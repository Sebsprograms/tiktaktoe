import 'package:flutter/material.dart';
import 'package:tiktaktoe/screens/game_screen.dart';
import 'package:tiktaktoe/screens/score_screen.dart';
import 'package:tiktaktoe/screens/start_screen.dart';

const String startScreen = 'start';
const String gameScreen = 'game';
const String scoreScreen = 'score';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  String currentScreen = startScreen;
  String winner = "";

  void setStartScreen() {
    setState(() {
      currentScreen = startScreen;
      winner = "";
    });
  }

  void setGameScreen() {
    setState(() {
      currentScreen = gameScreen;
    });
  }

  void setScoreScreen(String newWinner) {
    setState(() {
      currentScreen = scoreScreen;
      winner = newWinner;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(
      startGame: setGameScreen,
    );
    switch (currentScreen) {
      case gameScreen:
        activeScreen = Game(
          finishGame: setScoreScreen,
        );
        break;
      case scoreScreen:
        activeScreen = Score(
          restartGame: setStartScreen,
          winner: winner,
        );
        break;
      default:
        break;
    }
    return activeScreen;
  }
}
