import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../component/text_style.dart';

class NationalIdScreen extends StatefulWidget {
  @override
  State<NationalIdScreen> createState() => _NationalIdScreenState();
}

class _NationalIdScreenState extends State<NationalIdScreen> {


  var box = Hive.box('box');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/image/nationalbackground.png"),
          )
        ),
        child: Container(
              padding: EdgeInsets.only(
                top: 110,
                left: 10
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyles(Key: "Name",value: box.get("name"),),
              TextStyles(Key: "Birthday", value: box.get("birthday")),
              TextStyles(Key: "Governorate", value: box.get("governorate")),
              TextStyles(Key: "Gender", value: box.get("gender")),
            ],
          ),
        ),
      ),
    );
  }
}
