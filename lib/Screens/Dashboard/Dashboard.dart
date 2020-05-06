import 'package:flutter/material.dart';
import 'package:quick_alarms/Config/Constants.dart';
import 'package:quick_alarms/Screens/Dashboard/Tabs/DailyAlarm.dart';
import 'package:quick_alarms/Widgets/test_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(globalAppName),
          bottom: TabBar(
            tabs: HOMETABSLIST,
          ),
        ),
        //There are three, [Daily], [Special] & [Overview]
        body: TabBarView(
          children: <Widget>[DailyTab(), Test(), Test()],
        ),
      ),
    );
  }
}
