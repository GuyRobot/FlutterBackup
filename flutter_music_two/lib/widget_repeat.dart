import 'package:flutter/material.dart';

class WidgetRepeat extends StatefulWidget {
  @override
  _WidgetRepeatState createState() => _WidgetRepeatState();
}

class _WidgetRepeatState extends State<WidgetRepeat> {
  bool _isRepeat = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isRepeat = !_isRepeat;
        });
      },
      child: Icon(
        Icons.repeat,
        color: Color(_isRepeat? 0xffae1947 : 0xff000000),
      ),
    );
  }
}
