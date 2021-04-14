import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:flutter/material.dart';

class DiceBeanView extends StatefulWidget {
  final DiceBean diceBean;
  DiceBeanView(this.diceBean);
  @override
  _DiceBeanState createState() => _DiceBeanState();
}

class _DiceBeanState extends State<DiceBeanView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(widget.diceBean.diceImgPath),
    );
  }
}
