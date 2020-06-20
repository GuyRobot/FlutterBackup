import 'package:flutter/material.dart';
import 'package:flutter_app_database/dataUtils/DatabaseHelper.dart';
import 'package:flutter_app_database/screen/DetailActivity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app_database/models/DataNote.dart';
class ListData extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ListDataState();
  }
}
class ListDataState extends State<ListData>{
  DatabaseHelper databaseHelper = new DatabaseHelper();
  List<DataNote> listData;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (listData == null){
      listData = List<DataNote>();
      updateListView();

    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
        leading: Hero(child: Icon(Icons.brightness_2),
        tag: 'hero',),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        toolbarOpacity: 0.8,
        bottomOpacity: 0.6,
      ),
      body: getListData(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail("Add Data Love", DataNote('', '', 2));
        },
        tooltip: "Add Data",
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
  ListView getListData(){
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
            ),
            child: ListTile(
              leading: CircleAvatar(
                 backgroundColor: getPriorityColor(this.listData[position].priority),
                child: getPriorityIcon(this.listData[position].priority),//Icon(Icons.arrow_right),
              ),
              title: Text(this.listData[position].name, style: titleStyle,),
              subtitle: Text(this.listData[position].date),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey,),
                onTap: () {
                  _delete(context, this.listData[position]);
                },
              ),
              onTap: (){
                navigateToDetail("Edit Data Love", listData[position]);
              },
            ),
          );
        });
  }
  void navigateToDetail(String titleAppBar, DataNote dataNote) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailActivity(dataNote, titleAppBar);
    }));
    if (result){
      updateListView();
    }
  }
  Color getPriorityColor(int priority){
    switch (priority){
      case 1:
        return Colors.cyan;
        break;
      case 2:
        return Colors.lightBlueAccent;
        break;
      default:
        return Colors.cyan;
    }
  }
  Icon getPriorityIcon(int priority){
    switch (priority){
      case 1:
        return Icon(Icons.wb_cloudy);
        break;
      case 2:
        return Icon(Icons.local_activity);
        break;
      default:
        return Icon(Icons.spa);
    }
  }
  void _delete(BuildContext context, DataNote dataNote) async {
    int result = await databaseHelper.deleteData(dataNote.id);
    if (result != 0){
      _showSnackBar(context, "Delete Successfully!");
    }
  }
  void _showSnackBar(BuildContext context, String mss){
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(mss),));
    updateListView();
  }
  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<DataNote>> dataListFuture = databaseHelper.getListData();
      dataListFuture.then((dataList){
        setState(() {
          this.listData = dataList;
          this.count = dataList.length;
        });
      });
    });
  }
}








