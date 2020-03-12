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
  var dogs;
  var value = 1;
  var mydogs;
  var name;

  @override
  void initState() {
    saveDogs(Dog.makeDogs());
    value = 33;
    getShitDone();
    print("Well");

    super.initState();
  }

  getShitDone() async {
    await getDogs();
  }

  @override
  Widget build(BuildContext context) {
    getDogs();
    database = getAppdatabase();

    return Scaffold(
      appBar: AppBar(
        title: Text(globalAppName),
      ),
      body: Container(
        child: Column(
          children: addDogNames()
        ),
      ),
    );
  }

  void storeDog(dog) async {
    await Dog.insertDog(dog);
  }

  getDogs() async {
    mydogs = await Dog.dogs();
    setState(() {});
  }

  Future<String> getName() async {
    return "Shanu";
  }

  List<Widget> addDogNames() {
    var listnames = <Widget>[];
    if (mydogs != null) {
      for (var dog in mydogs as List<Dog.Dog>) {
        listnames.add(Text(dog.name, style: headlineText));
      }
      return listnames;
    }
    return listnames;
  }

  void saveDogs(listOfDogs) {
    for (var dog in listOfDogs) {
      storeDog(dog);
    }
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
