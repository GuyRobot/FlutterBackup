import 'package:flutter/material.dart';
import 'package:flutterloginanimation/models/BeachModel.dart';

class PopularBeaches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return beachesItem(beaches[index]);
        },
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: beaches.length,
      ),
    );
  }

  Widget beachesItem(BeachesModel beachesModel) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Color(0xfff082938)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 240,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(beachesModel.img), fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: Icon(
                      !beachesModel.isActive
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    height: 148,
                  ),
                  Text(
                    beachesModel.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    beachesModel.desc,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            height: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Simple dummy text of",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: 12,),
                    beachItemIcon(Icons.location_on, "22\""),
                    SizedBox(width: 8,),
                    beachItemIcon(Icons.beach_access, "19\""),
                    SizedBox(width: 8,),
                    beachItemIcon(Icons.brightness_low, "22 kts"),
                    SizedBox(width: 8,),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget beachItemIcon(IconData iconData, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
