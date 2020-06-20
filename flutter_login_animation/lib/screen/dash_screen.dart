import 'package:flutter/material.dart';
import 'package:flutterloginanimation/animations/fade_animation.dart';
import 'package:flutterloginanimation/widgets/header_widget.dart';
import 'package:flutterloginanimation/widgets/popularBeaches.dart';
import 'package:flutterloginanimation/widgets/search_widget.dart';
import 'package:flutterloginanimation/widgets/video_widget.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                delay: 1.2,
                child: HeaderWidget(),
              ),
              SizedBox(
                height: 16,
              ),
              FadeAnimation(
                delay: 1.6,
                child: SearchWidget(),
              ),
              SizedBox(
                height: 16,
              ),
              FadeAnimation(
                delay: 2,
                child: PopularBeaches(),
              ),
              SizedBox(
                height: 16,
              ),
              FadeAnimation(
                delay: 2.4,
                child: VideoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
