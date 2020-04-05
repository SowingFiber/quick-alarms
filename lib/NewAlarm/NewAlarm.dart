import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:quick_alarms/Models/DailyAlarm.dart';
import 'package:quick_alarms/Models/RepeatMode.dart';
import 'package:quick_alarms/_dashboard/components/widgets/RoundedButtonLong.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class NewAlarm extends StatefulWidget {
  @override
  _NewAlarmState createState() => _NewAlarmState();
}

class _NewAlarmState extends State<NewAlarm> {
  final alarmName = TextEditingController();
  final alarmDesc = TextEditingController();
  String _startTime = null;
  String _endTime = null;
  String _interval = null;
  String dropDownValue = "One";
  RepeatMode repeatMode = RepeatMode.All_Week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMatteColor,
        elevation: 0.0,
        title: Text("New Daily Alarm"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 32.0,
                          right: 8.0,
                          bottom: 0,
                        ),
                        child: Text(
                          "Alarm Name",
                          style: sublineText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          style: sublineText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: exampleTitle(),
                              hintStyle: sublineThinText),
                          controller: alarmName,
                          focusNode: FocusNode(canRequestFocus: true),
                          cursorColor: kLight,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 32.0,
                          right: 8.0,
                          bottom: 0,
                        ),
                        child: Text(
                          "Alarm Description",
                          style: sublineText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          style: sublineText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: exampleString(),
                              hintStyle: sublineThinText),
                          controller: alarmDesc,
                          focusNode: FocusNode(canRequestFocus: true),
                          cursorColor: kLight,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    right: 8.0,
                    bottom: 16.0,
                  ),
                  child: Text(
                    "Choose the timeFrame",
                    style: sublineText,
                  ),
                ),
                Row(
                  children: <Widget>[
                    RoundedButtonLong(
                      onTap: () {
                        DatePicker.showTime12hPicker(
                          context,
                          theme: kDatePickerTheme,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              _startTime =
                                  formatDate(date, [hh, ':', nn, ' ', am])
                                      .toString();
                            });
                          },
                          currentTime: DateTime.now(),
                        );
                      },
                      buttonColor: kPaleOrange,
                      buttonName: _startTime != null
                          ? _startTime.toString()
                          : "Start Time",
                      icon: Icons.access_time,
                    ),
                    RoundedButtonLong(
                      onTap: () {
                        DatePicker.showTime12hPicker(
                          context,
                          theme: kDatePickerTheme,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                            printSomeAlarms();
                            setState(() {
                              _endTime =
                                  formatDate(date, [hh, ':', nn, ' ', am])
                                      .toString();
                            });
                          },
                          currentTime: DateTime.now(),
                        );
                      },
                      buttonColor: kDirtyPurple,
                      buttonName:
                          _endTime != null ? _endTime.toString() : "End Time",
                      icon: Icons.timer,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    right: 8.0,
                    bottom: 16,
                  ),
                  child: Text(
                    "Choose Interval",
                    style: sublineText,
                  ),
                ),
                Row(
                  children: <Widget>[
                    RoundedButtonLong(
                      onTap: () {
                        DatePicker.showTimePicker(
                          context,
                          currentTime: DateTime.utc(0, 0, 0, 0, 0, 0, 0, 0),
                          theme: kDatePickerTheme,
                          showSecondsColumn: false,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                            printSomeAlarms();
                            setState(() {
                              _interval = formatDate(date, [
                                hh,
                                ':',
                                nn,
                              ]).toString();
                            });
                          },
                        );
                      },
                      buttonColor: kDirtyPurple,
                      buttonName: _interval != null
                          ? _interval.toString() + " mins"
                          : "Intervals",
                      icon: Icons.directions_run,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    right: 8.0,
                    bottom: 16.0,
                  ),
                  child: Text(
                    "Repeating Schedule",
                    style: sublineText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<RepeatMode>(
                      value: repeatMode,
                      hint: Text("Select repeat"),
                      focusColor: Colors.yellowAccent,
                      items: RepeatMode.values
                          .map<DropdownMenuItem<RepeatMode>>(
                              (RepeatMode value) {
                        return DropdownMenuItem<RepeatMode>(
                          value: value,
                          child: Text(value
                              .toString()
                              .replaceAll("RepeatMode.", "")
                              .replaceAll("_", " ")),
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          repeatMode = value;
                        });
                      }),
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
                    var alarm = new DailyAlarm(
                      name: alarmName.text,
                      description: alarmDesc.text,
                      startTime: _startTime,
                      endTime: _endTime,
                      intervalInMinutes: _interval,
                      repeatMode: repeatMode.toString(),
                    );
                    try {
                      addNewAlarm(alarm);
                    } catch (exception) {
                      print(exception);
                    }
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

  void addNewAlarm(DailyAlarm alarm) async {
    await newAlarm(alarm);
    Navigator.pop(context);
//    var alarms = await get();
//    for (var alarm in alarms) {
//      print(alarm.name);
//    }
  }

  void printSomeAlarms() {
    print(formatDate(DateTime.now(), [hh, ':', nn, ' ', am]));
  }
}

String exampleTitle() {
  return "Therapist Appointment";
}

exampleString() {
  return "Fix an appointment with Daniel";
}
