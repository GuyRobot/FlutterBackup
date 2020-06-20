import 'package:flutter/material.dart';
import 'package:flutter_app_database/screen/DetailActivity.dart';
import 'package:flutter_app_database/screen/ListData.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Database",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: ListData(),
    );
  }
}