import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_alarms/Models/Dog.dart' as Dog;
import 'package:quick_alarms/constants/UI_Consts.dart';
import 'package:quick_alarms/constants/text_styles.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(globalAppName),
      ),
      body: Container(
        child: Column(children: addDogNames()),
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
