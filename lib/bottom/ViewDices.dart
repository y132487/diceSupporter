import 'package:dices_supporter/bean/DiceBean.dart';
import 'package:dices_supporter/bottom/DiceBeanView.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewDices extends StatefulWidget {
  Function updateSelectedDice;

  bool rolled = false;
  var diceBeanList = <DiceBean>[];

  ViewDices(this.rolled, this.diceBeanList, this.updateSelectedDice);
  @override
  _ViewDicesState createState() => _ViewDicesState();
}

class _ViewDicesState extends State<ViewDices> {
  @override
  void initState() {
    super.initState();
  }

  void passDiceIdNumber(int idNum) {
    widget.updateSelectedDice(idNum);
  }

  @override
  Widget build(BuildContext context) {
    var gridList = <DiceBeanView>[];

    if (widget.diceBeanList.isNotEmpty) {
      for (int i = 0; i < widget.diceBeanList.length; i++) {
        gridList.add(DiceBeanView(widget.diceBeanList[i], passDiceIdNumber));
      }
    }

    return !widget.rolled
        ? Container(
            child: Text("noResult".tr()),
          )
        : GridView.count(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 5
                    : 10,
            padding: const EdgeInsets.all(4),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: gridList,
          );
  }
}
