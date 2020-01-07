import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:vector_math/vector_math.dart';
import 'package:tic_tac_toe_challenge/extensions/matrix3_extension.dart';

class PlayAction extends ReduxAction<AppState> {
  final Vector3 _crossVictoryVector = Vector3.all(-1.0);
  final Vector3 _noughtVictoryVector = Vector3.all(1.0);

  final bool isCross;
  final Vector2 position;

  /// defaults to 1
  PlayAction({@required this.isCross, @required this.position});

  @override
  AppState reduce() {

    state.ticTacToeState.ticTacToeMatrix.setEntry(position.x.round(), position.y.round(), isCross ? -1 : 1);

    final Matrix3 toUpdateMatrix = Matrix3.copy(state.ticTacToeState.ticTacToeMatrix);
    toUpdateMatrix.setEntry(position.x.round(), position.y.round(), isCross ? -1 : 1);

    int toUpdateCrossCount = state.ticTacToeState.crossCount;
    int toUpdateNoughtCount = state.ticTacToeState.noughtCount;

    isCross ? toUpdateCrossCount++ : toUpdateNoughtCount++;

    final GameStage gameStage = _getGameState(toUpdateCrossCount, toUpdateNoughtCount, toUpdateMatrix);

    return state.copy(
      ticTacToeState: TicTacToeState(
        ticTacToeMatrix: toUpdateMatrix,
        crossCount: toUpdateCrossCount,
        noughtCount: toUpdateNoughtCount,
        gameStage: gameStage,
      ),
    );
  }

  GameStage _getGameState(int updatedCrossCount, int updatedNoughtCount, Matrix3 updatedMatrix) {

    if(updatedCrossCount + updatedNoughtCount <= 4) return GameStage.PLAYING;

    if (updatedMatrix.getColumn(0) == _crossVictoryVector ||
        updatedMatrix.getColumn(1) == _crossVictoryVector ||
        updatedMatrix.getColumn(2) == _crossVictoryVector ||
        updatedMatrix.getRow(0) == _crossVictoryVector ||
        updatedMatrix.getRow(1) == _crossVictoryVector ||
        updatedMatrix.getRow(2) == _crossVictoryVector ||
        updatedMatrix.getLeftDiagonal() == _crossVictoryVector ||
        updatedMatrix.getRightDiagonal() == _crossVictoryVector) {
      return GameStage.CROSSES_VICTORY;
    }

    if (updatedMatrix.getColumn(0) == _noughtVictoryVector ||
        updatedMatrix.getColumn(1) == _noughtVictoryVector ||
        updatedMatrix.getColumn(2) == _noughtVictoryVector ||
        updatedMatrix.getRow(0) == _noughtVictoryVector ||
        updatedMatrix.getRow(1) == _noughtVictoryVector ||
        updatedMatrix.getRow(2) == _noughtVictoryVector ||
        updatedMatrix.getLeftDiagonal() == _noughtVictoryVector ||
        updatedMatrix.getRightDiagonal() == _noughtVictoryVector) {
      return GameStage.NOUGHTS_VICTORY;
    }

    if (updatedCrossCount + updatedNoughtCount == 9) return GameStage.DRAW;

    return GameStage.PLAYING;
  }
}
