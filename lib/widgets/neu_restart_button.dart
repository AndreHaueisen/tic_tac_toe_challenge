import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/actions/restart_action.dart';
import 'package:tic_tac_toe_challenge/main.dart';

class NeuRestartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        store.dispatch(RestartAction());
      },
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4),
            BoxShadow(color: Colors.indigo[800], offset: Offset(-2, -2), blurRadius: 4)
          ],
          color: Colors.indigo[900],
        ),
        child: Icon(
          Icons.restore,
          color: Colors.white,
        ),
      ),
    );
  }
}
