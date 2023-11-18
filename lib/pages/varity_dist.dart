import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class Report_data{

  String? PK_CVER_ID;
  String? CVER_CODE;
  String? CVER_DESC;
  double? TODAY;
  double? TODATE;
  double? PERCENTAGE;
  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data({required this.PK_CVER_ID, required this.CVER_CODE,required this.CVER_DESC,required this.TODAY,required this.TODATE,required this.PERCENTAGE,});

  Report_data.fromJson(dynamic json){
    PK_CVER_ID = json['PK_CVER_ID'].toString();
    CVER_CODE = json['CVER_CODE'].toString();
    CVER_DESC = json['CVER_DESC'].toString();

    TODAY = json['TODAY'];
    TODATE = json['TODATE'];
    PERCENTAGE = json['PERCENTAGE'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PK_CVER_ID'] = this.PK_CVER_ID;
    data['CVER_CODE'] = this.CVER_CODE;
    data['CVER_DESC'] = this.CVER_DESC;
    data['TODAY'] = this.TODAY;
    data['TODATE'] = this.TODATE;
    data['PERCENTAGE'] = this.PERCENTAGE;
    return data;
  }
}
class Report_data1{

  String? DISTANCE;
  double? TODAY;
  double? TODATE;
  double? PERCENTAGE;
  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data1({required this.DISTANCE, required this.TODAY,required this.TODATE,required this.PERCENTAGE,});

  Report_data1.fromJson(dynamic json){
    DISTANCE = json['DISTANCE'].toString();


    TODAY = json['TODAY'];
    TODATE = json['TODATE'];
    PERCENTAGE = json['PERCENTAGE'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DISTANCE'] = this.DISTANCE;

    data['TODAY'] = this.TODAY;
    data['TODATE'] = this.TODATE;
    data['PERCENTAGE'] = this.PERCENTAGE;
    return data;
  }
}

class varity_dist extends StatefulWidget {
  const varity_dist({Key? key}) : super(key: key);

  @override
  State<varity_dist> createState() => _varity_distState();
}

class _varity_distState extends State<varity_dist> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List TendNoList=[];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void _NaviDopage() {
    setState(() {
      //How to delete the list data on clicking Delete button?
      //Get.off(DOPage());;
    });
  }



  Future<List<Report_data>> fetchResults() async {
    List<Report_data> reptlist=[];

    final SharedPreferences? prefs = await _prefs ;
    String sql="getCVERdata";
    String? datedt=     prefs?.getString('_selectedDate');
    sql=sql +(datedt==null?"":" '" +datedt! +"'");
    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': sql,
        'constr': "ConStringh"
      };

      //var response = await http.get(url);
      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['Table'] != null) {
          json['Table'].forEach((V){
            reptlist.add(Report_data.fromJson(V));
          });
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    }
    catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
    return reptlist;
  }

  Future<String> fetchResults5() async {
    String datad="";

    final SharedPreferences? prefs = await _prefs ;
    String sql="Select FORMAT(CONVERT(date,";
    String? datedt=     prefs?.getString('_selectedDate');
    sql=sql +(datedt==null?"getdate()":" '" +datedt! +"'")+"),'dd-MMM-yyyy') dt";
    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': sql,
        'constr': "ConStringh"
      };

      //var response = await http.get(url);
      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['Table'] != null) {
          json['Table'].forEach((V){
            datad=V["dt"].toString();

          });
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    }
    catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
    return datad;
  }
  Future<List<Report_data1>> fetchResults1() async {
    List<Report_data1> reptlist=[];
    final SharedPreferences? prefs = await _prefs ;
    String sql="getditancedata";
    String? datedt=     prefs?.getString('_selectedDate');
    sql=sql +(datedt==null?"":" '" +datedt! +"'");
    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': sql,
        'constr': "ConStringh"
      };

      //var response = await http.get(url);
      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['Table'] != null) {
          json['Table'].forEach((V){
            reptlist.add(Report_data1.fromJson(V));
          });
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    }
    catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
    return reptlist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar:
      AppBar(  title: Text('SPSCL-CC',style: TextStyle(color: Colors.white)),backgroundColor:
      Color(0xFFE2213E)
        ,centerTitle: true,),*/
      body: SingleChildScrollView(
          scrollDirection:Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Column(
              children: [
                SizedBox(height: 20,),
                FutureBuilder<String>(
                  future: fetchResults5(), // async work
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting: return Text('Loading....');
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18));
                    }
                  },
                ),
                SizedBox(height: 20,),
                Container(
                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                  child: Column(

                    children: [

                      Text('VARIETY WISE CANE CRUSHING INFORMATION FOR ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Text('CURRENT DATE ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    ], ),
                ),

                FutureBuilder<List<Report_data>>(
                  //initialData: <Report_data>[],
                    future: fetchResults(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError ||
                          snapshot.data == null ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: CircularProgressIndicator(

                                )
                            )
                        );

                      }
                      return Container(
                        child: Column(
                          children: [

                            DataTable(
                              //showBottomBorder: true,
                              border: TableBorder.all(),
                              columnSpacing: 10,
                              headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              columns: <DataColumn>[

                                DataColumn(label: Text("VARIETY",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display CIRCLE"),
                                DataColumn(label: Text("TODAY",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODAY"),
                                DataColumn(label: Text("TODATE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODATE"),
                                DataColumn(label: Text("PERCENTAGE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display PERCENTAGE"),
                                /*DataColumn(label: Text("Tender Status",textAlign: TextAlign.center,), tooltip: "To Display Status"),
                                DataColumn(label: Text("DO Status",textAlign: TextAlign.center,), tooltip: "To Display DOactive"),*/
                              ],
                              rows: List.generate(
                                  snapshot.data!.length,
                                      (index) {
                                    var reptlist = snapshot.data![index];
                                    return DataRow(
                                        color: reptlist.CVER_DESC.toString().contains("TOTAL") ? MaterialStateProperty.all(Color(0xFFDEDDDD)): MaterialStateProperty.all(Colors.white) ,
                                        cells: [
                                          DataCell(

                                             Text(reptlist.CVER_DESC.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: reptlist.CVER_DESC.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white))),

                                          DataCell(
                                             Text(reptlist.TODAY!.toStringAsFixed(3),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),

                                          DataCell(
                                            Container(

                                                child: Text(reptlist.TODATE!.toStringAsFixed(3),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),
                                          ),
                                          DataCell(
                                            Text(reptlist.PERCENTAGE!.toStringAsFixed(2),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                                          ),
                                          /* DataCell(
                                            Text(reptlist.status.toString(),textAlign: TextAlign.center),
                                          ),
                                          DataCell(

                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  if(reptlist.status.toString()=='Approved')
                                                 ElevatedButton(

                                                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                                                  onPressed: () {


                                                    _NaviDopage(); // new function here
                                                  },
                                                  child:

                                                  Text("Genrate DO",style: TextStyle(color: Colors.white)),
                                                )
                                                    else if (reptlist.status.toString()=='DO Genrated')
                                           ElevatedButton(

                                                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: Get.context!,
                                                            barrierDismissible: false,
                                                            builder: (context) {
                                                              return SimpleDialog(
                                                                title: Text('Delivery Order Information'),
                                                                contentPadding: EdgeInsets.all(20),
                                                                children: [Text('Thank You!!!\n Your Delivery Order was generated...'),
                                                                  ElevatedButton(onPressed: (){
                                                                    Navigator.pop(context);
                                                                  }, child: Text("OK",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                                                    style: ButtonStyle(
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              side: BorderSide.none)),
                                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                                        Color(0xFFE2213E),

                                                                      ),),
                                                                  )

                                                                ],
                                                              );
                                                            });

                                                        // new function here
                                                      },
                                                      child:

                                                      Text("Completed",style: TextStyle(color: Colors.white)),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),*/
                                        ]);
                                  }
                              ).toList(),

                            ),

                          ],
                        ),
                      );
                    }
                ),
                SizedBox(height: 20,),
                Container(
                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                  child: Column(

                    children: [
                      Text('DISTANCE WISE CANE CRUSHING INFORMATION FOR ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Text('CURRENT DATE ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    ], ),
                ),
                FutureBuilder<List<Report_data1>>(
                  //initialData: <Report_data>[],
                    future: fetchResults1(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError ||
                          snapshot.data == null ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: CircularProgressIndicator(

                                )
                            )
                        );

                      }
                      return Container(
                        child: Column(
                          children: [


                            DataTable(
                              //showBottomBorder: true,
                              border: TableBorder.all(),
                              columnSpacing: 10,
                              headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              columns: <DataColumn>[

                                DataColumn(label: Text("DISTANCE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display CIRCLE"),
                                DataColumn(label: Text("TODAY",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODAY"),
                                DataColumn(label: Text("TODATE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODATE"),
                                DataColumn(label: Text("PERCENTAGE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display PERCENTAGE"),
                                /*DataColumn(label: Text("Tender Status",textAlign: TextAlign.center,), tooltip: "To Display Status"),
                                DataColumn(label: Text("DO Status",textAlign: TextAlign.center,), tooltip: "To Display DOactive"),*/
                              ],
                              rows: List.generate(
                                  snapshot.data!.length,
                                      (index) {
                                    var reptlist = snapshot.data![index];
                                    return DataRow(
                                        color: reptlist.DISTANCE.toString().contains("TOTAL") ? MaterialStateProperty.all(Color(0xFFDEDDDD)): MaterialStateProperty.all(Colors.white) ,
                                        cells: [
                                          DataCell(

                                            Text(reptlist.DISTANCE.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: reptlist.DISTANCE.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white)),
                                          ),
                                          DataCell(
                                            Text(reptlist.TODAY!.toStringAsFixed(3),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                                          ),
                                          DataCell(
                                            Text(reptlist.TODATE!.toStringAsFixed(3),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                                          ),
                                          DataCell(
                                            Text(reptlist.PERCENTAGE!.toStringAsFixed(2),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                                          ),
                                          /* DataCell(
                                            Text(reptlist.status.toString(),textAlign: TextAlign.center),
                                          ),
                                          DataCell(

                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  if(reptlist.status.toString()=='Approved')
                                                 ElevatedButton(

                                                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                                                  onPressed: () {


                                                    _NaviDopage(); // new function here
                                                  },
                                                  child:

                                                  Text("Genrate DO",style: TextStyle(color: Colors.white)),
                                                )
                                                    else if (reptlist.status.toString()=='DO Genrated')
                                           ElevatedButton(

                                                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: Get.context!,
                                                            barrierDismissible: false,
                                                            builder: (context) {
                                                              return SimpleDialog(
                                                                title: Text('Delivery Order Information'),
                                                                contentPadding: EdgeInsets.all(20),
                                                                children: [Text('Thank You!!!\n Your Delivery Order was generated...'),
                                                                  ElevatedButton(onPressed: (){
                                                                    Navigator.pop(context);
                                                                  }, child: Text("OK",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                                                    style: ButtonStyle(
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              side: BorderSide.none)),
                                                                      backgroundColor: MaterialStateProperty.all<Color>(
                                                                        Color(0xFFE2213E),

                                                                      ),),
                                                                  )

                                                                ],
                                                              );
                                                            });

                                                        // new function here
                                                      },
                                                      child:

                                                      Text("Completed",style: TextStyle(color: Colors.white)),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),*/
                                        ]);
                                  }
                              ).toList(),

                            ),

                          ],
                        ),
                      );
                    }
                ),
              ],
            ),
          )
      ),
    );
  }
}
