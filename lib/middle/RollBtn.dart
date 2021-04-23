import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RollBtn extends StatefulWidget {
  final Function setRolled;
  final Function rollToResult;
  RollBtn(this.setRolled, this.rollToResult);
  @override
  _RollBtnState createState() => _RollBtnState();
}

class _RollBtnState extends State<RollBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text("btnRoll".tr()),
        ),
        decoration: BoxDecoration(border: Border.all()),
      ),
      onTap: () {
        setState(() {
          widget.setRolled(true);
          widget.rollToResult();
        });
      },
    );
  }
}
