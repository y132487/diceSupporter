import 'dart:ui';

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
          child: Text("btnReRoll".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        decoration: BoxDecoration(
            color: Colors.grey[100],
          borderRadius: BorderRadius.all( Radius.circular(40), ),
          boxShadow: [
            BoxShadow( color: Colors.grey[500]!, offset: Offset(0.5, 0.5), blurRadius: 2.0, spreadRadius: 1.0, ),
            BoxShadow( color: Colors.white, offset: Offset(-0.5, -0.5), blurRadius: 2.0, spreadRadius: 1.0, ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          widget.reRollToResult();
        });
      },
    );
  }
}
