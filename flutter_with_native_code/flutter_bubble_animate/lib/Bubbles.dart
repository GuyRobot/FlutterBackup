import 'dart:math';

import 'package:flutter/material.dart';

class Bubbles extends StatefulWidget {
  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  List<Bubble> bubbles;
  final int numberOfBubbles = 360;
  final Color color = Colors.pink;
  final double maxBubbleSize = 12;

  @override
  void initState() {
    super.initState();
    bubbles = List();
    int i = numberOfBubbles;
    while (i > 0){
      bubbles.add(Bubble(color, maxBubbleSize));
      i--;
    }
    _animationController = new AnimationController(
        duration: Duration(seconds: 1200), vsync: this);
    _animationController.addListener((){
      updateBubblePosition();
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 240,
                  ),
                  Text("Hello", style: TextStyle(
                    color: Colors.pink,
                    fontSize: 42,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 32,),
                  Text("Bubble Moving...",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ),
            CustomPaint(
              foregroundPainter: BubblePainter(
                  bubbles: bubbles, controller: _animationController),
              size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
            )
          ],
        ),
      ),
    );
  }
  void updateBubblePosition(){
    bubbles.forEach((it) => it.updatePosition());
    setState(() {

    });
  }
}
class BubblePainter extends CustomPainter{
  List<Bubble> bubbles;
  AnimationController controller;
  BubblePainter({this.bubbles, this.controller});
  @override
  void paint(Canvas canvas, Size size) {
    bubbles.forEach((it) {
      it.assignRandomPositionIfUninitialized(size);
      it.draw(canvas, size);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class Bubble {
  Color color;
  double direction;
  double speed;
  double radius;
  double x;
  double y;
  double opacity = Random().nextDouble();

  Bubble(Color color, double maxBubbleSize) {
    this.color = color;
    this.direction = Random().nextDouble() * 360;
    this.speed = 1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = color.withOpacity(opacity)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;



    randomlyChangeDirectionWhenReachEdge(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      x = Random().nextDouble() * canvasSize.width;
    }
    if (y == null) {
      y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    if (x == null || y == null) {

    } else {
      var a = 180 - (direction + 90);
      direction > 0 && direction < 180
          ? x += speed * sin(direction) / sin(speed)
          : x -= speed * sin(direction) / sin(speed);
      direction > 90 && direction < 270
          ? y += speed * sin(a) / sin(speed)
          : y -= speed * sin(a) / sin(speed);
    }
  }
  randomlyChangeDirectionWhenReachEdge(Size canvasSize){
    if ( x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0){
      direction = Random().nextDouble() * 360;
      opacity = Random().nextDouble();

    }
  }
}
