import 'dart:ui';

import 'package:api_app/DOPage.dart';
import 'package:api_app/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu2.dart';



class menu1 extends StatefulWidget {
  const menu1({Key? key}) : super(key: key);

  @override
  State<menu1> createState() => _menu1State();
}

class _menu1State extends State<menu1> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController headController = TextEditingController();
  bool issugar=false;
  bool isBagasse=false;
  bool ismolasses=false;
  bool ispresmud=false;
  bool isash=false;
  bool issladge=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Image.asset("assets/logo.png"),title: Text('Atharva',style: TextStyle( fontWeight: FontWeight.bold,  color: Colors.black,fontSize: 25),),   backgroundColor:
      Colors.white,actions: [

        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(_menu1State());
            },

            child: Text(
              'Tender PlatForm',
              style: TextStyle(color: Colors.black),
            )),
        /*TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(_menu1State());
            },

            child: Text(
              'status',
              style: TextStyle(color: Colors.black),
            )),*/

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

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(



            /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tender.jpg"),
                fit: BoxFit.cover,
              ),

            ),*/



      child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //Center Column contents vertically,
          crossAxisAlignment: CrossAxisAlignment.start, //Center Column contents horizontally,
              children: [
                /*Image(image: AssetImage("assets/tender.jpg"),),*/
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(color: Colors.transparent, spreadRadius: 5),
                    ],


                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(

                            "Products", style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30
                        )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0,bottom: 10.0, left:10.0,right: 10.0),
                        child: Center(
                          child: Card(
                              color: Colors.white ,
                              child:  SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,

                                          children: <Widget>[



                                            /* Row(
                                    mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [*/
                                            /*IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text('Hello'),
                                              VerticalDivider(
                                                color: Colors.black,
                                                thickness: 2,
                                              ),
                                              Text('World'),
                                            ],
                                          ),
                                        ),*/
                                            SizedBox(width: 20,),
                                            Container(

                                              /*decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10.0,color: Colors.transparent,offset: Offset(1,2))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child:    Text(

                                                  "Sugar", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                )
                                                  ,textAlign: TextAlign.left,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    issugar = true;
                                                    isBagasse = false;
                                                    ismolasses=false;
                                                    ispresmud=false;
                                                    isash=false;
                                                    issladge=false;
                                                  });
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                                },
                                              ),
                                            ),
                                            /* )]),*/
                                            SizedBox(width: 20,),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            SizedBox(width: 20,),
                                            /*Row(
                                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [*/
                                            Container(
                                              /*decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child: Text(
                                                  "Bagasse", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                ),textAlign: TextAlign.left,

                                                ), onTap: () {
                                                setState(() {
                                                  issugar = false;
                                                  isBagasse = true;
                                                  ismolasses=false;
                                                  ispresmud=false;
                                                  isash=false;
                                                  issladge=false;
                                                });
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                              },
                                              ),
                                            ),
/*]),*/
                                            SizedBox(width: 20,),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 0.9,
                                            ),
                                            SizedBox(width: 20,),
                                            /*Row(
                                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [*/
                                            Container(
                                              /* decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child:Text(
                                                  "Molasses", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                ),textAlign: TextAlign.left,

                                                ), onTap: () {
                                                setState(() {
                                                  issugar = false;
                                                  isBagasse = false;
                                                  ismolasses=true;
                                                  ispresmud=false;
                                                  isash=false;
                                                  issladge=false;
                                                });
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                              },



                                              ),
                                            ),


                                            /* ]),*/
                                            SizedBox(width: 20,),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            SizedBox(width: 20,),
                                            /*Row(
                                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [*/
                                            Container(
                                              /*decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child:Text(
                                                  "Pressmud", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                ),textAlign: TextAlign.left,

                                                )
                                                , onTap: () {
                                                setState(() {
                                                  issugar = false;
                                                  isBagasse = false;
                                                  ismolasses=false;
                                                  ispresmud=true;
                                                  isash=false;
                                                  issladge=false;
                                                });
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                              },
                                              ),
                                            )


                                            /*])*/,
                                            SizedBox(width: 20,),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            SizedBox(width: 20,),
                                            /*Row(
                                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [*/
                                            Container(
                                              /*decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child:Text(
                                                  "Ash", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                ),textAlign: TextAlign.left,

                                                )
                                                , onTap: () {
                                                setState(() {
                                                  issugar = false;
                                                  isBagasse = false;
                                                  ismolasses=false;
                                                  ispresmud=false;
                                                  isash=true;
                                                  issladge=false;
                                                });
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                              },


                                              ),
                                            )



                                            /* ])*/,
                                            SizedBox(width: 20,),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            SizedBox(width: 20,),
                                            /*Row(
                                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [*/
                                            Container(
                                              /*decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)), // Set border color
                                                  width: 3.0),   // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)), // Set rounded corner radius
                                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))]

                                            // Make rounded corner of border
                                          ),*/
                                              child: InkWell(
                                                child:Text(
                                                  "Sludge", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
                                                ),textAlign: TextAlign.left,

                                                )
                                                , onTap: () {
                                                setState(() {
                                                  issugar = false;
                                                  isBagasse = false;
                                                  ismolasses=false;
                                                  ispresmud=false;
                                                  isash=false;
                                                  issladge=true;
                                                });
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>menu2()));
                                              },

                                              ),
                                            ),
                                            SizedBox(width: 20,),




                                            /* ])*/
                                            /*VerticalDivider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),*/

                                          ],
                                        ),
                                      )
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
                      if(issugar==true)
                      SingleChildScrollView(
                        child:

                      Padding(
                        padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                        child: Container(
                          //width:MediaQuery.of(context).size.width/2 ,

                            decoration: BoxDecoration(

                                image: DecorationImage(
                                  image: AssetImage("assets/sugar.jpg"),
                                  fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                ),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.black, // Set border color
                                    width: 3.0),   // Set border width
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)), // Set rounded corner radius
                                boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                // Make rounded corner of border
                            ),

                                child: Column(

                                  children: <Widget>[


                                    Text(

                                  "  Sugar Tenders", style: TextStyle(
                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                    ),textAlign: TextAlign.left,

                                    ),
                                    new Divider(
                                      color: Colors.red,
                                      thickness: 3.0,
                                    ),
                                   /* Container(

                                      width:MediaQuery.of(context).size.width/2 ,

                                      decoration: BoxDecoration(*/

                                          /*image: DecorationImage(
                                            image: AssetImage("assets/sugar.jpg"),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                          ),*/
                                         /* color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.black, // Set border color
                                              width: 0.5),   // Set border width
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]*/

                                        // Make rounded corner of border
                                      //),
                                      //child: Column(
                                       // children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Flexible(
                                                      child: new  Text(
                                                      "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left,

                                                  ),
                                                  ),
]),
                                          ),

                                     Padding(
                                       padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                       child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Container(child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))),

                                            Spacer(flex: 1,),
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
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Container(child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),)))

                                          ]),
                                     ),


                                           /*  ],
                                      ),

                                    ),*/
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                                child: new Text(
                                                "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                            ),textAlign: TextAlign.left

                                            ),
                                            ),
]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Container(child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),)))
                                            , Spacer(flex: 1,)

                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                                child: new Text(
                                                "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                            ),textAlign: TextAlign.right

                                            ),
                                            ),
]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                                child: new  Text(
                                                "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                            ),textAlign: TextAlign.left

                                            ),
                                            ),
]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                                child: new Text(
                                                "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                            ),textAlign: TextAlign.left

                                            ),
                                            ),
]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {
                                                  final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'te');
                                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                   final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),


                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),

                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),

                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),)),
                                              Spacer(),
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
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),



                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shivam Indian Cuisine", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))



                                          ]),
                                    ),



                                    new Divider(
                                      color: Colors.red,
                                    ),
                                  ],
                                )
                            ),
                      ),

                      )
                      else if (isBagasse)
                        SingleChildScrollView(
                          child:

                          Padding(
                            padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                            child: Container(
                                //width:MediaQuery.of(context).size.width/2 ,

                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                      image: AssetImage("assets/sugar.jpg"),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                    ),
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black, // Set border color
                                        width: 3.0),   // Set border width
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)), // Set rounded corner radius
                                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                  // Make rounded corner of border
                                ),

                                child: Column(

                                  children: <Widget>[


                                    Text(

                                      "  Bagasse Tenders", style: TextStyle(
                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                    ),textAlign: TextAlign.left,

                                    ),
                                    new Divider(
                                      color: Colors.red,
                                      thickness: 3.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Flexible(
                                              child: new  Text(
                                                "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left,

                                              ),
                                            ),
                                          ]),
                                    ), Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.right

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new  Text(
                                                  "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {
                                                  final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'te');
                                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                   final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),


                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),

                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer()
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),

                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),
                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),



                                    new Divider(
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Flexible(
                                              child: new Text(
                                                  "  Shivam Indian Cuisine", style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                              ),textAlign: TextAlign.left

                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.grey,
                                                    )),
                                                onPressed: (){
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                },
                                                child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            , Spacer(flex: 1,)
                                            ,ElevatedButton(

                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide.none)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                      Colors.green,
                                                    )),
                                                onPressed: () async {

                                                  /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                },
                                                child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                          ]),
                                    ),



                                    new Divider(
                                      color: Colors.red,
                                    ),
                                  ],
                                )
                            ),
                          ),

                        )
                        else if ( ismolasses)
                          SingleChildScrollView(
                            child:

                            Padding(
                              padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                              child: Container(
                                  //width:MediaQuery.of(context).size.width/2 ,

                                  decoration: BoxDecoration(

                                      image: DecorationImage(
                                        image: AssetImage("assets/sugar.jpg"),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                      ),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.black, // Set border color
                                          width: 3.0),   // Set border width
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)), // Set rounded corner radius
                                      boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                    // Make rounded corner of border
                                  ),

                                  child: Column(

                                    children: <Widget>[


                                      Text(

                                        "  Molasses Tenders", style: TextStyle(
                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                      ),textAlign: TextAlign.left,

                                      ),
                                      new Divider(
                                        color: Colors.red,
                                        thickness: 3.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Flexible(
                                                child: new  Text(
                                                  "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left,

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),
                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),
                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.right

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),
                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new  Text(
                                                    "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),
                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {
                                                    final SharedPreferences? prefs = await _prefs;
                                                    await prefs?.setString('typ', 'te');
                                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer()

                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                     final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),


                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer()
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),

                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer()
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),

                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),
                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer()
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),



                                      new Divider(
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            children: [
                                              Flexible(
                                                child: new Text(
                                                    "  Shivam Indian Cuisine", style: TextStyle(
                                                    fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                ),textAlign: TextAlign.left

                                                ),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.grey,
                                                      )),
                                                  onPressed: (){
                                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                  },
                                                  child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              , Spacer(flex: 1,)
                                              ,ElevatedButton(

                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: BorderSide.none)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.green,
                                                      )),
                                                  onPressed: () async {

                                                    /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                  },
                                                  child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                            ]),
                                      ),



                                      new Divider(
                                        color: Colors.red,
                                      ),
                                    ],
                                  )
                              ),
                            ),

                          )
                        else if ( ispresmud)
                            SingleChildScrollView(
                              child:

                              Padding(
                                padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                                child: Container(
                                    //width:MediaQuery.of(context).size.width/2 ,

                                    decoration: BoxDecoration(

                                        image: DecorationImage(
                                          image: AssetImage("assets/sugar.jpg"),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                        ),
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Colors.black, // Set border color
                                            width: 3.0),   // Set border width
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)), // Set rounded corner radius
                                        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                      // Make rounded corner of border
                                    ),

                                    child: Column(

                                      children: <Widget>[


                                        Text(

                                          "  Pressmud Tenders", style: TextStyle(
                                            fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                        ),textAlign: TextAlign.left,

                                        ),
                                        new Divider(
                                          color: Colors.red,
                                          thickness: 3.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Flexible(
                                                  child: new  Text(
                                                    "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left,

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),
                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),
                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.right

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),
                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new  Text(
                                                      "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),
                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {
                                                      final SharedPreferences? prefs = await _prefs;
                                                      await prefs?.setString('typ', 'te');
                                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))

                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                       final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))



                                              ]),
                                        ),


                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer()
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),

                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),

                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),
                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),



                                        new Divider(
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              children: [
                                                Flexible(
                                                  child: new Text(
                                                      "  Shivam Indian Cuisine", style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                  ),textAlign: TextAlign.left

                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.grey,
                                                        )),
                                                    onPressed: (){
                                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                    },
                                                    child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                , Spacer(flex: 1,)
                                                ,ElevatedButton(

                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide.none)),
                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                          Colors.green,
                                                        )),
                                                    onPressed: () async {

                                                      /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                    },
                                                    child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                              ]),
                                        ),



                                        new Divider(
                                          color: Colors.red,
                                        ),
                                      ],
                                    )
                                ),
                              ),

                            )
                          else if ( isash)
                              SingleChildScrollView(
                                child:

                                Padding(
                                  padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                                  child: Container(
                                     // width:MediaQuery.of(context).size.width/2 ,

                                      decoration: BoxDecoration(

                                          image: DecorationImage(
                                            image: AssetImage("assets/sugar.jpg"),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                          ),
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.black, // Set border color
                                              width: 3.0),   // Set border width
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                        // Make rounded corner of border
                                      ),

                                      child: Column(

                                        children: <Widget>[


                                          Text(

                                            "  Ash Tenders", style: TextStyle(
                                              fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                          ),textAlign: TextAlign.left,

                                          ),
                                          new Divider(
                                            color: Colors.red,
                                            thickness: 3.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Flexible(
                                                    child: new  Text(
                                                      "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left,

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),
                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),
                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.right

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),
                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new  Text(
                                                        "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),
                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {
                                                        final SharedPreferences? prefs = await _prefs;
                                                        await prefs?.setString('typ', 'te');
                                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)

                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                         final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),


                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),

                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),

                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),
                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),



                                          new Divider(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                                children: [
                                                  Flexible(
                                                    child: new Text(
                                                        "  Shivam Indian Cuisine", style: TextStyle(
                                                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                    ),textAlign: TextAlign.left

                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.grey,
                                                          )),
                                                      onPressed: (){
                                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                      },
                                                      child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  , Spacer(flex: 1,)
                                                  ,ElevatedButton(

                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  side: BorderSide.none)),
                                                          backgroundColor: MaterialStateProperty.all<Color>(
                                                            Colors.green,
                                                          )),
                                                      onPressed: () async {

                                                        /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                      },
                                                      child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                ]),
                                          ),



                                          new Divider(
                                            color: Colors.red,
                                          ),
                                        ],
                                      )
                                  ),
                                ),

                              )
                            else if ( issladge)
                                SingleChildScrollView(
                                  child:

                                  Padding(
                                    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                                    child: Container(
                                        //width:MediaQuery.of(context).size.width/2 ,

                                        decoration: BoxDecoration(

                                            image: DecorationImage(
                                              image: AssetImage("assets/sugar.jpg"),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                            ),
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.black, // Set border color
                                                width: 3.0),   // Set border width
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)), // Set rounded corner radius
                                            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                          // Make rounded corner of border
                                        ),

                                        child: Column(

                                          children: <Widget>[


                                            Text(

                                              "  Sladge Tenders", style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
                                            ),textAlign: TextAlign.left,

                                            ),
                                            new Divider(
                                              color: Colors.red,
                                              thickness: 3.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    Flexible(
                                                      child: new  Text(
                                                        "  D. B. R. K. Panchganga Sahakari Sakhar Karkhana", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left,

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),
                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Shri Datta Sakhar Karakhana (Dalmia Bharat Sugar Ind.)", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),
                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Sarsenapati Santaji Ghorapade Sugar Works", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.right

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),
                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new  Text(
                                                          "  Mahadik Sugar and Agro Products", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),
                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Sangamnath Sugars Limited  ", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {
                                                          final SharedPreferences? prefs = await _prefs;
                                                          await prefs?.setString('typ', 'te');
                                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Available",style: TextStyle(fontSize: 15,color: Colors.black,),))

                                                    , Spacer(flex: 1,)

                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                           final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))


                                                  ]),
                                            ),


                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Shree Doodhganga Vedganga Sahakari Sakhar Karakhana", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),

                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Eco Cane Sugars, Ap. Mhalunge", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),

                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Shree Annapurna Sugars & Jaggery Works", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),
                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Padmashree Dr. D. Y. Patil Sahakari Sakhar Karkhana", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),



                                            new Divider(
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: new Text(
                                                          "  Shivam Indian Cuisine", style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15
                                                      ),textAlign: TextAlign.left

                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 0.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.grey,
                                                            )),
                                                        onPressed: (){
                                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                                                        },
                                                        child: Text("Not Available",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                    , Spacer(flex: 1,)
                                                    ,ElevatedButton(

                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    side: BorderSide.none)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              Colors.green,
                                                            )),
                                                        onPressed: () async {

                                                          /* final SharedPreferences? prefs = await _prefs;
                                                  await prefs?.setString('typ', 'DO');
                                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));*/
                                                        },
                                                        child: Text("Check Status",style: TextStyle(fontSize: 15,color: Colors.black,),))
                                                  ]),
                                            ),



                                            new Divider(
                                              color: Colors.red,
                                            ),
                                          ],
                                        )
                                    ),
                                  ),

                                )
                           else
                                SingleChildScrollView(
                                  child:

                                  Padding(
                                    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 10.0),
                                    child: Container(
                                      width:MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(

                                            image: DecorationImage(
                                              image: AssetImage("assets/tender.jpg"),
                                              fit: BoxFit.contain,
                                              //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),


                                            ),
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.black, // Set border color
                                                width: 3.0),   // Set border width
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)), // Set rounded corner radius
                                            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))]

                                          // Make rounded corner of border
                                        ),

                                        child: Text(""),
                                    ),
                                  ),

                                )
                    /*]),*/


















              ],
            ),

          ),
        )
      ),
    );
  }
}
