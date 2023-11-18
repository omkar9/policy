import 'package:api_app/DOPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth_screen.dart';
import 'auth/tender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:
      Color(0xFFE2213E),actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },

            child: Text(
              'logout',
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome home'),
            /*TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFE2213E),
                    )),
                onPressed: () async {
                  final SharedPreferences? prefs = await _prefs;
                  print(prefs?.get('Custid'));
                },
                child: Text('print token')),*/
            
            Hero(tag: "tender",
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFE2213E),
                    )),
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>tender()));
            }, child: Text("TENDER",style: TextStyle(fontSize: 15,color: Colors.white,),))),
            SizedBox(height: 20,),
            Hero(tag: "dopage",
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide.none)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFE2213E),
                        )),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DOPage()));
                }, child: Text("Delivery Order ",style: TextStyle(fontSize: 15,color: Colors.white,),)))
          ],
        ),
      ),
    );
  }
}
