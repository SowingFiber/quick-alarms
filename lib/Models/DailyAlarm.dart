import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DailyAlarm {
  final int id;
  final String name;
  final String description;
  final String startTime;
  final String endTime;
  final String intervalInMinutes;
  final String repeatMode;

  DailyAlarm({
    this.id,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.intervalInMinutes,
    this.repeatMode,
  });

  // Convert a DailyAlarm into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'intervalInMinutes': intervalInMinutes,
      'repeatMode': repeatMode,
    };
  }
}

// Define a function that inserts dogs into the database
Future<void> newAlarm(DailyAlarm alarm) async {
  // Get a reference to the database.
  final Database db = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'alarms.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE dailyalarms(id INTEGER PRIMARY KEY, name TEXT, description TEXT, startTime TEXT, endTime TEXT, intervalInMinutes TEXT, repeatMode TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'dailyalarms',
    alarm.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

//Delete the alarm
// Define a function that inserts dogs into the database
Future<void> delete(DailyAlarm alarm) async {
  // Get a reference to the database.
  final Database db = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'alarms.db'),

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.delete(
    'dailyalarms',
    where: 'startTime = ?',
    whereArgs: [alarm.startTime],
  );
}

// A method that retrieves all the dogs from the dogs table.
Future<List<DailyAlarm>> get() async {
  // Get a reference to the database.
  final Database db = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'alarms.db'),
  );

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dailyalarms');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return DailyAlarm(
      id: maps[i]['id'],
      name: maps[i]['name'],
      description: maps[i]['description'],
      startTime: maps[i]['startTime'],
      endTime: maps[i]['endTime'],
      intervalInMinutes: maps[i]['intervalInMinutes'],
      repeatMode: maps[i]['repeatMode'],
    );
  });
}
