class GameUtils {
  /// Returns the winning pattern (list of indices) for the given winner,
  /// or null if no win.
  /// For Tic Tac Toe, winning patterns are:
  /// - Rows: [0,1,2], [3,4,5], [6,7,8]
  /// - Columns: [0,3,6], [1,4,7], [2,5,8]
  /// - Diagonals: [0,4,8], [2,4,6]
  static List<int>? getWinningPattern(List<int> board, int winningCandidate) {
    final winPatterns = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // Diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (final pattern in winPatterns) {
      if (board[pattern[0]] == winningCandidate &&
          board[pattern[1]] == winningCandidate &&
          board[pattern[2]] == winningCandidate) {
        return pattern;
      }
    }
    return null;
  }

  static WinningPatternType? getWinningPatternType(
    List<int> board,
    int winningCandidate,
  ) {
    final winningPattern = getWinningPattern(board, winningCandidate);
    if (winningPattern == null) {
      return null;
    }
    if (winningPattern[0] ~/ 3 == winningPattern[1] ~/ 3) {
      return WinningPatternType.row;
    } else if (winningPattern[0] % 3 == winningPattern[1] % 3) {
      return WinningPatternType.column;
    } else {
      return WinningPatternType.diagonal;
    }
  }

  /// Checks if the board is full (no empty cells).
  static bool isBoardFull(List<int> board) {
    return board.every((cell) => cell != -1);
  }

  /// Checks if there is a winner on the board.
  static bool hasWinner(List<int> board) {
    return getWinningPattern(board, XorO.x.symbolValue) != null ||
        getWinningPattern(board, XorO.o.symbolValue) != null;
  }

  /// Returns the player number (1 or 0) who has won, or -1 if no winner.
  static int winningPlayer(List<int> board) {
    if (getWinningPattern(board, XorO.x.symbolValue) != null) {
      return 1;
    } else if (getWinningPattern(board, XorO.o.symbolValue) != null) {
      return 0;
    } else {
      return -1; // No winner
    }
  }

  /// Checks if the game is a draw (board full and no winner).
  static bool isDraw(List<int> board) =>
      !hasWinner(board) && isBoardFull(board);
}

enum XorO {
  x(1, 'X'),
  o(0, 'O')
  ;

  const XorO(this.symbolValue, this.displayValue);
  final int symbolValue;
  final String displayValue;
}

enum WinningPatternType {
  row,
  column,
  diagonal,
}
