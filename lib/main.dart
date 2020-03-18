import 'package:flutter/material.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';

import '_dashboard/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: kAccentColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kSecondaryColor,
          ),
          scaffoldBackgroundColor: kMatteColor,
          backgroundColor: kMatteColor,
          textSelectionColor: kPlainTeal),
      home: Home(),
    );
  }
}
