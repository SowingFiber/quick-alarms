class QuickAlarm {
  final int id;
  final String name;
  final String time;

  QuickAlarm({this.id, this.name, this.time});

  ///
  ///Map Methods
  ///
  //to be used when inserting a row in the table
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["name"] = name;
    map["time"] = time;
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["time"] = time;
    return map;
  }

  //to be used when converting the row into object
  factory QuickAlarm.fromMap(Map<String, dynamic> data) => new QuickAlarm(
        id: data['id'],
        name: data['name'],
        time: data['time'],
      );
}
