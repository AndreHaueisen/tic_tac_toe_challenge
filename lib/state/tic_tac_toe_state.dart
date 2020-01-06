import 'package:vector_math/vector_math.dart';

class TicTacToeState {
  static final Matrix3 _emptyMatrix = Matrix3.columns(Vector3(0, 0, 0), Vector3(0, 0, 0), Vector3(0, 0, 0));

  final Matrix3 ticTacToeMatrix;
  final int crossCount;
  final int noughtCount;
  final GameStage gameStage;

  TicTacToeState({this.ticTacToeMatrix, this.crossCount, this.noughtCount, this.gameStage});

  TicTacToeState copy({
    Vector2 ticTacToeMatrix,
    int crossCount,
    int noughtsCount,
    GameStage gameStage,
  }) {
    return TicTacToeState(
      ticTacToeMatrix: ticTacToeMatrix ?? this.ticTacToeMatrix,
      crossCount: crossCount ?? this.crossCount,
      noughtCount: noughtsCount ?? this.noughtCount,
      gameStage: gameStage ?? this.gameStage,
    );
  }

  static TicTacToeState initialState() => TicTacToeState(
        ticTacToeMatrix: _emptyMatrix,
        crossCount: 0,
        noughtCount: 0,
        gameStage: GameStage.PLAYING,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TicTacToeState &&
            runtimeType == other.runtimeType &&
            this.ticTacToeMatrix == other.ticTacToeMatrix &&
            this.crossCount == other.crossCount &&
            this.noughtCount == other.noughtCount &&
            this.gameStage == other.gameStage;
  }

  @override
  int get hashCode => this.ticTacToeMatrix.hashCode ^ crossCount.hashCode ^ noughtCount.hashCode ^ gameStage.hashCode;
}

enum GameStage { PLAYING, CROSSES_VICTORY, NOUGHTS_VICTORY, DRAW }