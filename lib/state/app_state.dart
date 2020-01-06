import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';

class AppState {
  final TicTacToeState ticTacToeState;

  AppState({
    this.ticTacToeState,
  });

  AppState copy({TicTacToeState ticTacToeState}) {
    return AppState(ticTacToeState: ticTacToeState ?? this.ticTacToeState);
  }

  static AppState initialState() => AppState(ticTacToeState: TicTacToeState.initialState());

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppState && runtimeType == other.runtimeType && ticTacToeState == other.ticTacToeState;

  @override
  int get hashCode => ticTacToeState.hashCode;
}
