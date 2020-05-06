import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:quick_alarms/Config/Colors.dart';
import 'package:quick_alarms/Config/Constants.dart';
import 'package:quick_alarms/Models/QuickAlarm.dart';
import 'package:quick_alarms/Services/DatabaseHelper.dart';
import 'package:quick_alarms/Widgets/AlarmCard.dart';
import 'package:quick_alarms/Widgets/RoundedButtonLong.dart';

class DailyTab extends StatefulWidget {
  @override
  _DailyTabState createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  var alarmList = List();
  static DatabaseHelper _databaseHelper = DatabaseHelper();
  var _c = new TextEditingController();

  String _alarmTime = "Set alarm time";

  @override
  void initState() {
    fetch().then((alarms) {
      alarmList = alarms;
      print("Alarms loaded!");
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          RoundedButtonLong(
            buttonColor: kSurfacePaleRed,
            buttonName: "Add Alarm",
            icon: Icons.access_alarms,
            onTap: () async {
              showDialog(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "New Alarm",
                            style: sublineText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: _c,
                            style: sublineThinText,
                            decoration: new InputDecoration(
                              filled: true,
                              hintText: "Alarm name",
                              hintStyle: sublineThinText,
                              fillColor: kInputColor,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Please enter a descriptive name!";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: FlatButton(
                            color: kSecondaryColor,
                            child: Text("Set Alarm Time"),
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2100, 12, 30),
                                  onChanged: (date) {
                                _alarmTime = date.toString();
                                setState(() {});
                              }, onConfirm: (date) {
                                _alarmTime = date.toString();
                                setState(() {});
                              },
                                  theme: DatePickerTheme(
                                    backgroundColor: kMatteColor,
                                    itemStyle: sublineText,
                                    cancelStyle:
                                        TextStyle(color: Colors.redAccent),
                                    doneStyle:
                                        TextStyle(color: Colors.greenAccent),
                                  ),
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: kSurfacePaleRed,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.check),
                              )),
                          onTap: () async {
                            await create("${_c.text}", "$_alarmTime");
                            alarmList = await fetch();
                            _c.clear();
                            _c.text = "";
                            setState(() {
                              _alarmTime = "Set alarm time";
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                  context: context);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView(
              children: getAlarms(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getAlarms() {
    var list = List<Widget>();
    if (alarmList != null) {
      for (int i = 0; i < alarmList.length; i++) {
        var name = alarmList[i].name;
        var time = alarmList[i].time;
        var id = alarmList[i].id;
        list.add(
          AlarmCard(
            description: name,
            time: time,
            onLongPress: () async {
              await deleteItem(id);
              alarmList = await fetch();
              setState(() {});
            },
          ),
        );
      }
      return list;
    }
    list.add(Text("Zero"));
    return list;
  }

  Future<int> create(String name, String time) async {
    final alarm = new QuickAlarm(name: name, time: time);
    //databaseHelper has been injected in the class
    int id = await _databaseHelper.db
        .insert(QUICK_ALARM_TABLE, alarm.toMapWithoutId());
    return id;
  }

  Future<List<QuickAlarm>> fetch() async {
    //databaseHelper has been injected in the class
    var fetchedList = List<QuickAlarm>();
    List<Map> list =
        await _databaseHelper.db.rawQuery("Select * from $QUICK_ALARM_TABLE");
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        fetchedList.add(QuickAlarm.fromMap(list[i]));
      }
      return fetchedList;
    }
    return null;
  }

  Future<int> deleteItem(int id) async {
    return await _databaseHelper.db
        .delete(QUICK_ALARM_TABLE, where: "id = ?", whereArgs: [id]);
  }
}
