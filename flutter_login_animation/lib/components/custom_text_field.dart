import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool isPassword;

  const CustomTextField({Key key, this.label, this.icon, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xff234353), fontWeight: FontWeight.w600),
      obscureText: isPassword,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          labelText: label,
          labelStyle:
              TextStyle(color: Color(0xff234353), fontWeight: FontWeight.w600),
          suffixIcon: icon),
    );
  }
}
