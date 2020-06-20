import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusictwo/music.dart';
import 'package:fluttermusictwo/widget_mini_player.dart';

class WidgetPlaylistMusic extends StatefulWidget {
  final List<Music> _listMusic;
  final double widthScreen;
  final double heightScreen;
  final double paddingBottom;

  WidgetPlaylistMusic(
      this._listMusic, this.widthScreen, this.heightScreen, this.paddingBottom);

  @override
  _WidgetPlaylistMusicState createState() => _WidgetPlaylistMusicState();
}

class _WidgetPlaylistMusicState extends State<WidgetPlaylistMusic> {
  int _indexMusicSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: widget.paddingBottom),
        itemBuilder: (context, index) {
          Music music = widget._listMusic[index];
          int durationMinute =
              music.durationInSecond >= 60 ? music.durationInSecond ~/ 60 : 0;
          int durationSecond = music.durationInSecond >= 60
              ? music.durationInSecond % 60
              : music.durationInSecond;
          String strDuration = '$durationMinute:' +
              (durationSecond < 10 ? '0$durationSecond' : '$durationSecond');
          return GestureDetector(
            onTap: () {
              showMiniPlayer(context, widget.widthScreen, widget.heightScreen,
                  widget.paddingBottom, music);
              setState(() {
                _indexMusicSelected = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          music.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(_indexMusicSelected == index
                                  ? 0xffae1947
                                  : 0xff000000)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${music.artist} - $strDuration',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: widget._listMusic.length,
      ),
    );
  }

  void showMiniPlayer(BuildContext context, double width, double height,
      double paddingBottom, Music music) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return WidgetMiniPlayer(
              music: music,
              screenWidth: width,
              screenHeight: height,
              paddingBottom: paddingBottom);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24))));
  }
}
