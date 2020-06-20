import 'package:flutter/material.dart';
import 'package:flutterloginanimation/widgets/search_text_field.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SearchTextField(),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 78,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xfff1f94aa),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.filter_list,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
