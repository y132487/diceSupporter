import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:dices_supporter/enum/Enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingMain extends StatefulWidget {
  Function setSettingBeanToXml;

  SettingMain(this.setSettingBeanToXml);

  @override
  _SettingMainState createState() => _SettingMainState();
}

class _SettingMainState extends State<SettingMain> {
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
                            SettingBean.lang = value;
                            widget.setSettingBeanToXml();
                            context.locale = Locale('en', 'US');
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
                            SettingBean.lang = value;
                            widget.setSettingBeanToXml();
                            context.locale = Locale('ja', 'JP');
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
                            SettingBean.lang = value;
                            widget.setSettingBeanToXml();
                            context.locale = Locale('ko', 'KR');
                          });
                        }),
                  ],
                ),
                ExpansionTile(
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
                            SettingBean.diceImgPath = value;
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
                            SettingBean.diceImgPath = value;
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
                            SettingBean.diceImgPath = value;
                            widget.setSettingBeanToXml();
                          });
                        }),
                  ],
                ),
                ExpansionTile(
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
                            SettingBean.diceColor = value;
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
                            SettingBean.diceColor = value;
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
                            SettingBean.diceColor = value;
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
                            SettingBean.diceColor = value;
                            widget.setSettingBeanToXml();
                          });
                        }),
                  ],
                ),
                ListTile(
                  title: Text("setDeveloperTitle".tr()),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("setVersionTitle".tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
