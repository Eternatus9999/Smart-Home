import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/utils/DeviceBox.dart';

import '../main.dart';

class Homepage extends State<SmartHome>{
  List smartDivices = [
    ["Lights","lib/icons/lamp.png",true],
    ["Fans","lib/icons/fan.png",false],
    ["A/C","lib/icons/air-conditioner.png",false],
    ["TV","lib/icons/monitor.png",false]
  ];
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
            Text("Welcome Home,"),
            Text(
              "Your Name",
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
                  itemCount: smartDivices.length,
                  padding:  EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.3),
                  itemBuilder: (context, index){
                    return DeviceBox(
                        name: smartDivices[index][0],
                        iconpath: smartDivices[index][1],
                        power: smartDivices[index][2],
                        onchange: (value){
                          setState(() {
                            smartDivices[index][2] = value;
                          });
                        },
                    );
                  },
            ))
          ],
        ),
      ),
    );
  }

}