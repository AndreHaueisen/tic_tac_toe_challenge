import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/models/tic_tac_toe_model.dart';
import 'package:tic_tac_toe_challenge/widgets/board_piece.dart';
import 'package:vector_math/vector_math.dart' as vMath;

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BoardPainter(),
      child: AspectRatio(
        aspectRatio: 1,
        child: StoreConnector(
          model: TicTacToeModel(),
          builder: (_, TicTacToeModel ticTacToeModel) {
            return _buildPlayableBoard(ticTacToeModel);
          },
        ),
      ),
    );
  }

  Widget _buildPlayableBoard(TicTacToeModel ticTacToeModel) {
    List<Widget> children = List.generate(9, (index) {
      final int row = (index / 3).floor();
      final int column = index % 3;
      return BoardPiece(
        position: vMath.Vector2(row.toDouble(), column.toDouble()),
        state: ticTacToeModel.ticTacToeMatrix.entry(row, column).round(),
        crossCount: ticTacToeModel.crossCount,
        noughtCount: ticTacToeModel.noughtsCount,
        gameStage: ticTacToeModel.gameStage,
      );
    });

    return GridView.count(
      reverse: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      crossAxisCount: 3,
      children: children,
    );
  }
}

class BoardPainter extends CustomPainter {
  final _boardPaint = Paint();

  BoardPainter() {
    _boardPaint
      ..color = Colors.indigo[800]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.drawLine(Offset(size.width / 3, 0), Offset(size.width / 3, size.height), _boardPaint);
    canvas.drawLine(Offset(size.width / 1.5, 0), Offset(size.width / 1.5, size.height), _boardPaint);
    canvas.drawLine(Offset(0, size.height / 3), Offset(size.width, size.height / 3), _boardPaint);
    canvas.drawLine(Offset(0, size.height / 1.5), Offset(size.width, size.height / 1.5), _boardPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
