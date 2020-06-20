import 'package:flutter/material.dart';
import 'package:flutter_app_database/dataUtils/DatabaseHelper.dart';
import 'package:flutter_app_database/models/DataNote.dart';
import 'package:flutter_app_database/screen/ListData.dart';
import 'package:intl/intl.dart';

class DetailActivity extends StatefulWidget {
  final String title;
  final DataNote dataNote;
  DetailActivity(this.dataNote, this.title);
  @override
  State<StatefulWidget> createState() {
    return DetailActivityState(this.dataNote, this.title);
  }
}
class DetailActivityState extends State<DetailActivity>{

  var _formKey = GlobalKey<FormState>();
  DataNote dataNote;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  static var _black = ["High", "Low"];
  static var itemDropdown = ["Rosie", "Lisa", "Jennie", "Jisoo"];
  var _valueDropdown = _black[0];
  String titleAppbar;
  DetailActivityState(this.dataNote, this.titleAppbar);
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerMore = TextEditingController();
  @override
  Widget build(BuildContext context) {
    textEditingControllerName.text = dataNote.name;
    textEditingControllerMore.text = dataNote.description;
    TextStyle style = Theme.of(context).textTheme.title;
    return WillPopScope(
        onWillPop: () async => false ,
        child: Scaffold(
            appBar: AppBar(
              title: Text(this.titleAppbar),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToPreviousActivity();
                },
              ),
            ),
            body: Form(
              key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      DropdownButton<String>(items: _black.map((String dropDownItem) {
                        return DropdownMenuItem<String>(
                          child: Text(dropDownItem),
                          value: dropDownItem, // need it to set value drop down button
                        );
                      }).toList(),
                        value: this._valueDropdown,
                        onChanged: (value) {
                          setState(() {
                            _valueDropdown = value;
                            updatePriority(value);
                          });
                        },
                        style: style,),
                      Padding(padding: EdgeInsets.all(12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            labelText: "Name",
                            hintText: "Who is you love?",
                            icon: Icon(Icons.people),
                          ),
                          controller: textEditingControllerName,
                          onChanged: (value) {
                            updateName();
                          },
                          style: style,
                          validator: (String value){
                            if (value.isEmpty){
                              return "Please enter Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "More",
                            hintText: "Description...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            icon: Icon(Icons.wb_cloudy),
                          ),
                          controller: textEditingControllerMore,
                          onChanged: (value) {
                            updateDescription();
                          },
                          style: style,
                          validator: (String value){
                            if (value.isEmpty){
                              return "Please enter content";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState.validate()){
                                        _save();
                                      }
                                    });
                                  },
                                  child: Text("Save", textScaleFactor: 1.2,),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                )
                            ),
                            Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      _delete();
                                    });
                                  },
                                  child: Text("Delete", textScaleFactor: 1.2,),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                )
                            ),
                            Hero(child: Icon(Icons.brightness_2),
                              tag: 'hero',)
                          ],
                        ),
                      )
                    ],
                  ),
                ))

        ),
    );
  }
  void moveToPreviousActivity(){
    Navigator.pop(context, true);
    }
    // string priority to int priority
  void updatePriority(String priority) {
    switch (priority){
      case 'High':
        dataNote.priority = 1;
        break;
      case 'Low':
        dataNote.priority = 2;
        break;
    }
  }
  // int priority to String priority

  String getPriorityToString(int priority) {
    String priorityString;
    switch (priority){
      case 1:
        priorityString = _black[0];
        break;
      case 2:
        priorityString = _black[1];
        break;
    }
    return priorityString;
  }
  void updateName(){
    this.dataNote.name = textEditingControllerName.text;
  }
  void updateDescription(){
    this.dataNote.description = textEditingControllerMore.text;
  }
  void _save() async {
    int result;
    moveToPreviousActivity();
    dataNote.date = DateFormat.yMMMd().format(DateTime.now());
    if (dataNote.id != null){
      result = await databaseHelper.updateData(dataNote);
    } else{
      result = await databaseHelper.insertData(dataNote);
    }
    // Success
    if (result != 0){
      _showAlertDialog("Inform", "Saved Successfully");
    } else
      {
        _showAlertDialog("Error", "Error Save Data");
      }
  }
  void _showAlertDialog(String title, String mss){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(mss),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
  void _delete() async {
    moveToPreviousActivity();
    if (dataNote.id == null){
      _showAlertDialog("Status", "No Data delete");
    } else {
      int result = await databaseHelper.deleteData(dataNote.id);
      if (result != 0){
        _showAlertDialog("Status", "Delete Successfully");
      } else {
        _showAlertDialog("Status", "Some problem occured while delete data");
      }
    }
  }
}
