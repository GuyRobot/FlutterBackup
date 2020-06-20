import 'package:flutter/material.dart';
import 'package:flutterloginanimation/components/button_login_animation.dart';
import 'package:flutterloginanimation/components/custom_text_field.dart';
import 'package:flutterloginanimation/screen/dash_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login.jpg"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter)),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.slow_motion_video,
                              color: Colors.white,
                              size: 32,
                            ),
                            Text(
                              "32",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Sat 3 Aug",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 48),
                  height: MediaQuery.of(context).size.height * 0.72,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Color(0xff032f42),
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Sign to continute",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      CustomTextField(
                        label: "Email",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        label: "Password",
                        isPassword: true,
                        icon: Icon(
                          Icons.https,
                          size: 28,
                          color: Color(0xfff032f41),
                        ),
                      ),
                      SizedBox(height: 24,),
                      ButtonLoginAnimation(
                        label: "Login",
                        background: Colors.blueAccent,
                        borderColor: Colors.lightBlue,
                        fontColor: Colors.white,
                        child: DashScreen(),
                      )
                    ],
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
