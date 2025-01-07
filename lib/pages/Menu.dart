import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/main.dart';

import '../db/Database.dart';
import 'Homepage.dart';
import 'HomepageWrapper.dart';

class Menu extends State<SmartHome> {
  Menu(SmartHome smartHome);


  @override
  Widget build(BuildContext context) {
    Database db = Database();
    void onPressed() async {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent closing the dialog manually
        builder: (context) => Center(
          child: CircularProgressIndicator(), // Your loading indicator
        ),
      );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomepageWrapper(
              username: db.username,
              smartDevices: db.smartDevices,
              db: db,
            ),
          ),
        );
    }

    return SafeArea(child: Scaffold(
        body: Container(
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text('Go to Second Widget')
          ),
        )
    ));
  }
}
