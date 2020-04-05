import 'package:flutter/material.dart';
import 'package:quick_alarms/_dashboard/screens/home_components/daily.dart';
import 'package:quick_alarms/_dashboard/screens/home_components/home_tab_list.dart';
import 'package:quick_alarms/_dashboard/screens/home_components/overview.dart';
import 'package:quick_alarms/_dashboard/screens/home_components/special.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMatteColor,
          elevation: 0.0,
          title: Text(globalAppName),
          bottom: TabBar(
            indicatorColor: kSecondaryColor,
            tabs: HOMETABSLIST,
          ),
        ),
        //There are three, [Daily], [Special] & [Overview]
        body: TabBarView(
          children: <Widget>[DailyAlarmPage(), Special(), Overview()],
        ),
      ),
    );
  }
}
