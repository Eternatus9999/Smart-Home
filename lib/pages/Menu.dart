import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/Database.dart';
import 'HomepageWrapper.dart';

class Menu extends State {

  Database db = Database();
  Menu(){
    this.db = Database();
  }

  @override
  Widget build(BuildContext context) {
    String name = "";
    void onPressedRegister(){
      db.username = name;
      db.loadData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomepageWrapper(
            username: name,
            smartDevices: db.smartDevices,
            db: db,
          ),
        ),
      );
    }
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
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong Username')),
        );
      }
    }
    return SafeArea(
        child: Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Text('Login',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: ElevatedButton(
                    onPressed: onPressedRegister,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Register',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)
                ),
              ),
            ]
          ),
        )
    );
  }
}
