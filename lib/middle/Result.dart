import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Result extends StatefulWidget {
  final int result;
  bool rolled = false;
  Result(this.result, this.rolled);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Center(
          child: !widget.rolled
              ? Text("result".tr())
              : Text(
                  "${widget.result}",
                  style: TextStyle(
                      fontSize: constraints.maxHeight / 1.5,
                      fontWeight: FontWeight.bold),
                ),
        ),
        decoration: BoxDecoration(border: Border.all()),
      ),
    );
  }
}
