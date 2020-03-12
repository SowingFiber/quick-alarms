import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:quick_alarms/Models/Dog.dart' as Dog;
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  var database;
  var fido;
  var dogs;
  var value = 1;
  var mydogs;

  @override
  void initState() {
    setState(() {
      value = 33;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    database = getAppdatabase();
    fido = Dog.Dog(
      id: 0,
      name: 'Fido',
      age: 35,
    );
    storeDog(fido);
    return Scaffold(
      appBar: AppBar(
        title: Text(globalAppName),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "$value",
              style: headlineText,
            ),
            Text(
              "$mydogs",
              style: headlineText,
            ),
            RaisedButton(
              child: Text("Get Dogs"),
              onPressed: () {
                setState(() {
                  value += 1;
                  getDogs();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void storeDog(fido) async {
    await Dog.insertDog(fido);
  }

  Future<List<Dog.Dog>> getDogs() async {
    mydogs = await Dog.dogs();
  }
}

getAppdatabase() async {
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  return database;
}
