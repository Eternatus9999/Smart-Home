import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/pages/Homepage.dart';

class DeviceBox extends StatelessWidget{
  final String name;
  final String iconpath;
  final bool power;
  final int backgroundColor;
  final bool fontColor;
  final onchange;
  const DeviceBox({super.key,required this.name,required this.iconpath, required this.power,required this.backgroundColor, required this.fontColor, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration:
        BoxDecoration(
            color: Colors.grey[backgroundColor],
            borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(iconpath,
              color: fontColor==true?Colors.white:Colors.black,
              height: 65,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  color: fontColor==true?Colors.white:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSwitch(value: power, onChanged: onchange),
            )
          ],
        ),
      ),
    );
  }
}