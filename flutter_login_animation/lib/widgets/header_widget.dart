import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.12,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(color: Color(0xfff1f94aa).withOpacity(0.5), blurRadius: 5)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Color(0xfff2c4e5e),
            size: 32,
          ),
          profile()
        ],
      ),
    );
  }

  Widget profile() {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Alessa Lisale",
              style: TextStyle(
                  color: Color(0xfff2c4e5e),
                  fontWeight: FontWeight.w600
              ),),
            Text("Hawaii", style: TextStyle(
                color: Color(0xfff1f94aa)
            ),)
          ],
        ),
        SizedBox(width: 5,),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/user_5.jpg"),
              fit: BoxFit.cover
            )
          ),
        )
      ],
    );
  }
}
