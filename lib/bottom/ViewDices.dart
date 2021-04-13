import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewDices extends StatefulWidget {
  bool rolled = false;
  var diceBeanList=<DiceBean>[];

  ViewDices(this.rolled, this.diceBeanList);
  @override
  _ViewDicesState createState() => _ViewDicesState();
}

class _ViewDicesState extends State<ViewDices> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.rolled
        ? Container(
            child: Text("noResult".tr()),
          )
        : GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 5,
          );
  }
}
