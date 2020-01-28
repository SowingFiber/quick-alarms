import 'package:flutter/material.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';

class AlarmCard extends StatefulWidget {
  final bool active;
  final bool snoozed;

  const AlarmCard({Key key, this.active = true, this.snoozed = false})
      : super(key: key);
  @override
  _AlarmCardState createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Time'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('10:32 : PM'),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('State'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.active
                        ? widget.snoozed ? 'Snoozed' : 'Active'
                        : 'Inactive'),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ETA'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('10:59'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
