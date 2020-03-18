import 'package:floating_action_row/floating_action_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_alarms/NewAlarm/NewAlarm.dart';
import 'package:quick_alarms/_dashboard/components/widgets/AlarmCard.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class DailyAlarmPage extends StatefulWidget {
  @override
  _DailyAlarmPageState createState() => _DailyAlarmPageState();
}

class _DailyAlarmPageState extends State<DailyAlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 84.0),
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Rise & Shine!',
                style: headlineThinText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Need to catch the flight for Bangalore',
              style: sublineThinText,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          addDetails("Repeat", "Monday - Friday"),
          addDetails("End Time", "10:30 P.M. Today"),
          addDetails("Intervals", "00 : 05 : 00"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                AlarmCard(
                  active: false,
                ),
                AlarmCard(),
                AlarmCard(
                  active: false,
                ),
                AlarmCard(
                  snoozed: true,
                ),
                AlarmCard(
                  snoozed: true,
                  active: true,
                ),
                AlarmCard(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionRow(
        height: 56,
        color: kSecondaryDarkColor,
        children: <Widget>[
          FloatingActionRowButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: kLight,
            ),
            onTap: () {},
          ),
//          FloatingActionRowDivider(
//            color: Colors.white,
//          ),
          FloatingActionRowButton(
            icon: Icon(
              Icons.edit,
              size: 20,
              color: kLight,
            ),
            onTap: () {},
          ),
          FloatingActionRowButton(
            icon: Icon(
              Icons.add,
              size: 24,
              color: kLight,
            ),
            onTap: () {
              addNewDailyAlarm();
            },
          ),
          FloatingActionRowButton(
            icon: Icon(
              Icons.close,
              size: 24,
              color: kLight,
            ),
            onTap: () {},
          ),
//          FloatingActionRowDivider(
//            color: Colors.white,
//          ),
          FloatingActionRowButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kLight,
            ),
            onTap: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void addNewDailyAlarm() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NewAlarm()));
  }
}

addDetails(title, detail) {
  return (Container(
    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            '$title',
            style: sublineText,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '  :  ',
            style: sublineText,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '$detail',
            style: sublineThinText,
          ),
        ),
      ],
    ),
  ));
}
