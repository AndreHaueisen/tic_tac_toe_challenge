import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';

class CounterModel extends BaseModel<AppState> {
  int counter;

  CounterModel();
  CounterModel.build({@required this.counter}) : super(equals: [counter]);

  @override
  BaseModel fromStore() {
    var k = CounterModel.build(counter: state.ticTacToeState.counter);
    print('view model counter: ${k.counter}');
    return k;
  }
}
