import 'package:flutter/material.dart';
import 'package:quick_alarms/_dashboard/components/widgets/AlarmCard.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class Special extends StatefulWidget {
  @override
  _SpecialState createState() => _SpecialState();
}

class _SpecialState extends State<Special> {
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
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'Alarm Description: ',
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Need to catch the flight for Bangalore',
                    style: sublineThinText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.0, bottom: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Repeat:  ',
                  style: sublineText,
                ),
                Text(
                  ' None',
                  style: sublineThinText,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.0, bottom: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Alarms',
              style: sublineText,
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
