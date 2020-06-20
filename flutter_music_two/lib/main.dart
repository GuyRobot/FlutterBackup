import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermusictwo/music.dart';
import 'package:fluttermusictwo/music_bloc.dart';
import 'package:fluttermusictwo/widget_play_list_music.dart';
import 'package:fluttermusictwo/widget_repeat.dart';
import 'package:fluttermusictwo/widget_shuffle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicBloc>(
      create: (context) => MusicBloc(),
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Music> _listMusic = [
    Music('State of Grace', 'Taylor Swift', 296),
    Music('Red', 'Taylor Swift', 223),
    Music('Treacherous', 'Taylor Swift', 243),
    Music('I Knew You Were Trouble', 'Taylor Swift', 220),
    Music('All Too Well', 'Taylor Swift', 329),
    Music('22', 'Taylor Swift', 232),
    Music('I Almost Do', 'Taylor Swift', 245),
    Music('We Are Never Ever Getting Back Together', 'Taylor Swift', 193),
    Music('Stay Stay Stay', 'Taylor Swift', 206),
    Music('The Last Time - Gary Lightbody', 'Taylor Swift', 299),
    Music('Holy Ground', 'Taylor Swift', 203),
    Music('Sad Beautiful Tragic', 'Taylor Swift', 294),
    Music('The Lucky One', 'Taylor Swift', 240),
    Music('Everything Has Changed - Ed Sheeran', 'Taylor Swift', 245),
    Music('Starlight', 'Taylor Swift', 221),
    Music('Begin Again', 'Taylor Swift', 239),
    Music('The Moment I Knew', 'Taylor Swift', 287),
    Music('Come Back...Be Here', 'Taylor Swift', 224),
    Music('Girl At Home', 'Taylor Swift', 221),
    Music('Treacherous - Original Demo Recording', 'Taylor Swift', 240),
    Music('Red - Original Demo Recording', 'Taylor Swift', 227),
    Music('State Of Grace - Acoustic Version', 'Taylor Swift', 323),
  ];

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: Container(
      width: widthScreen,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildWidgetBackgroundAlbum(widthScreen, context),
              _buildWidgetListMusic(
                  context, paddingBottom, widthScreen, heightScreen)
            ],
          ),
          _buildWidgetButtonPlayAll()
        ],
      ),
    ));
  }

  Widget _buildWidgetBackgroundAlbum(double widthScreen, BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "images/img_cover_album_red_taylor_swift.jpeg"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0.1)],
                    stops: [0.0, 0.7])),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: widthScreen / 2.5,
              height: widthScreen / 2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "images/img_cover_album_red_taylor_swift.jpeg"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 12)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: widthScreen / 1.45,
                ),
                Text(
                  "Red (Deluxe Edited)",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .merge(TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "22 songs - 1 hours",
                  style: Theme.of(context).textTheme.subtitle.merge(TextStyle(
                        color: Colors.grey,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetListMusic(BuildContext context, double paddingBottom,
      double widthScreen, double heightScreen) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: paddingBottom > 0 ? paddingBottom : 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Colors.blueGrey.withOpacity(0.6),
              Colors.white70.withOpacity(.6)
            ],
                stops: [
              0.1,
              0.9
            ])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 48,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "PlayList",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                WidgetShuffle(),
                SizedBox(
                  width: 16,
                ),
                WidgetRepeat()
              ],
            ),
            SizedBox(
              height: 8,
            ),
            WidgetPlaylistMusic(
                _listMusic, widthScreen, heightScreen, paddingBottom)
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetButtonPlayAll() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Container(
          width: 96,
          decoration: BoxDecoration(
              color: Color(0xffae1947),
              borderRadius: BorderRadius.all(Radius.circular(48)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Color(0xffae1947),
                )
              ]),
          child: IconButton(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
