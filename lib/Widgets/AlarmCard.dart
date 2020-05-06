import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_alarms/Config/Colors.dart';
import 'package:quick_alarms/Config/Constants.dart';

class AlarmCard extends StatefulWidget {
  final bool active;
  final bool snoozed;
  final description;
  final Function onLongPress;
  final time;
  AlarmCard({
    this.active = true,
    this.snoozed = false,
    this.onLongPress,
    this.time,
    this.description = "You haven't added a description yet. Tap to Edit.",
  });

  @override
  _AlarmCardState createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        color: widget.snoozed ? kDirtyPurple : kCardColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: InkWell(
          onTap: () {},
          onLongPress: widget.onLongPress,
          child: Container(
            padding: EdgeInsets.all(8.0),
            // color: widget.snoozed ? kDirtyPurple : kCardColor,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: widget.active
                      ? widget.snoozed ? kSuspendedColor : kPlainTeal
                      : kSurfacePaleRed,
                  width: 8.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${todayDate(DateTime.parse(widget.time))}",
                    // widget.time,
                    style: sublineText.copyWith(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${widget.description}",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "State: ${widget.active ? widget.snoozed ? "Snoozed" : "Active" : "User Cancelled"}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  todayDate(time) {
    var now = time;
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedTime = DateFormat('h:mm a').format(now);
    String formattedDate = formatter.format(now);
    return "$formattedTime\n$formattedDate";
  }
}
