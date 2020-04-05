import 'dart:math';

import 'package:floating_action_row/floating_action_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_alarms/Models/DailyAlarm.dart';
import 'package:quick_alarms/NewAlarm/NewAlarm.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class DailyAlarmPage extends StatefulWidget {
  @override
  _DailyAlarmPageState createState() => _DailyAlarmPageState();
}

class _DailyAlarmPageState extends State<DailyAlarmPage>
    with AutomaticKeepAliveClientMixin {
  DailyAlarm alarm;

  @override
  void initState() {
    setState(() {
      selectalarm();
    });
    super.initState();
  }

  selectalarm() async {
    var alarms = await get();
    if (alarms.isNotEmpty) {
      alarm = alarms[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: alarm == null ? noalarmlayout() : defaultLayout(),
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
            onTap: () async {
              await deletealarm(alarm);
              await selectalarm();
              setState(() {});
            },
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

  @override
  bool get wantKeepAlive => true;

  noalarmlayout() {
    setState(() {});
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "No Alarms yet!",
                style: headlineText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Start by adding a new alarm",
                style: sublineThinText,
              ),
            ),
            Container(
              width: 200,
              child: RoundedButtonLong(
                icon: Icons.add,
                buttonName: "Add new alarm",
                buttonColor: kSurfacePaleRed,
                onTap: () {
                  addNewDailyAlarm();
                },
                sizeFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  defaultLayout() {
    setState(() {});
    return ListView(
      padding: EdgeInsets.only(bottom: 84.0),
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${randomizeGreeting()}!',
              style: headlineThinText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            '${alarm.name}',
            style: sublineThinText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${alarm.description}',
            style: sublineThinText,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        addDetails("Alarm Time", "${alarm.startTime}"),
        addDetails("Days", "${alarm.repeatMode}"),
        addDetails("Intervals", "${alarm.intervalInMinutes}"),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: createCards(alarm),
          ),
        ),
      ],
    );
  }
}

deletealarm(DailyAlarm alarm) async {
  await delete(alarm);
}

createCards(DailyAlarm alarm) {
  var list = <Widget>[];
  var startTime = alarm.startTime;
  var endTime = alarm.endTime;
  var interval = alarm.intervalInMinutes;
  list.add(Text("Hello"));
  return list;
}

randomizeGreeting() {
  var greetings = ['Hello', 'Howdy', 'Hola', 'Good Day'];
  var rand = Random();
  var rNum = rand.nextInt(3);
  return greetings[rNum];
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
