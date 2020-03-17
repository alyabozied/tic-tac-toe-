import 'package:flutter/material.dart';

enum DialogAction { yes, no }

class Dialogs {
  static DialogAction yesAbortDialog(
      BuildContext context, String title, String body) {
    DialogAction action1;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(title),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(DialogAction.no),
                child: const Text("no"),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(DialogAction.yes),
                child: const Text("yes"),
              ),
            ],
          );
        }).then((action) => {action1 = action});
    return action1;
  }
}
