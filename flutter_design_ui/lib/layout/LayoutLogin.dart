import 'package:flutter/material.dart';
import 'package:flutter_design_ui/layout/ClipperImage.dart';
import 'package:flutter_design_ui/layout/CustomButton.dart';
import 'package:flutter_design_ui/layout/LoginPage.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: ClipperImage(),
            child: Container(
              width: double.infinity,
              height: 660,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -380,
                    top: -320,
                    bottom: 0,
                    child: Image.asset(
                      "images/jisoo.jpg",
                      fit: BoxFit.cover,
                      width: 820,
                      height: 1480,
                    ),
                  ),
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
                  Positioned(
                    right: 40,
                    top: 60,
                    child: Text(
                      "Jisoo",
                      style: TextStyle(
                        fontSize: 52,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Positioned(
                    top: 96,
                    right: 28,
                    child: Text(
                      "Younnie",
                      style: TextStyle(
                        fontSize: 52,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "UI Design",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black
                        )
                      ),
                      TextSpan(
                        text: " Teamer",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black45
                        )
                      )
                    ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return LoginPage();
                    }
                  ));
                },
                  child: Hero(
                    tag: "LoginButton",
                      child: CustomButton()))
            ],
          )
        ],
      ),
    );
  }
}
