import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        calendarController: _calendarController,
        onDaySelected: (day, events) {
          print(day);
          print(events.toString());
        });
  }
}
