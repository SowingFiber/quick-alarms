import 'package:flutter/material.dart';
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class TextInputGroup extends StatefulWidget {
  final String title;
  final String exampleString;

  const TextInputGroup({
    Key key,
    this.title = "Title",
    this.exampleString = "e.g. This is an example",
  }) : super(key: key);
  @override
  _TextInputGroupState createState() => _TextInputGroupState();
}

class _TextInputGroupState extends State<TextInputGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.title,
              style: sublineText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              style: sublineText,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.exampleString,
                  hintStyle: sublineThinText),
              controller: TextEditingController(),
              focusNode: FocusNode(canRequestFocus: true),
              cursorColor: kLight,
            ),
          )
        ],
      ),
    );
  }
}
