import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDemo extends StatefulWidget {
  const DatabaseDemo({Key? key}) : super(key: key);

  @override
  State<DatabaseDemo> createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  Database? database;

  @override
  void initState() {
    createDatabase();
    // TODO: implement initState
    super.initState();
  }

  Future createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER)');
    });
  }

  Future insertData() async {
    await database!.insert("Test", {
      "id": 2,
      "name": "xyz",
      "value": 26,
    });
  }

  Future getData() async {
    List<Map<String, dynamic>> data = await database!.query('Test');
    log('DATA $data');
  }

  Future updateData() async {
    await database!.update(
        "Test",
        {
          "name": "lalit",
        },
        where: "name=?",
        whereArgs: ["kautuk"]);
  }

  Future deleteData() async {
    await database!.delete("Test", where: "name=?", whereArgs: ["lalit"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: Text('insert'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text('getdata'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: Text('update'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: Text('delete'),
            ),
          ),
        ],
      ),
    );
  }
}
