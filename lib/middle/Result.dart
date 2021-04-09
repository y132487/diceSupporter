import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int result;
  Result(this.result);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Center(
          child: Text(
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
