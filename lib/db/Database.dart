import 'package:firebase_database/firebase_database.dart';

class Database {

  String username = "User";
  List smartDevices = [
    ["Lights", "lib/icons/lamp.png", false, 200],
    ["Fans", "lib/icons/fan.png", false, 200],
    ["A/C", "lib/icons/air-conditioner.png", false, 200],
    ["TV", "lib/icons/monitor.png", false, 200]
  ];

  late DatabaseReference db;
  Database(){
    db = FirebaseDatabase.instance.ref().child("data");
    db.onValue.listen((DatabaseEvent event) {
      if(event.snapshot.exists){
        Map data = event.snapshot.value as Map;
        print(data.values.last["Owner"]);
        print(data.values.last["Devices"]);
        username = data.values.last["Owner"];
        smartDevices =data.values.last["Devices"];
      }
    });
  }

  bool loadData() {
    if(username != "Chathusha"){
      return true;
    }
    return false;
  }
  void saveData(){
    Map data = {
      "Owner" : username,
      "Devices": smartDevices
    };
    db.push().set(data);
  }
}