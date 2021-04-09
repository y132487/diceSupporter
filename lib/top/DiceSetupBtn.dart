import 'package:dices_supporter/main.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'DiceSetupBean.dart';
import 'package:easy_localization/easy_localization.dart';

class DiceSetupBtn extends StatefulWidget {
  final Function setDiceNum;
  DiceSetupBtn(this.setDiceNum);

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
  double diceNum = 1;

  void _setCheckedToXml(int number, bool checked) {
    setState(() {
      prefs.setBool('checked$number', checked);
    });
  }

  void _setDiceNumToXml(double diceNum) {
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
    this.diceNum = prefs.getDouble('diceNum') ?? 1;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadCheckedFromXml();
      _loadDiceNumFromXml();
    });
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
            if (checked1) DiceSetupBean(1),
            if (checked2) DiceSetupBean(2),
            if (checked3) DiceSetupBean(3),
            if (checked4) DiceSetupBean(4),
            if (checked5) DiceSetupBean(5),
            if (checked6) DiceSetupBean(6),
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
                      title: Text(
                        "diceChooseTitle".tr(),
                        textAlign: TextAlign.center,
                      ),
                      content: Scrollbar(
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // combobox
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Slider(
                                    value: diceNum,
                                    min: 1,
                                    max: 20,
                                    divisions: 20,
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.black,
                                    onChanged: (double newValue) {
                                      setState(() {
                                        diceNum = newValue;
                                      });
                                    },
                                    onChangeEnd: (double newValue) {
                                      setState(() {
                                        _setDiceNumToXml(newValue);
                                      });
                                    },
                                  ),
                                  Text(diceNum.toInt().toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked1,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked1 = value;
                                        _setCheckedToXml(1, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice1.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked2 = value;
                                        _setCheckedToXml(2, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice2.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked3,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked3 = value;
                                        _setCheckedToXml(3, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice3.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked4,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked4 = value;
                                        _setCheckedToXml(4, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice4.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked5,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked5 = value;
                                        _setCheckedToXml(5, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice5.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: checked6,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checked6 = value;
                                        _setCheckedToXml(6, value);
                                      });
                                    },
                                  ),
                                  Image.asset('images/dice6.png',
                                      height: constraints.maxHeight / 20),
                                ],
                              ),
                            ],
                          ),
                        ),
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
