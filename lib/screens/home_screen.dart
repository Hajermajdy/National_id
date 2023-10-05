import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:national_id/screens/national_id_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controllerOfName = TextEditingController();

  final controllerOfId = TextEditingController();

  var box = Hive.box('box');
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/image/background.png"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 270,
                left: 12,
                right: 12
              ),
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black54,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        ),
                      ),
                      controller: controllerOfName,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: "National ID",
                        hintStyle: TextStyle(color: Colors.black54,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                      ),
                      controller: controllerOfId,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        box.put("name", controllerOfName.text);

                        if(int.parse(controllerOfId.text[controllerOfId.text.length-2])%2 == 0){
                          box.put("gender", "Female");
                          print("female");
                        }else{
                          box.put("gender", "male");
                          print("male");
                        }
                        if(controllerOfId.text.toString()[7]=="8" && controllerOfId.text.toString()[8]=='8'){
                          box.put("governorate", "You not born in Cairo");
                        }else{
                          box.put("governorate", "You born in Cairo");
                        }
                        if(controllerOfId.text.toString()[0]=='3'){
                          date+= '20';
                        }else{
                          date+= '19';
                        }

                        for(int i=1; i<7; i++){
                          if(i%2!=0 && i != 1 ){
                            date += "-";
                          }
                          date += controllerOfId.text.toString()[i];
                        }

                        box.put("birthday",date);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NationalIdScreen(),)
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.teal[900]!,
                            width: 4
                          )
                        ))
                      ),
                      child: Text("Analyse User Data",style: TextStyle(color: Colors.teal[900]),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
