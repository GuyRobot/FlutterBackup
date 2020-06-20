import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermusictwo/music_bloc.dart';

class WidgetProgressMusic extends StatefulWidget {
  @override
  _WidgetProgressMusicState createState() => _WidgetProgressMusicState();
}

class _WidgetProgressMusicState extends State<WidgetProgressMusic> {
  double _progress = 0;
  int _durationProgress = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        if (state is MusicUpdateProgress) {
          _progress = state.progressMusic / 100;
          _durationProgress = state.progressSecond;
        }
        int minute = _durationProgress ~/ 60;
        int second = minute > 0 ? _durationProgress % 60 : _durationProgress;
        String strDuration = (minute < 10 ? "0$minute" : "$minute") + ':' + (
            second < 10 ? "0$second" : "$second"
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            LinearProgressIndicator(
              value: _progress,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.blueGrey.shade800,
            ),
            Text(strDuration)
          ],
        );
      },
    );
  }
}
