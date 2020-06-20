import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginanimation/animations/fade_animation.dart';
import 'package:flutterloginanimation/components/custom_button.dart';
import 'package:flutterloginanimation/components/custom_button_animation.dart';
import 'package:flutterloginanimation/screen/login_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/home.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff001117).withOpacity(0.6),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 2.4,
                      child: Text(
                        "Best waves for",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            letterSpacing: 2),
                      ),
                    ),
                    FadeAnimation(
                      delay: 2.6,
                      child: Text(
                        "Surfing",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 2.8,
                      child: CustomButton(
                        label: "Sign Up",
                        background: Colors.transparent,
                        fontColor: Colors.white,
                        borderColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    FadeAnimation(
                      delay: 3.2,
                      child: CustomButtonAnimation(
                        label: "Sign In",
                        background: Colors.white,
                        borderColor: Colors.white,
                        fontColor: Color(0xff001117),
                        child: LoginPage(),
                      ),
                    ),
                    SizedBox(height: 16,),
                    FadeAnimation(
                      delay: 3.4,
                      child: Text("Forgot Password ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline
                      ),),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
