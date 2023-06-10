class TikTacToe {
  static const String playerX = "X";
  static const String playerO = "O";

  String currentPlayer = playerO;
  String winner = "-";
  bool isComplete = false;

  // 2d array, both dimensions 3 long, filled with empty Strings.
  final List<List<String>> board = List.generate(
      3,
      (index) => List.generate(
            3,
            (index) => " ",
            growable: false,
          ),
      growable: false);

  void changeCurrentPlayer() {
    currentPlayer = currentPlayer == playerO ? playerX : playerO;
  }

  void checkForWinner() {
    checkIfFilled();
    checkIfRowWins();
  }

  void checkIfColumnWins() {
    for (int c = 0; c < board.length; c++) {
      String first = board[c][0];
      for (int r = 1; r < board[r].length; r++) {
        String element = board[c][r];
      }
    }
  }

  void checkIfCrossWins() {}

  void checkIfRowWins() {
    for (List<String> row in board) {
      if (row.join("").contains(" ")) return;
      bool result = true;
      String first = row[0];
      for (int i = 1; i < row.length; i++) {
        if (first != row[i]) {
          result = false;
        }
      }
      if (result) {
        winner = first;
        isComplete = true;
        return;
      }
    }
  }

  void checkIfFilled() {
    String boardStringified = "";
    for (List<String> row in board) {
      boardStringified += row.join("");
    }
    if (!boardStringified.toString().contains(" ")) {
      isComplete = true;
    }
  }
}
