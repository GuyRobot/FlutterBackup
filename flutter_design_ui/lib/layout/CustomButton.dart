import 'package:flutter/material.dart';
import 'package:flutter_design_ui/layout/ButtonClipper.dart';
import 'package:flutter_design_ui/layout/ClipperImage.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ButtonClipper(),
      child: Container(
        width: 146,
        height: 126,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9F3CB2),
              Color(0xFFF26567)
            ],
            stops: [
              0.4,
              1.0
            ]
          )
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 46),
            child: Icon(Icons.style, color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
