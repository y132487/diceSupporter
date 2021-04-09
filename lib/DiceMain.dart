import 'package:dices_supporter/middle/ReRollBtn.dart';
import 'package:dices_supporter/middle/Result.dart';
import 'package:dices_supporter/middle/RollBtn.dart';
import 'package:dices_supporter/top/DiceSetupBtn.dart';
import 'package:dices_supporter/top/SettingBtn.dart';
import 'package:flutter/material.dart';

class DiceMain extends StatefulWidget {
  final String title;
  DiceMain({Key key, this.title}) : super(key: key);

  @override
  _DiceMainState createState() => _DiceMainState();
}

class _DiceMainState extends State<DiceMain> {
  int result = 0;
  double diceNum = 1;

  void setResult(int result) {
    setState(() {
      this.result = result;
    });
  }

  void setDiceNum(double diceNum) {
    setState(() {
      this.diceNum = diceNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SettingBtn(),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: DiceSetupBtn(setDiceNum),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ReRollBtn(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Result(result),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: RollBtn(setResult),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text("Dices(GridView)"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
