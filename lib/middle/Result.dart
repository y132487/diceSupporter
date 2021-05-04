import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int result;
  bool rolled = false;

  Result(this.result, this.rolled);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String getResultText(bool rolled) {
    if (rolled) {
      return widget.result.toString();
    }
    return "0";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Center(
          child: Text(
            getResultText(widget.rolled),
            style: TextStyle(
                fontSize: constraints.maxHeight / 1.5,
                fontWeight: FontWeight.bold,
                color: SettingBean.fontColor),
          ),
        ),
      ),
    );
  }
}
