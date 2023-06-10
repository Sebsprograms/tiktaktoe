class TikTacToe {
  static const String playerX = "X";
  static const String setX = "XXX";
  static const String playerO = "O";
  static const String setO = "OOO";

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
    checkIfColumnWins();
    checkIfCrossWins();
  }

  void checkIfColumnWins() {
    for (int i = 0; i < board.length; i++) {
      String set = "";
      for (int x = 0; x < board.length; x++) {
        set += board[x][i];
      }
      checkSet(set);
    }
  }

  void checkIfCrossWins() {
    String set1 = "";
    String set2 = "";
    int x = 2;
    for (int i = 0; i < board.length; i++) {
      set1 += board[i][i];
      set2 += board[i][x];
      x--;
    }
    checkSet(set1);
    checkSet(set2);
  }

  void checkIfRowWins() {
    for (List<String> row in board) {
      checkSet(row.join(""));
    }
  }

  void checkSet(String set) {
    if (set == setX) {
      setXasWinner();
    }
    if (set == setO) {
      setOasWinner();
    }
  }

  void setOasWinner() {
    winner = playerO;
    isComplete = true;
  }

  void setXasWinner() {
    winner = playerX;
    isComplete = true;
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
