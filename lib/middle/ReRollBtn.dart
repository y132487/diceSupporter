import 'package:flutter/material.dart';

class ReRollBtn extends StatefulWidget {
  @override
  _ReRollBtnState createState() => _ReRollBtnState();
}

class _ReRollBtnState extends State<ReRollBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text("REROLL"),
        ),
        decoration: BoxDecoration(border: Border.all()),
      ),
      onTap: () {},
    );
  }
}
