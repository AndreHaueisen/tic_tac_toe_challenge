
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:vector_math/vector_math.dart';

class RestartAction extends ReduxAction<AppState>{

  @override
  FutureOr<AppState> reduce() {
    final Matrix3 _emptyMatrix = Matrix3.zero();

    return state.copy(ticTacToeState: TicTacToeState(
      ticTacToeMatrix: _emptyMatrix,
      crossCount: 0,
      noughtCount: 0,
      gameStage: GameStage.PLAYING,
    ));
  }

}