import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/main.dart';

import '../db/Database.dart';
import 'Homepage.dart';
import 'HomepageWrapper.dart';

class Menu extends State {


  @override
  Widget build(BuildContext context) {
    String name = "";
    Database db = Database();
    void onPressed() async {
      if(db.username == name){
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
      else {
        // Handle failure to load data
        Navigator.of(context).pop(); // Close the loading indicator
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong Username')),
        );
      }
    }
    return SafeArea(
        child: Scaffold(
        body:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Username',
                  ),
                  onChanged: (value){
                    name = value;
                  },
                ),
              ),

              ElevatedButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Login',style: TextStyle(fontSize: 30,color: Colors.black),)
              ),
            ]
          ),
        )
    );
  }
}
