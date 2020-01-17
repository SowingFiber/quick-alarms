import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_alarms/_dashboard/components/widgets/test_widget.dart';
import 'package:quick_alarms/_dashboard/screens/home.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

var BOTTOMBARITEMS = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home',
        style: bottomNavigation
      ),
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.pie_chart),
      title: Text('Graph',
          style: bottomNavigation
      )
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile',
          style: bottomNavigation
      )
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('Settings',
          style: bottomNavigation
      )
  )
];

var DASHBOARDSCREEN = <Widget>[
  Home(),
  Test(),
  Test(),
  Test(),
];
