import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/actions/play_action.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:vector_math/vector_math.dart' as vMath;

import '../main.dart';

class BoardPiece extends StatelessWidget {
  final vMath.Vector2 position;
  final int state;
  final int crossCount;
  final int noughtCount;
  final GameStage gameStage;

  BoardPiece({
    @required this.position,
    @required this.state,
    @required this.crossCount,
    @required this.noughtCount,
    @required this.gameStage,
  })  : assert(state != null, 'Board piece received null state'),
        assert(position != null, 'Board piece received null position');

  void _play() {
    final bool isCross = crossCount == noughtCount;

    store.dispatch(
      PlayAction(
        isCross: isCross,
        position: position,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color stateColor;
    if (state == 0) {
      stateColor = Colors.yellow;
    } else if (state == 1) {
      stateColor = Colors.green;
    } else if (state == -1) {
      stateColor = Colors.red;
    }

    assert(stateColor != null);

    return GestureDetector(
      onTap: (state == 0 && gameStage == GameStage.PLAYING)
          ? () {
              _play();
            }
          : null,
      child: Container(
        color: stateColor,
      ),
    );
  }
}
