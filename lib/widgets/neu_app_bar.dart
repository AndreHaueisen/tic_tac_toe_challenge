import 'package:flutter/material.dart';

class NeuAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset(3, 3), blurRadius: 4, spreadRadius: 1),
          BoxShadow(color: Colors.indigo[800], offset: Offset(-3, -3), blurRadius: 3, spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.indigo[900],
      ),
      child: Text(
        'Tic Tac Toe',
        style: TextStyle(
          color: Colors.indigo[100],
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
