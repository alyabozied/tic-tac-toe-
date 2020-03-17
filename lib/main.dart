// import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dialog.dart';
import 'logic.dart';
import 'cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Board());
  }
}

class Board extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BoardState();
}

class BoardState extends State<Board> {
  final TextStyle _biggerFont = TextStyle(fontSize: 30);
  final game gamestate = new game(1);
  final List<cellstate> _state = List.generate(9, (index) {
    return new cellstate(2);
  });
  void clear() {
    setState(() {
      for (int i = 0; i < _state.length; i++) {
        _state[i].value = 2;
      }
      gamestate.currentplayer = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentCase = checkWinner(_state);
    RichText winner;
    if (currentCase != " ") {
      winner = RichText(
        text: TextSpan(style: TextStyle(),
            // style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: currentCase,
                  style: TextStyle(
                    color: currentCase == "X"
                        ? Colors.red
                        : currentCase == "O" ? Colors.blue : Colors.grey,
                    fontSize: 40,
                  )),
              TextSpan(
                text: currentCase != "Draw" ? "  won" : "",
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
            ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: currentCase != " "
          ? Container(
              child: Center(child: winner),
            )
          : Stack(
              children: [
                GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return Container(
                      width: 20,
                      height: 20,
                      // color: Colors.yellow,
                      child: Cell(
                        state: _state[index],
                        gamestate: gamestate,
                        callParent: () {
                          setState(() {});
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          clear();
        },
        label: Text("clear"),
      ),
    );
  }
}
