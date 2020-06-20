import 'package:flutter/material.dart';
import 'package:flutter_design_ui/layout/ClipperImage.dart';
import 'package:flutter_design_ui/layout/CustomButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: ClipperImage(),
                  child: Container(
                    width: double.infinity,
                    height: 480,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            right: -120,
                            bottom: -280,
                            left: 0,
                            child: Image.asset("images/crush.jpg")),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: double.infinity,
                            height: 320,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFE2B0FF).withOpacity(.8),
                                      Color(0xFF9F44D3).withOpacity(.05)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black87,),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 0,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 42,
                        color: Colors.black
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: buildFieldUserName(),
            ),
            SizedBox(
              height: 18,
            ),
            buildFieldPassword(),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black45
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: "LoginButton",
                    child: CustomButton())
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildFieldUserName(){
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4.0)
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4, left: 24, right: 16),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Username",
            hintStyle: TextStyle(
              fontSize: 16
            ),
            enabledBorder: InputBorder.none,
            suffixIcon: Icon(Icons.supervised_user_circle)
          ),
        ),
      ),
    );
  }
  Widget buildFieldPassword(){
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4.0)
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4, left: 24, right: 16),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                  fontSize: 16
              ),
              enabledBorder: InputBorder.none,
              suffixIcon: Icon(Icons.security)
          ),
        ),
      ),
    );
  }
  Widget buildTextForm(){
    return Container(
      width: double.infinity,
      height: 76,
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 16),
//        padding: EdgeInsets.only(top: 16, left: 24, right: 16),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(
                  fontSize: 16
              ),
              labelText: "User",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
              )
          ),
        ),
      ),
    );
  }
}
