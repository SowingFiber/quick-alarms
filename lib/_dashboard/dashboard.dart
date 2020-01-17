import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/dash_screen_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DASHBOARDSCREEN[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        backgroundColor: kMatteColor,
        currentIndex: selectedScreen,
        items: BOTTOMBARITEMS,
        onTap:(value){
          setState(() {
            selectedScreen = value;
          });
        },
      ),
    );
  }
}
