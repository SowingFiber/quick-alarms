import 'package:flutter/material.dart';
import 'package:quick_alarms/_dashboard/components/widgets/test_widget.dart';
import 'package:quick_alarms/_dashboard/screens/home_components/home_tab_list.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMatteColor,
          elevation: 0.0,
          title: Center(child: Text('Quick Alarms')),
          bottom: TabBar(
            tabs: HOMETABSLIST,
          ),
        ),
        //TODO: I'll add the toobar with pages here
        //TODO: There are three, [Daily], [Special] & [Overview]
        body: TabBarView(
          children: <Widget>[Test(), Test(), Test()],
        ),
      ),
    );
  }
}
