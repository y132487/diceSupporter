import 'package:dices_supporter/bottom/ViewDices.dart';
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
  bool rolled = false;
  int result = 0;
  double diceNum = 1;
  List checkedList = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ]; //index0 is dummy flag

  //after tapped roll button(or reroll button)
  List<bool> resultDiceList;
  List<int> numDiceList;
  List<bool> selectedDiceList;

  void setRolled(bool rolled) {
    setState(() {
      this.rolled = rolled;
    });
  }

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

  void setCheckedList(List checkedList) {
    this.checkedList = checkedList;
    print(checkedList.toString());
  }

  void updateCheckedList(int num, bool checked) {
    this.checkedList[num] = checked;
    print(checkedList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      child: DiceSetupBtn(setDiceNum, setCheckedList,
                          updateCheckedList, setRolled),
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
                      child: Result(result, rolled),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: RollBtn(setResult, setRolled),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Center(
                  child: ViewDices(rolled),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
