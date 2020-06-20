import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermusictwo/music.dart';
import 'package:fluttermusictwo/music_bloc.dart';
import 'package:fluttermusictwo/widget_detail_music.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class WidgetMiniPlayer extends StatefulWidget {
  final Music music;
  final double screenWidth;
  final double screenHeight;
  final double paddingBottom;

  const WidgetMiniPlayer(
      {Key key,
      this.music,
      this.screenWidth,
      this.screenHeight,
      this.paddingBottom})
      : super(key: key);

  @override
  _WidgetMiniPlayerState createState() => _WidgetMiniPlayerState();
}

class _WidgetMiniPlayerState extends State<WidgetMiniPlayer> {
  MusicBloc _musicBloc;
  Timer timer;
  double _progressMusic = 0;

  @override
  void initState() {
    if (_musicBloc == null) {
      _musicBloc = BlocProvider.of<MusicBloc>(context);
    }
    _musicBloc.add(MusicStart(widget.music));
    if (timer == null || timer.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (value) {
        _musicBloc.add(MusicUpdate());
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) {
          return WidgetDetailMusic();
        },
        isScrollControlled: true,
        isDismissible: false);
      },
      child: BlocProvider.value(
        value: _musicBloc,
        child: Container(
          width: widget.screenWidth,
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: widget.paddingBottom > 0 ? widget.paddingBottom : 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 28,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(99)),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Playing Music",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .merge(TextStyle(color: Colors.grey)),
                        ),
                        Text("${widget.music.title}",
                        style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: BlocBuilder<MusicBloc, MusicState>(
                          builder: (context, state) {
                            if (state is MusicUpdateProgress) {
                              _progressMusic = state.progressMusic;
                              int progressSecond = state.progressSecond;
                              if (progressSecond == widget.music.durationInSecond) {
                                _progressMusic = 100;
                                timer.cancel();
                                _musicBloc.add(MusicEnd());
                              }
                            }
                            return SleekCircularSlider(
                              appearance: CircularSliderAppearance(
                                customWidths: CustomSliderWidths(
                                  progressBarWidth: 2,
                                  trackWidth: 1,
                                  handlerSize: 1,
                                  shadowWidth: 1
                                ),
                                infoProperties: InfoProperties(
                                  modifier: (value) => "",

                                ),
                                customColors: CustomSliderColors(
                                  trackColor: Colors.grey,
                                  progressBarColor: Colors.black
                                ),
                                size: 4,
                                angleRange: 360,
                                startAngle: -90
                              ),
                              min: 0,
                              max: 100,
                              initialValue: _progressMusic,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: BlocBuilder<MusicBloc, MusicState>(
                          builder: (context, state) {
                            bool isPlaying = true;
                            if (state is MusicEndProgress) {
                              isPlaying = false;
                            }
                            return Icon(
                              !isPlaying ? Icons.play_arrow : Icons.pause,
                              size: 24,
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
