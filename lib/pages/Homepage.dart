import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/pages/MenuWrapper.dart';
import 'package:iot_project/utils/DeviceBox.dart';

import '../db/Database.dart';
import '../main.dart';
import 'Menu.dart';

class Homepage extends State{

  String username = "User";
  List smartDevices = [];

  Database db = Database();


  Homepage(username, smartDevices, db){
    this.username = username;
    this.smartDevices = smartDevices;
    this.db = db;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/icons/menu-button.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome Home,",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              username,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Smart Devices",
              style: TextStyle(fontSize: 20),),
            ),
            Expanded(
                child:
                GridView.builder(
                  itemCount: smartDevices.length,
                  padding:  EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.3),
                  itemBuilder: (context, index){
                    return DeviceBox(
                        name: smartDevices[index][0],
                        iconpath: smartDevices[index][1],
                        power: smartDevices[index][2],
                        backgroundColor: smartDevices[index][3],
                        fontColor: smartDevices[index][2],
                        onchange: (value){
                          setState(() {
                            smartDevices[index][2] = value;
                            smartDevices[index][3]==200?smartDevices[index][3]=900:smartDevices[index][3]=200;
                            // Map data = {
                            //   "Owner" : username,
                            //   "Devices": smartDevices
                            // };
                            // db.push().set(data);
                          });
                        },
                    );
                  },
            )),
            Center(
              child: ElevatedButton(onPressed: (){
                db.saveData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuWrapper()));
              }, child: Text("Log Out")),
            )
          ],
        ),
      ),
    );
  }
}