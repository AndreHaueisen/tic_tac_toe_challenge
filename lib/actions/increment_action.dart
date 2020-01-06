
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';

class IncrementAction extends ReduxAction<AppState> {

  final int amount;

  /// defaults to 1
  IncrementAction({this.amount = 1});

  @override
  AppState reduce() {
    print('reduce called: $amount');
    print('ttt counter: ${state.ticTacToeState.counter}');
    return state.copy(ticTacToeState: TicTacToeState(counter: state.ticTacToeState.counter + amount));
  }

}