import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';
class Report_data{

  String? PK_DIVISION_ID;
  String? DIVISION_NAME;
  String? CIRCLE_CODE;
  String? CIRCLE_NAME;
  String? TODAY;
  String? TODATE;
  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data({required this.PK_DIVISION_ID, required this.DIVISION_NAME,required this.CIRCLE_CODE,required this.CIRCLE_NAME,required this.TODAY,required this.TODATE});

  Report_data.fromJson(dynamic json){
    PK_DIVISION_ID = json['PK_DIVISION_ID'].toString();
    DIVISION_NAME = json['DIVISION_NAME'].toString();
    CIRCLE_CODE = json['CIRCLE_CODE'].toString();
    CIRCLE_NAME = json['CIRCLE_NAME'].toString();
    TODAY = json['TODAY'].toString();
    TODATE = json['TODATE'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PK_DIVISION_ID'] = this.PK_DIVISION_ID;
    data['DIVISION_NAME'] = this.DIVISION_NAME;
    data['CIRCLE_CODE'] = this.CIRCLE_CODE;
    data['CIRCLE_NAME'] = this.CIRCLE_NAME;
    data['TODAY'] = this.TODAY;
    data['TODATE'] = this.TODATE;
    return data;
  }
}

class circle extends StatefulWidget {
  const circle({Key? key}) : super(key: key);

  @override
  State<circle> createState() => _circleState();
}


class _circleState extends State<circle> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List TendNoList=[];




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

  Future<List<Report_data>> fetchResults() async {
    List<Report_data> reptlist=[];
    final SharedPreferences? prefs = await _prefs ;
    String sql="getcircledata";
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
                              columnSpacing: 70,
                              headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              columns: <DataColumn>[

                                DataColumn(label: Text("CIRCLE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),), tooltip: "To Display CIRCLE"),
                                DataColumn(label: Text("TODAY",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),), tooltip: "To Display TODAY"),
                                DataColumn(label: Text("TODATE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),), tooltip: "To Display TODATE"),
                                /*DataColumn(label: Text("Tender Status",textAlign: TextAlign.center,), tooltip: "To Display Status"),
                                DataColumn(label: Text("DO Status",textAlign: TextAlign.center,), tooltip: "To Display DOactive"),*/
                              ],
                              rows: List.generate(
                                  snapshot.data!.length,
                                      (index) {
                                    var reptlist = snapshot.data![index];
                                    return DataRow(
                                        color: reptlist.CIRCLE_NAME.toString().contains("TOTAL") ? MaterialStateProperty.all(Color(0xFFDEDDDD)): MaterialStateProperty.all(Colors.white) ,
                                        cells: [
                                          DataCell(

                                            Container(
                                             width: 70 ,

                                                child: Text(reptlist.CIRCLE_NAME.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: reptlist.CIRCLE_NAME.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white))),
                                          ),
                                          DataCell(

                                            Container(
                                                width: 76 ,
                                                child: Text(reptlist.TODAY.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),
                                          ),
                                          DataCell(
                                            Container(
                                                width: 76 ,
                                                child: Text(reptlist.TODATE.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),
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
