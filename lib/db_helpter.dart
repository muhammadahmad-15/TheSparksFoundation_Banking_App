import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databasename = 'bank_customers.db';
  static final _databaseversion = 2;
  static final table = 'Customer_Table';
  static final columnId = 'Id';
  static final columnName = 'Name';
  static final columnEmail = 'Email';
  static final columnBalance = 'Balance';
  static Database _database;

  // Creating a private named constructor and then using its instance so that our app doesn't
  // have to create multiple instances while running rather it uses just one.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,_databasename);
    return openDatabase(path,version: _databaseversion,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE $table ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnName TEXT NOT NULL,$columnEmail TEXT NOT NULL,$columnBalance TEXT NOT NULL); 
        '''
    );
  }

  /* Insert method will take Map as argument with key as string and value
     as dynamic types of map and this method will return integer which will
     show the id of row that we inserted in the table*/
  Future<int> insert(Map<String,dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  /*QuerySpecific method for a specific query*/
  Future<List<Map<String,dynamic>>> queryspecific(String mail) async {
    Database db = await instance.database;
    // return await db.query(table,where:"name = ?",whereArgs:[name]);
    return await db.rawQuery('SELECT * FROM $table WHERE Email = ?',[mail]);
  }

  /* QueryAll method is used to retrieve the data. It takes nothing in arguments
     and returns a list of Map values with string, dynamic as key value of map*/
  Future<List<Map<String,dynamic>>> queryall() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Updating. it returns the no. of rows affected (int)
  Future<int> update(String mail,String bal) async {
    Database db = await instance.database;
    // return await db.rawUpdate('UPDATE $table SET $columnBalance = ? WHERE $columnEmail=?');
    return await db.update(table,{"Email":"$mail","balance":"$bal"},where:"Email = ?",whereArgs:[mail]);
  }

}