import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:flutter/material.dart';

class DiceBeanView extends StatefulWidget {
  Function passDiceIdNumber;
  final DiceBean diceBean;
  DiceBeanView(this.diceBean, this.passDiceIdNumber);
  @override
  _DiceBeanState createState() => _DiceBeanState();
}

class _DiceBeanState extends State<DiceBeanView> {
  @override
  Widget build(BuildContext context) {
    return widget.diceBean.diceSelected
        ? InkWell(
            child: Container(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(SettingBean.realDiceColor, BlendMode.lighten),
                child: Image.asset(
                  'images/${SettingBean.diceImgPath}/dice${widget.diceBean.diceNum}.png',
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.passDiceIdNumber(widget.diceBean.idNum);
              });
            },
          )
        : InkWell(
            child: Container(
              child: Image.asset('images/${SettingBean.diceImgPath}/dice${widget.diceBean.diceNum}.png'),
            ),
            onTap: () {
              setState(() {
                widget.passDiceIdNumber(widget.diceBean.idNum);
              });
            },
          );
  }
}
