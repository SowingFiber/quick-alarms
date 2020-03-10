import 'package:flutter/material.dart';
import 'package:quick_alarms/NewAlarm/NewAlarm.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMatteColor,
          elevation: 0.0,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Text('Quick Alarm'),
              ),
              RoundedButtonLong(
                buttonName: 'Add',
                buttonColor: kSecondaryColor,
                icon: Icons.add,
                sizeFactor: 0.8,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewAlarm()));
                },
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: kSecondaryColor,
            tabs: HOMETABSLIST,
          ),
        ),
        //There are three, [Daily], [Special] & [Overview]
        body: TabBarView(
          children: <Widget>[DailyAlarm(), Special(), Overview()],
        ),
      ),
    );
  }
}
