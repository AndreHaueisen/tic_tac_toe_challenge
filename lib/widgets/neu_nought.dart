import 'package:flutter/material.dart';

class NeuNought extends StatefulWidget {
  final double size;

  NeuNought({@required this.size}) : assert(size != null);

  @override
  _NeuNoughtState createState() => _NeuNoughtState();
}

class _NeuNoughtState extends State<NeuNought> with SingleTickerProviderStateMixin {
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
    return Align(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return Container(
            padding: const EdgeInsets.all(12),
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: blackShadowColorAnimation.value, offset: Offset(2, 2), blurRadius: 4),
                  BoxShadow(color: neuShadowColorAnimation.value, offset: Offset(-2, -2), blurRadius: 4)
                ],
                color: Colors.indigo[900]),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 12, color: decorationColorAnimation.value),
                color: Colors.indigo[900],
              ),
            ),
          );
        },
      ),
    );
  }
}
