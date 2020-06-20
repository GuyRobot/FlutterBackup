import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermusictwo/widget_detail_title.dart';
import 'package:fluttermusictwo/widget_progress_music.dart';

import 'music_bloc.dart';

class WidgetDetailMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double paddingBottom = mediaQueryData.padding.bottom;
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: <Widget>[
          _buildWidgetBackground(screenWidth, screenHeight),
          _buildWidgetContainer(screenWidth, screenHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 128.0 + 16),
                      Container(
                        width: 72,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ClipRRect(
                        child: Image.asset(
                          "images/img_cover_album_red_taylor_swift.jpeg",
                          fit: BoxFit.cover,
                          width: screenWidth / 1.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(48)),
                      )
                    ],
                  ),
                ),
                WidgetDetailTitle(),
                SizedBox(
                  height: 16,
                ),
                WidgetProgressMusic(),
                SizedBox(
                  height: 16,
                ),
                _buildWidgetPlayerController(),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: paddingBottom > 0 ? paddingBottom : 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWidgetBackground(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen / 2.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/img_cover_album_red_taylor_swift.jpeg"),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          color: Colors.white.withOpacity(0.0),
        ),
      ),
    );
  }

  Widget _buildWidgetContainer(double widthScreen, double heightScreen) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: widthScreen,
        height: heightScreen / 1.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48), topRight: Radius.circular(48)),
            gradient: LinearGradient(
                colors: [Colors.blueGrey[300], Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.1, 0.8])),
      ),
    );
  }

  Widget _buildWidgetPlayerController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.skip_previous,
          color: Colors.white,
        ),
        SizedBox(
          width: 36,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[800],
          ),
          padding: EdgeInsets.all(16),
          child: BlocBuilder<MusicBloc, MusicState>(
            builder: (context, state) {
              bool isPlaying = true;
              if (state is MusicEndProgress) {
                isPlaying = false;
              }
              return Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 32,
              );
            },
          ),
        ),
        SizedBox(
          width: 36,
        ),
        Icon(
          Icons.skip_next,
          color: Colors.white,
        )
      ],
    );
  }
}
