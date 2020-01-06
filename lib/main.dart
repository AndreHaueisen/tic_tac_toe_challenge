import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/widgets/board.dart';

void main() => runApp(MyApp());

final AppState state = AppState.initialState();
final Store store = Store<AppState>(initialState: state);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe challenge'),
      ),
      body: Center(
        child: Board(),
      ),
    );
  }
}
