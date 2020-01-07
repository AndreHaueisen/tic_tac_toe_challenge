import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/actions/play_action.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_challenge/widgets/neu_cross.dart';
import 'package:tic_tac_toe_challenge/widgets/neu_nought.dart';
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
        assert(position != null, 'Board piece received null position'),
        assert(crossCount != null, 'Board piece received null crossCount'),
        assert(noughtCount != null, 'Board piece received null noughtCount'),
        assert(gameStage != null, 'Game Stage received null gameStage');

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
    final double containerSideSize = MediaQuery.of(context).size.width / 3;

    return GestureDetector(
      onTap: (state == 0 && gameStage == GameStage.PLAYING)
          ? () {
              _play();
            }
          : null,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: containerSideSize,
        height: containerSideSize,
        child: _buildPiece(containerSideSize),
      ),
    );
  }

  Widget _buildPiece(double containerSize) {
    if (state == -1) {
      return NeuCross(size: containerSize * 0.6);
    } else if (state == 1) {
      return NeuNought(size: containerSize * 0.6);
    } else {
      return _buildEmptyPlaceholder(containerSize * 0.6);
    }
  }

  Widget _buildEmptyPlaceholder(double size) {
    return Container(
      height: size,
      width: size,
      color: Colors.transparent,
    );
  }
}
