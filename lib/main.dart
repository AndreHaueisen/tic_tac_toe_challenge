import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';

import 'actions/increment_action.dart';
import 'models/counter_model.dart';

void main() => runApp(MyApp());

final AppState state = AppState.initialState();
final Store store = Store<AppState>(
  initialState: state
);

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
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    store.dispatch(IncrementAction());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector(
              model: CounterModel(),
              builder: (_, CounterModel counterModel) {
                print('Counter text rebuilt');
                return Text(
                  '${counterModel.counter}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
