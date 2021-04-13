import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DiceMain.dart';

SharedPreferences prefs;

void main() async {
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
        Locale('ja', 'JP')
      ],
      path: 'assets',
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      child: MyApp()));
  SystemChrome.setEnabledSystemUIOverlays([]);
  prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceMain(title: "main"),
    );
  }
}