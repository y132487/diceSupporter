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
          child: Text("btnRoll".tr(),style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all( Radius.circular(40), ),
          boxShadow: [
            BoxShadow( color: Colors.grey[500], offset: Offset(0.5, 0.5), blurRadius: 2.0, spreadRadius: 1.0, ),
            BoxShadow( color: Colors.white, offset: Offset(-0.5, -0.5), blurRadius: 2.0, spreadRadius: 1.0, ),
          ],
        ),
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
