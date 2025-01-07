import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/main.dart';

class Menu extends State<SmartHome>{
  String saveText = "";
  String saveTextonButtonClicked = "";

  late DatabaseReference db;

  @override
  void initState(){
    super.initState();

    db = FirebaseDatabase.instance.ref().child("data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              child: TextField(
                onChanged: (text){
                  setState(() {
                    saveText = text;
                  });
                },
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    saveTextonButtonClicked = saveText;
                  });
                },
                child: Text('Sumbit'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              child: Text(saveText),
            ),
            Container(
              margin: EdgeInsets.all(50),
              child: Text(saveTextonButtonClicked),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    Map<String, String> data = {
                      'value': saveText,
                      'valueSaved': saveTextonButtonClicked
                    };
                    db.push().set(data);
                  });
                },
                child: Text('Save on Database'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {

                  });
                },
                child: Text('Get data from Database'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            StreamBuilder(stream: db.onValue,builder: (context,snapshot){
              if(snapshot.hasData){
                Map data = snapshot.data?.snapshot.value as Map;
                print(data.values.toList().last);
                return Text("");
              }
              return const Text("No Data");
            })
          ]
      ),
    );
  }
}