import 'dart:async';

import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:dices_supporter/enum/Enum.dart';
import 'package:dices_supporter/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingMain extends StatefulWidget {
  Function setSettingBeanToXml;
  Function setBgColorToXml;

  SettingMain(this.setSettingBeanToXml, this.setBgColorToXml);

  @override
  _SettingMainState createState() => _SettingMainState();
}

class _SettingMainState extends State<SettingMain> {
  final GlobalKey langKey = GlobalKey();
  final GlobalKey diceImgKey = GlobalKey();
  final GlobalKey diceColorKey = GlobalKey();

  int easterEggCount = 0;

  void _moveToSelectedWidget(GlobalKey key) {
    final keyContext = key.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: Duration(milliseconds: 200));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("settingMenuTitle".tr()),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  key: langKey,
                  onExpansionChanged: (value) {
                    if (value) {
                      _moveToSelectedWidget(langKey);
                    }
                  },
                  title: Text("setLangTitle".tr()),
                  children: [
                    RadioListTile(
                        title: Text("setLangEn".tr()),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(Language.en_US),
                        activeColor: Colors.black,
                        groupValue: SettingBean.lang,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.lang = value.toString();
                            widget.setSettingBeanToXml();
                            context.setLocale(Locale('en', 'US'));
                          });
                        }),
                    RadioListTile(
                        title: Text("setLangJa".tr()),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(Language.ja_JP),
                        activeColor: Colors.black,
                        groupValue: SettingBean.lang,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.lang = value.toString();
                            widget.setSettingBeanToXml();
                            context.setLocale(Locale('ja', 'JP'));
                          });
                        }),
                    RadioListTile(
                        title: Text("setLangKo".tr()),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(Language.ko_KR),
                        activeColor: Colors.black,
                        groupValue: SettingBean.lang,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.lang = value.toString();
                            widget.setSettingBeanToXml();
                            context.setLocale(Locale('ko', 'KR'));
                          });
                        }),
                  ],
                ),
                ExpansionTile(
                  key: diceImgKey,
                  onExpansionChanged: (value) {
                    if (value) {
                      _moveToSelectedWidget(diceImgKey);
                    }
                  },
                  title: Text("setDiceImgTitle".tr()),
                  children: [
                    RadioListTile(
                        title: Text("setDiceImgNor".tr()),
                        secondary: Image.asset("images/normal/dice6.png"),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.black,
                        value: describeEnum(DiceImgPath.normal),
                        groupValue: SettingBean.diceImgPath,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceImgPath = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setDiceImgNum".tr()),
                        secondary: Image.asset("images/number/dice6.png"),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.black,
                        value: describeEnum(DiceImgPath.number),
                        groupValue: SettingBean.diceImgPath,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceImgPath = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setDiceImgKanji".tr()),
                        secondary: Image.asset("images/kanji/dice6.png"),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.black,
                        value: describeEnum(DiceImgPath.kanji),
                        groupValue: SettingBean.diceImgPath,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceImgPath = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setDiceImgRome".tr()),
                        secondary: Image.asset("images/rome/dice6.png"),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.black,
                        value: describeEnum(DiceImgPath.rome),
                        groupValue: SettingBean.diceImgPath,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceImgPath = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                  ],
                ),
                ExpansionTile(
                  key: diceColorKey,
                  onExpansionChanged: (value) {
                    if (value) {
                      _moveToSelectedWidget(diceColorKey);
                    }
                  },
                  title: Text("setSelectedColorTitle".tr()),
                  children: [
                    RadioListTile(
                        title: Text("setSelectedColorBlue".tr(),
                            style: TextStyle(color: Colors.blue)),
                        activeColor: Colors.blue,
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(DiceColor.blue),
                        groupValue: SettingBean.diceColor,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceColor = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setSelectedColorRed".tr(),
                            style: TextStyle(color: Colors.red)),
                        activeColor: Colors.red,
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(DiceColor.red),
                        groupValue: SettingBean.diceColor,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceColor = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setSelectedColorAmber".tr(),
                            style: TextStyle(color: Colors.amber)),
                        activeColor: Colors.amber,
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(DiceColor.amber),
                        groupValue: SettingBean.diceColor,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceColor = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                    RadioListTile(
                        title: Text("setSelectedColorGreen".tr(),
                            style: TextStyle(color: Colors.green)),
                        activeColor: Colors.green,
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: describeEnum(DiceColor.green),
                        groupValue: SettingBean.diceColor,
                        onChanged: (value) {
                          setState(() {
                            SettingBean.diceColor = value.toString();
                            widget.setSettingBeanToXml();
                          });
                        }),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListTile(
                          title: Text("setBgColorTitle".tr()),
                        ),
                      ),
                      LiteRollingSwitch(
                        //initial value
                        value: SettingBean.bgColorSet,
                        textOn: 'Light',
                        textOff: 'Dark',
                        colorOn: Colors.grey,
                        colorOff: Colors.black,
                        iconOn: Icons.wb_sunny_rounded,
                        iconOff: Icons.wb_cloudy_sharp,
                        textSize: 16.0,
                        onChanged: (bool state) {
                          SettingBean.bgColorSet = state;
                          widget.setBgColorToXml();
                        }, onDoubleTap: (){}, onTap: (){}, onSwipe: (){},
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text("setVersionTitle".tr() + Util.version),
                  onTap: () {
                    easterEggCount++;
                    if (easterEggCount > 7) {
                      easterEggCount = 0;
                      return unawaited(showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("easterTitle".tr()),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        'images/easterEgg/easterEgg.png'),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("easterBtn".tr()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            }));
                      }
                    }
                  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
