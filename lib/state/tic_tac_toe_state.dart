class TicTacToeState {

  final int counter;

  TicTacToeState({this.counter});

  TicTacToeState copy({int counter}) {
    return TicTacToeState(
        counter: counter ?? this.counter);
  }

  static TicTacToeState initialState() => TicTacToeState(counter: 0);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is TicTacToeState && runtimeType == other.runtimeType &&
        this.counter == other.counter;
  }

  @override
  int get hashCode => this.counter.hashCode;
}