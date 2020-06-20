import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'music_bloc.dart';

class WidgetDetailTitle extends StatefulWidget {
  @override
  _WidgetDetailTitleState createState() => _WidgetDetailTitleState();
}

class _WidgetDetailTitleState extends State<WidgetDetailTitle> {
  bool _isRepeatOne = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                BlocProvider.of<MusicBloc>(context).music.title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                BlocProvider.of<MusicBloc>(context).music.artist,
                style: Theme.of(context).textTheme.subtitle,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isRepeatOne = !_isRepeatOne;
            });
          },
          child: Icon(
            Icons.repeat,
            color: _isRepeatOne ? Color(0xffae1947) : Color(0xff000000),
          ),

        )
      ],
    );
  }
}
