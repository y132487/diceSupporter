import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ReRollBtn extends StatefulWidget {
  final Function reRollToResult;
  ReRollBtn(this.reRollToResult);
  @override
  _ReRollBtnState createState() => _ReRollBtnState();
}

class _ReRollBtnState extends State<ReRollBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text("btnReRoll".tr()),
        ),
        decoration: BoxDecoration(border: Border.all()),
      ),
      onTap: () {
        setState(() {
          widget.reRollToResult();
        });
      },
    );
  }
}
