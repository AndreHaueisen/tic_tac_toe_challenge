import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_challenge/state/app_state.dart';
import 'package:tic_tac_toe_challenge/state/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_challenge/widgets/board.dart';
import 'package:tic_tac_toe_challenge/widgets/neu_app_bar.dart';
import 'package:tic_tac_toe_challenge/widgets/neu_restart_button.dart';

import 'models/tic_tac_toe_model.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.yellowAccent,
          primaryColor: Colors.indigo[800],
          canvasColor: Colors.indigo[900],
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  String victoryText = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: NeuAppBar(),
          ),
          Board(),
          Row(
            children: [
              Expanded(
                child: StoreConnector(
                  model: TicTacToeModel(),
                  builder: (_, TicTacToeModel model) {

                    if (model.gameStage == GameStage.CROSSES_VICTORY) {
                      victoryText = 'Crosses Victory!';
                    } else if (model.gameStage == GameStage.NOUGHTS_VICTORY) {
                      victoryText = 'Noughts Victory!';
                    } else if (model.gameStage == GameStage.DRAW) {
                      victoryText = 'Draw :(';
                    }

                    return AnimatedOpacity(
                      opacity: model.gameStage != GameStage.PLAYING ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeInOutCirc,
                      child: Text(
                          victoryText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: NeuRestartButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
