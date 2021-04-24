import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:dices_supporter/main.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'DiceSetupBean.dart';
import 'package:easy_localization/easy_localization.dart';

class DiceSetupBtn extends StatefulWidget {
  final Function setDiceNum;
  final Function setCheckedList;
  final Function updateCheckedList;
  final Function setRolled;
  var diceBeanList = <DiceBean>[];
  DiceSetupBtn(this.setDiceNum, this.setCheckedList, this.updateCheckedList,
      this.setRolled, this.diceBeanList);

  @override
  _DiceSetupBtnState createState() => _DiceSetupBtnState();
}

class _DiceSetupBtnState extends State<DiceSetupBtn> {
  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;
  bool checked4 = false;
  bool checked5 = false;
  bool checked6 = false;
  double diceCount = 1;

  void _setCheckedToXml(int number, bool checked) {
    widget.setRolled(false);
    setState(() {
      prefs.setBool('checked$number', checked);
    });
    widget.updateCheckedList(number, checked);
  }

  void _setDiceNumToXml(double diceNum) {
    widget.setRolled(false);
    setState(() {
      prefs.setDouble('diceNum', diceNum);
      widget.setDiceNum(diceNum);
    });
  }

  void _loadCheckedFromXml() {
    checked1 = prefs.getBool('checked1') ?? false;
    checked2 = prefs.getBool('checked2') ?? false;
    checked3 = prefs.getBool('checked3') ?? false;
    checked4 = prefs.getBool('checked4') ?? false;
    checked5 = prefs.getBool('checked5') ?? false;
    checked6 = prefs.getBool('checked6') ?? false;
  }

  void _loadDiceNumFromXml() {
    this.diceCount = prefs.getDouble('diceNum') ?? 1;
    widget.setDiceNum(diceCount);
  }

  void _initCheckedList() {
    List checkedList = <bool>[
      false, //dummy flag
      checked1,
      checked2,
      checked3,
      checked4,
      checked5,
      checked6,
    ];
    widget.setCheckedList(checkedList);
  }

  int _getEachResult(int num) {
    int result = 0;
    if (widget.diceBeanList.isEmpty) return result;
    for (int i = 0; i < widget.diceBeanList.length; i++) {
      if (widget.diceBeanList[i] != null) {
        if (widget.diceBeanList[i].diceNum == num) {
          result++;
        }
      }
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadCheckedFromXml();
      _loadDiceNumFromXml();
    });
    _initCheckedList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (!checked1 &&
                !checked2 &&
                !checked3 &&
                !checked4 &&
                !checked5 &&
                !checked6)
              Center(child: Text("tapHere".tr())),
            if (checked1) DiceSetupBean(1, _getEachResult(1)),
            if (checked2) DiceSetupBean(2, _getEachResult(2)),
            if (checked3) DiceSetupBean(3, _getEachResult(3)),
            if (checked4) DiceSetupBean(4, _getEachResult(4)),
            if (checked5) DiceSetupBean(5, _getEachResult(5)),
            if (checked6) DiceSetupBean(6, _getEachResult(6)),
          ],
        ),
        onTap: () {
          setState(() {});
          return showDialog(
              context: context,
              builder: (context) {
                return LayoutBuilder(
                  builder: (context, constraints) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "diceCountTitle".tr() +
                                diceCount.toInt().toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // combobox
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: MaterialButton(
                                      child: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        setState(() {
                                          if (diceCount.toInt() > 1) {
                                            diceCount =
                                                (diceCount - 1).floorToDouble();
                                            _setDiceNumToXml(diceCount);
                                          }
                                        });
                                      })),
                              Expanded(
                                flex: 6,
                                child: Slider(
                                  value: diceCount,
                                  min: 1,
                                  max: 20,
                                  divisions: 20,
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.black,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      diceCount = newValue.floorToDouble();
                                    });
                                  },
                                  onChangeEnd: (double newValue) {
                                    setState(() {
                                      _setDiceNumToXml(
                                          newValue.floorToDouble());
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: MaterialButton(
                                      child: Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        setState(() {
                                          if (diceCount.toInt() < 20) {
                                            diceCount =
                                                (diceCount + 1).floorToDouble();
                                            _setDiceNumToXml(diceCount);
                                          }
                                        });
                                      })),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 10.0,
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("successDiceTitle".tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice1.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked1,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked1 = value;
                                            _setCheckedToXml(1, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice2.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked2,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked2 = value;
                                            _setCheckedToXml(2, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice3.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked3,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked3 = value;
                                            _setCheckedToXml(3, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice4.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked4,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked4 = value;
                                            _setCheckedToXml(4, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice5.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked5,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked5 = value;
                                            _setCheckedToXml(5, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'images/${SettingBean.diceImgPath}/dice6.png',
                                          height: constraints.maxHeight / 20),
                                      Checkbox(
                                        value: checked6,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checked6 = value;
                                            _setCheckedToXml(6, value);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              });
        },
      ),
    );
  }
}
