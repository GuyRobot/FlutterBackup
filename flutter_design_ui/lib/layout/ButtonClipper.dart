import 'package:flutter/cupertino.dart';

class ButtonClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height / 2, size.width, 0);
//    path.lineTo(32, size.height / 2 + 32);
//    path.quadraticBezierTo(
//        0 , size.height / 2 ,
//        32, size.height / 2 - 32);
//    path.quadraticBezierTo(size.width /  - 32, 32, size.width, 0);
//    path.lineTo(size.width, 0);
//    path.quadraticBezierTo(
//        size.width / 2, size.height /2, size.width, 0);
//    path.lineTo(0, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}