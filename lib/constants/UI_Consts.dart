import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

const kPrimaryColor = Color(0xff2b3595);
const kPrimaryDarkColor = Color(0xff182952);
const kPrimaryDarkBlueColor = Color(0xff35495e);
const kSecondaryColor = Color(0xffbe8abf);
const kSecondaryDarkColor = Color(0xff7045af);
const kAccentColor = Color(0xffe14594);
const kMatteColor = Color(0xff303030);
const kCardColor = Color(0xff454545);
const kSuspendedColor = Color(0xff888888);
const kSurfaceFont = Color(0xff232323);
const kSurfacePaleRed = Color(0xffd45d79);
const kDirtyPurple = Color(0xff6e5773);
const kPlainTeal = Color(0xff96d1c7);
const kPaleOrange = Color(0xffea9085);
const kLight = Color(0xfffefefe);

//App vars
const globalAppName = "Quick Alarms";

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
