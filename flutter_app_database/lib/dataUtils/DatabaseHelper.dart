import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app_database/models/DataNote.dart';


class DatabaseHelper{
  DatabaseHelper._createInstance();
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String dataTable = 'data_table';
  String colId = 'id';
  String colName = 'name';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate ='date';
  factory DatabaseHelper(){
    if (_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get dataBase async{
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "data.db";
    var dataDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return dataDatabase;
  }
  void _createDB(Database database, int newVersion) async {
    await database.execute('CREATE TABLE $dataTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }
  Future<List<Map<String, dynamic>>> getDataMapList() async {
    Database db = await this.dataBase;
//    var result = await db.rawQuery('SELECT * FROM $dataTable order by $colPriority ASC');
    var result = await db.query(dataTable, orderBy: '$colPriority ASC');
    return result;
  }
  // insert data
  Future<int> insertData(DataNote dataNote) async {
    Database db = await this.dataBase;
    var result = db.insert(dataTable, dataNote.toMap());
    return result;
  }
  Future<int> updateData(DataNote dataNote) async {
    var db = await this.dataBase;
    var result = await db.update(dataTable, dataNote.toMap(), where: '$colId = ?', whereArgs: [dataNote.id]);
    return result;
  }
  Future<int> deleteData(int id) async {
    var db = await this.dataBase;
    int result = await db.rawDelete('DELETE FROM $dataTable WHERE $colId = $id');
    return result;
  }
  Future<int> getCount() async {
    Database db = await this.dataBase;
    List<Map<String, dynamic>> all = await db.rawQuery('SELECT COUNT (*) from $dataTable');
    int result = Sqflite.firstIntValue(all);
    return result;
  }
  Future<List<DataNote>> getListData() async {
    var dataMapList = await getDataMapList();
    int count = dataMapList.length;

    List<DataNote> listData = List<DataNote>();
    for (int i = 0; i < count; i++){
      listData.add(DataNote.fromMapObject(dataMapList[i]));
    }
    return listData;
  }
}