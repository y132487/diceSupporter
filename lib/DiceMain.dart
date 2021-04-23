import 'dart:math';

import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:dices_supporter/bottom/ViewDices.dart';
import 'package:dices_supporter/middle/ReRollBtn.dart';
import 'package:dices_supporter/middle/Result.dart';
import 'package:dices_supporter/middle/RollBtn.dart';
import 'package:dices_supporter/top/DiceSetupBtn.dart';
import 'package:dices_supporter/top/SettingBtn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'enum/Enum.dart';
import 'main.dart';

class DiceMain extends StatefulWidget {
  final String title;
  DiceMain({Key key, this.title}) : super(key: key);

  @override
  _DiceMainState createState() => _DiceMainState();
}

class _DiceMainState extends State<DiceMain> {
  bool rolled = false;
  int result = 0;
  double diceCount = 1;
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
  var diceBeanList = <DiceBean>[];

  @override
  void initState() {
    super.initState();
    updateSettingBean();
    setRealDiceColor(SettingBean.diceColor);

  }

  void updateSettingBean(){
    setState(() {
      SettingBean.lang = prefs.getString('language') ?? describeEnum(Language.en);
      SettingBean.diceImgPath = prefs.getString('diceImgPath') ?? describeEnum(DiceImgPath.normal);
      SettingBean.diceColor = prefs.getString('diceColor') ?? describeEnum(DiceColor.blue);
      setRealDiceColor(SettingBean.diceColor);
    });
  }

  void setRealDiceColor(String color){
    if(color == describeEnum(DiceColor.blue)){
      SettingBean.realDiceColor = Colors.blue;
    } else if(color == describeEnum(DiceColor.red)){
      SettingBean.realDiceColor = Colors.red;
    }else if(color == describeEnum(DiceColor.amber)){
      SettingBean.realDiceColor = Colors.amber;
    }else if(color == describeEnum(DiceColor.green)){
      SettingBean.realDiceColor = Colors.green;
    }
  }

  void setRolled(bool rolled) {
    setState(() {
      this.rolled = rolled;
      this.diceBeanList = [];
    });
  }

  void setResult(int result) {
    setState(() {
      this.result = result;
    });
  }

  void setDiceNum(double diceCount) {
    this.diceCount = diceCount;
  }

  void setCheckedList(List checkedList) {
    this.checkedList = checkedList;
  }

  void updateCheckedList(int num, bool checked) {
    this.checkedList[num] = checked;
  }

  //Tap on ROLL Button
  void rollToResult() {
    setState(() {
      int diceCount = this.diceCount.toInt();
      this.diceBeanList = [];
      int result = 0;
      var rnd = Random();
      for (int i = 0; i < diceCount; i++) {
        int randomNum = rnd.nextInt(6) + 1;
        this
            .diceBeanList
            .add(DiceBean(i, randomNum, false, this.checkedList[randomNum]));
        if (this.checkedList[randomNum]) {
          result++;
        }
      }
      setResult(result);
    });
  }

  //Tap on REROLL Button
  void reRollToResult() {
    if (!rolled) {
      Fluttertoast.showToast(msg: "tstPlzFirstRoll".tr());
      return;
    } else {
      bool selectedOne = false;
      for (int i = 0; i < this.diceBeanList.length; i++) {
        if (this.diceBeanList[i].diceSelected) {
          selectedOne = this.diceBeanList[i].diceSelected;
          break;
        }
      }
      if (!selectedOne) {
        Fluttertoast.showToast(msg: "tstNoSelectedDices".tr());
        return;
      }
    }

    setState(() {
      int result = 0;
      var rnd = Random();
      for (int i = 0; i < this.diceBeanList.length; i++) {
        int diceNum = 0;
        if (this.diceBeanList[i].diceSelected) {
          int randomNum = rnd.nextInt(6) + 1;
          this.diceBeanList[i] =
              DiceBean(i, randomNum, false, this.checkedList[randomNum]);
          diceNum = randomNum;
        } else {
          diceNum = this.diceBeanList[i].diceNum;
        }
        if (this.checkedList[diceNum]) {
          result++;
        }
      }
      setResult(result);
    });
  }

  //Tap on Dices of Bottom
  void updateSelectedDice(int idNum) {
    setState(() {
      if (diceBeanList[idNum].diceSelected) {
        diceBeanList[idNum].diceSelected = false;
      } else {
        diceBeanList[idNum].diceSelected = true;
      }
    });
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
                    child: SettingBtn(updateSettingBean),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: DiceSetupBtn(setDiceNum, setCheckedList,
                          updateCheckedList, setRolled, diceBeanList),
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
                      child: ReRollBtn(reRollToResult),
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
                      child: RollBtn(setRolled, rollToResult),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Center(
                  child: ViewDices(rolled, diceBeanList, updateSelectedDice),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
