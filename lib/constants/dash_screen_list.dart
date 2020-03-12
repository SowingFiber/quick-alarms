import 'package:flutter/material.dart';
import 'package:quick_alarms/Screens/Graph/Graph.dart';
import 'package:quick_alarms/_dashboard/components/widgets/test_widget.dart';
import 'package:quick_alarms/_dashboard/screens/home.dart';
import 'package:quick_alarms/constants/text_styles.dart';

var bottomBarItems = <BottomNavigationBarItem>[
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

var dashBoardScreen = <Widget>[
  Home(),
  Graph(),
  Test(),
  Test(),
];
