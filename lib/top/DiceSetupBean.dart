import 'package:dices_supporter/bean/SettingBean.dart';
import 'package:flutter/material.dart';

class DiceSetupBean extends StatefulWidget {
  final int number;
  final int resultNum;
  DiceSetupBean(this.number, this.resultNum);

  @override
  _DiceSetupBeanState createState() => _DiceSetupBeanState();
}

class _DiceSetupBeanState extends State<DiceSetupBean> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: Row(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/${SettingBean.diceImgPath}/dice${widget.number}.png',
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? constraints.maxHeight / 3
                        : constraints.maxHeight / 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 2, right: 5),
              child: Text(
                widget.resultNum.toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? constraints.maxHeight / 4
                        : constraints.maxHeight / 2,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
