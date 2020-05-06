import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'Colors.dart';

///
///Constant Strings
///

const String APP_DATABASE = "quickalarms.db";
const String DAILY_TABLE = "daily";
const String SPECIAL_TABLE = "special";
const String QUICK_ALARM_TABLE = "quickalarm";

///
///Text Styles
///

const headlineText = TextStyle(
  color: kLight,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
);

const sublineText = TextStyle(
  color: kLight,
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
);

const headlineThinText = TextStyle(
  color: kLight,
  fontSize: 40.0,
  fontWeight: FontWeight.w300,
);

const sublineThinText = TextStyle(
  color: kLight,
  fontSize: 16.0,
  fontWeight: FontWeight.w200,
);

//App vars
const globalAppName = "Quick Alarm";

//Theme consts
const kDatePickerTheme = DatePickerTheme(
  cancelStyle: TextStyle(
    color: kSurfacePaleRed,
  ),
  doneStyle: TextStyle(
    color: kPlainTeal,
  ),
  backgroundColor: kMatteColor,
  itemStyle: TextStyle(
    color: kLight,
  ),
);

///
///HOME Tabs List
///

const HOMETABSLIST = <Widget>[
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text('Daily'),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text('Special'),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text('Overview'),
  ),
];
