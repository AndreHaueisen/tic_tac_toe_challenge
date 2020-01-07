import 'dart:math' as math;
import 'package:flutter/material.dart';

class NeuCross extends StatelessWidget {
  static const double _crossWidth = 20;
  final double size;

  NeuCross({@required this.size}) : assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              height: size,
              width: _crossWidth,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 2),
                  BoxShadow(color: Colors.indigo[800], offset: Offset(0, -1), blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.indigo[900],
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.indigo[900],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              height: size,
              width: _crossWidth,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 2),
                  BoxShadow(color: Colors.indigo[800], offset: Offset(-1, -1), blurRadius: 2),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.indigo[900],
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.indigo[900],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
