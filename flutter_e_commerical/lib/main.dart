import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecommerical/animation/Animation.dart';
import 'package:flutterecommerical/shop.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  AnimationController _scaleController;
  Animation _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(
            child: Shop(),
            type: PageTransitionType.fade
        ))..then((value) {
          _scaleController.reverse();
          setState(() {
            hide = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Colors.black.withOpacity(0.88),
                Colors.black.withOpacity(.3)
              ])),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(
                  delay: 1.5,
                  child: Text(
                    "Brand New Perspective",
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                FadeAnimation(
                  delay: 1.8,
                  child: Text(
                    "Let's start with our company",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                FadeAnimation(
                  delay: 2.1,
                  child: InkWell(
                    onTap: () {
                      _scaleController.forward();
                      setState(() {
                        hide = true;
                      });
                    },
                    child: AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child) => Transform.scale(scale: _scaleAnimation.value,
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(48)),
                        child: !hide? Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ) : Container(),
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FadeAnimation(
                  delay: 2.4,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(48)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
