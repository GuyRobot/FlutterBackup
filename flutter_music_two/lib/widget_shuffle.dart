import 'package:flutter/material.dart';

class WidgetShuffle extends StatefulWidget {
  @override
  _WidgetShuffleState createState() => _WidgetShuffleState();
}

class _WidgetShuffleState extends State<WidgetShuffle> {
  bool _isShuffle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isShuffle = !_isShuffle;
        });
      },
      child: Icon(
        Icons.shuffle,
        color: Color(_isShuffle ? 0xffae1947 : 0xff000000),
      ),
    );
  }
}
