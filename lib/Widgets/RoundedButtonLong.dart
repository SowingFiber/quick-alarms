import 'package:flutter/material.dart';
import 'package:quick_alarms/Config/Colors.dart';

class RoundedButtonLong extends StatefulWidget {
  final IconData icon;
  final String buttonName;
  final Color buttonColor;
  final double sizeFactor;
  final Function onTap;
  const RoundedButtonLong({
    Key key,
    this.icon = Icons.add,
    this.buttonName = "Button",
    this.buttonColor = kSecondaryColor,
    this.sizeFactor = 1.0,
    this.onTap,
  }) : super(key: key);
  @override
  _RoundedButtonLongState createState() => _RoundedButtonLongState();
}

class _RoundedButtonLongState extends State<RoundedButtonLong> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(8.0 * widget.sizeFactor),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    widget.icon,
                    size: 16.0 * widget.sizeFactor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    widget.buttonName,
                    style: TextStyle(fontSize: 16.0 * widget.sizeFactor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
