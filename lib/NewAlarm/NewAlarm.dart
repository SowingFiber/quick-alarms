import 'package:flutter/material.dart';
import 'package:quick_alarms/NewAlarm/components/TextInputGroup.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class NewAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMatteColor,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add new Alarm',
                    style: headlineThinText,
                  ),
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString: 'e.g. Yoga Appointment with Sheila',
                  title: 'Alarm Name',
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString:
                      'e.g. I really need to keep up with yoga classes',
                  title: 'Alarm Description',
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString: 'e.g. 6:00 A.M.',
                  title: 'Start Time',
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString: 'e.g. 5 minutes',
                  title: 'Intervals',
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString: 'e.g. 15',
                  title: 'Number of Alarms',
                ),
                TextInputGroup(
                  //TODO: Create a set of examples and randomly pick one
                  exampleString: 'e.g. Daily, Monday - Friday, etc.',
                  title: 'Repeat',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonBar(
              children: <Widget>[
                RoundedButtonLong(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.add,
                  buttonColor: kSecondaryColor,
                  buttonName: 'Add new alarm',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
