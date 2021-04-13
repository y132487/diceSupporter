import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class RollBtn extends StatefulWidget {
  final Function setRolled;
  final Function rollToResult;
  RollBtn(this.setRolled, this.rollToResult);
  @override
  _RollBtnState createState() => _RollBtnState();
}

class _RollBtnState extends State<RollBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text("ROLL"),
        ),
        decoration: BoxDecoration(border: Border.all()),
      ),
      onTap: () {
        setState(() {
          widget.setRolled(true);
          widget.rollToResult();
        });
      },
    );
  }

  _increamentCount() {
    int a = prefs.getInt('test') ?? 0;
    if (a >= 99) {
      prefs.setInt('test', 0);
    } else {
      prefs.setInt('test', a + 1);
    }

    a = prefs.getInt('test');



    Fluttertoast.showToast(
      msg: '$a',
      //toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      //timeInSecForIosWeb: 3
    );
  }
}
