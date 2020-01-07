import 'package:flutter/material.dart';

class NeuNought extends StatelessWidget {

  final double size;

  NeuNought({@required this.size}) : assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: size,
        width: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4),
              BoxShadow(color: Colors.indigo[800], offset: Offset(-2, -2), blurRadius: 4)
            ],
            color: Colors.indigo[900]),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 12, color: Colors.white),
            color: Colors.indigo[900],
          ),
        ),
      ),
    );
  }
}
