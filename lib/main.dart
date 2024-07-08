import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DiceMain.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
        Locale('ja', 'JP')
      ],
      path: 'assets',
      //fallbackLocale: Locale('en', 'US'),
      //startLocale: Locale('en', 'US'),
      child: MyApp()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'DiceSupporter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceMain(title: "SupporterMain"),
    );
  }
}
