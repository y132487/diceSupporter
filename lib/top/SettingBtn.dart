import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:dices_supporter/setting/SettingMain.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class SettingBtn extends StatefulWidget {
  Function updateSettingBean;
  Function updateBgColorSetBean;

  SettingBtn(this.updateSettingBean, this.updateBgColorSetBean);

  @override
  _SettingBtnState createState() => _SettingBtnState();
}

class _SettingBtnState extends State<SettingBtn> {
  void setSettingBeanToXml() {
    prefs.setString('diceImgPath', SettingBean.diceImgPath);
    prefs.setString('diceColor', SettingBean.diceColor);
    widget.updateSettingBean();
  }

  void setBgColorToXml() {
    prefs.setBool('bgColorSet', SettingBean.bgColorSet);
    widget.updateBgColorSetBean();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: IconButton(
          icon: Icon(Icons.settings),
          iconSize: constraints.maxHeight / 2,
          color: SettingBean.fontColor,
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: SettingMain(setSettingBeanToXml, setBgColorToXml),
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 100),
                reverseDuration: Duration(milliseconds: 100),
              ),
            );
          },
        ),
      ),
    );
  }
}
