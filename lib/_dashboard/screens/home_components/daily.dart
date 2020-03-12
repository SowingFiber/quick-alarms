import 'package:flutter/material.dart';
import 'package:quick_alarms/_dashboard/components/widgets/AlarmCard.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class DailyAlarm extends StatefulWidget {
  @override
  _DailyAlarmState createState() => _DailyAlarmState();
}

class _DailyAlarmState extends State<DailyAlarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rise & Shine!',
              style: headlineThinText,
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
          Container(
            color: kAccentColor,
            margin: EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Alarms',
              style: sublineThinText.copyWith(
                fontSize: 24,
              ),
            ),
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
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              RoundedButtonLong(
                icon: Icons.close,
                buttonColor: kSurfacePaleRed,
                buttonName: 'Dismiss',
              ),
              RoundedButtonLong(
                icon: Icons.edit,
                buttonColor: kDirtyPurple,
                buttonName: 'Edit',
              ),
            ],
          )
        ],
      ),
    );
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
