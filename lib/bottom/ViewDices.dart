import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewDices extends StatefulWidget {
  bool rolled = false;

  ViewDices(this.rolled);
  @override
  _ViewDicesState createState() => _ViewDicesState();
}

class _ViewDicesState extends State<ViewDices> {
  @override
  Widget build(BuildContext context) {
    return !widget.rolled
        ? Container(
            child: Text("noResult".tr()),
          )
        : GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 6,
          );
  }
}
