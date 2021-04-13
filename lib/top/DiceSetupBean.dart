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
                'images/dice${widget.number}.png',
                //width: MediaQuery.of(context).size.width / 20,
                //height: MediaQuery.of(context).size.height / 20,
                height: constraints.maxHeight / 3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 2, right: 5),
              child: Text(
                widget.resultNum.toString(),
                style: TextStyle(
                    fontSize: constraints.maxHeight / 4,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
