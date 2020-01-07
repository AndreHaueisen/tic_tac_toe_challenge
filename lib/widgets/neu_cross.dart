import 'dart:math' as math;
import 'package:flutter/material.dart';

class NeuCross extends StatefulWidget {
  final double size;

  NeuCross({@required this.size}) : assert(size != null);

  @override
  _NeuCrossState createState() => _NeuCrossState();
}

class _NeuCrossState extends State<NeuCross> with SingleTickerProviderStateMixin {
  static const double _crossWidth = 20;

  AnimationController _animationController;
  Animation neuShadowColorAnimation;
  Animation blackShadowColorAnimation;
  Animation decorationColorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    neuShadowColorAnimation = ColorTween(begin: Colors.indigo[900], end: Colors.indigo[800]).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate),
    );

    blackShadowColorAnimation = ColorTween(begin: Colors.transparent, end: Colors.black54).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate),
    );

    decorationColorAnimation = ColorTween(begin: Colors.indigo[900], end: Colors.white).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) {
                return Container(
                  height: widget.size,
                  width: _crossWidth,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: blackShadowColorAnimation.value, offset: Offset(1, 1), blurRadius: 2),
                      BoxShadow(color: neuShadowColorAnimation.value, offset: Offset(0, -1), blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.indigo[900],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: decorationColorAnimation.value),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.indigo[900],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: math.pi / 4,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) {
                return Container(
                  height: widget.size,
                  width: _crossWidth,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: blackShadowColorAnimation.value, offset: Offset(1, 1), blurRadius: 2),
                      BoxShadow(color: neuShadowColorAnimation.value, offset: Offset(-1, -1), blurRadius: 2),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.indigo[900],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: decorationColorAnimation.value),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.indigo[900],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
