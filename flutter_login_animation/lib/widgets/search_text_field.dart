
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Color(0xfff234253),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: "Search",
        labelStyle: TextStyle(
          color: Color(0xff234253),
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(Icons.search,
        size: 28,),
        fillColor: Color(0xffeaf2f4),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffffffff),
          ),
          borderRadius: BorderRadius.circular(12)
        )
      ),
    );
  }
}
