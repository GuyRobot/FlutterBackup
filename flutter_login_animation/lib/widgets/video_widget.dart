import 'package:flutter/material.dart';
import 'package:flutterloginanimation/models/VideoModel.dart';

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("The Best Surf Video",
          style: TextStyle(
            color: Color(0xfff072939),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            child: ListView.builder(itemBuilder: (context, index) {
              return videoItem(videos[index]);
            },
            itemCount: videos.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),),
          )
        ],
      ),
    );
  }

  Widget videoItem(VideoModel videoModel) {
    return Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xfff1f94aa),
        image: DecorationImage(
          image: AssetImage(videoModel.img),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: Container(
          height: 48,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
