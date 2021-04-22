import 'package:flutter/material.dart';

class SettingBtn extends StatefulWidget {
  @override
  _SettingBtnState createState() => _SettingBtnState();
}

class _SettingBtnState extends State<SettingBtn> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: IconButton(
          icon: Icon(Icons.settings),
          iconSize: constraints.maxHeight / 2,
          onPressed: () {},
        ),
      ),
    );
  }
}
