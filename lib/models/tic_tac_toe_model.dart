import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:vector_math/vector_math.dart';

class TicTacToeModel extends BaseModel<AppState> {
  Matrix3 ticTacToeMatrix;
  int crossCount;
  int noughtsCount;
  GameStage gameStage;

  TicTacToeModel();

  TicTacToeModel.build({
    @required this.ticTacToeMatrix,
    @required this.crossCount,
    @required this.noughtsCount,
    @required this.gameStage,
  }) : super(equals: [ticTacToeMatrix, crossCount, noughtsCount, gameStage]);

  @override
  BaseModel fromStore() {
    var k = TicTacToeModel.build(
      ticTacToeMatrix: state.ticTacToeState.ticTacToeMatrix,
      crossCount: state.ticTacToeState.crossCount,
      noughtsCount: state.ticTacToeState.noughtCount,
      gameStage: state.ticTacToeState.gameStage,
    );
    print(' Model matrix \n ${k.ticTacToeMatrix}');
    return k;
  }
}
