import 'package:flutter/material.dart';
import 'drawing.dart';
import 'logic.dart';

class Cell extends StatefulWidget {
  const Cell({Key key, this.state, this.gamestate, this.callParent})
      : super(key: key);
  final cellstate state;
  final game gamestate;
  final Function callParent;
  @override
  State<StatefulWidget> createState() => new CellState();
}

class CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    void handleTap() {
      setState(() {
        if (widget.state.value == 2) {
          widget.gamestate.currentplayer ^= 1;
          print(widget.gamestate);
          widget.state.value = widget.gamestate.currentplayer;
          widget.callParent();
        }
      });
    }

    Widget chooseDrawing() {
      Widget drawing;
      if (widget.state.value == 0) {
        drawing = X_animated(type: 0);
      } else if (widget.state.value == 1) {
        drawing = X_animated(
          type: 1,
        );
      } else {
        drawing = Container(
          child: Text(""),
        );
      }
      return drawing;
    }

    Widget drawing = chooseDrawing();
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.blue),
          ),
          width: 100,
          height: 100,
          child: Center(
            child: drawing,
          ),
        ),
        onTap: handleTap);
  }
}
