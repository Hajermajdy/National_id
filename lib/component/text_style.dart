import 'package:flutter/material.dart';

class TextStyles extends StatelessWidget {
  String Key;
  String value;


  TextStyles({required this.Key,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${Key} : ',style: TextStyle(color: Colors.white)),
        Text(value,style: TextStyle(color: Colors.white))
      ],
    );
  }
}
