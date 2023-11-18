import 'package:api_app/DOPage.dart';
import 'package:api_app/menu1.dart';
import 'package:api_app/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class menu2 extends StatefulWidget {
  const menu2({Key? key}) : super(key: key);

  @override
  State<menu2> createState() => _menu2State();
}

class _menu2State extends State<menu2> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Image.asset("assets/logo.png"),title: Text('Atharva',style: TextStyle( fontWeight: FontWeight.bold,  color: Colors.black,fontSize: 25),),   backgroundColor:
      Colors.white,actions: [

        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(menu1());
            },

            child: Text(
              'Tender PlatForm',
              style: TextStyle(color: Colors.black),
            )),
        /*TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },

            child: Text(
              'logout',
              style: TextStyle(color: Colors.black),
            ))*/
      ]),
      body: SingleChildScrollView(

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/sugar.jpg"),
                fit: BoxFit.cover,
              ),
            ),


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
              children: [
                Container(
                  width: 100,
                  height: 80,
                ),
                Container(
                  width: 100,
                  height: 80,
                ),
                Container(
                  width: 100,
                  height: 80,
                ),
                Center(
                  child: Text(

                      "Sugar Tenders", style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25
                  )

                  ),
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(

                            color: Colors.white ,
                            child:  Container(


                                child: Column(

                                  children: <Widget>[
                                Row(
                                children: [
                                    Text(
                                        "  Sangamnath Sugars Limited  ", style: TextStyle(
                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                    )

                                    ),


                                  ElevatedButton(

                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  side: BorderSide.none)),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.green,
                                          )),
                                      onPressed: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                      },
                                      child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.white,),))
                                ])
                                  ],
                                )
                            )

                        ),

                        ]))

              ],
            ),
          )
      ),
    );
  }
}
