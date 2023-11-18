import 'package:flutter/material.dart';

import 'dart:convert';



import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class Report_data{

  String? VEHTYP_DESC;
  String? OutYardNo;
  String? BALANCE;

  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data({required this.VEHTYP_DESC, required this.OutYardNo,required this.BALANCE,});

  Report_data.fromJson(dynamic json){
    VEHTYP_DESC = json['VEHTYP_DESC'].toString();
    OutYardNo = json['OutYardNo'].toString();
    BALANCE = json['BALANCE'].toString();


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VEHTYP_DESC'] = this.VEHTYP_DESC;
    data['OutYardNo'] = this.OutYardNo;
    data['BALANCE'] = this.BALANCE;

    return data;
  }
}
class Report_data1{

  String? CURING;


  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data1({required this.CURING,});

  Report_data1.fromJson(dynamic json){
    CURING = json['CURING'].toString();



  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CURING'] = this.CURING;


    return data;
  }
}
class crushing extends StatefulWidget {
  const crushing({Key? key}) : super(key: key);

  @override
  State<crushing> createState() => _crushingState();
}

class _crushingState extends State<crushing> {
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
                FutureBuilder<List<Report_data1>>(
                  future: fetchResults1(),
                  builder: (BuildContext context, AsyncSnapshot<List<Report_data1>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting: return Text('Loading....');
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return Column(
                            children: List.generate(
                              snapshot.data!.length,
                                  (index) => Text(snapshot.data![index].CURING.toString() ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            ),
                          );
                    }
                  },
                ),
               /* FutureBuilder<List<Report_data1>>(
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

                             *//* headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),*//*
                              columns: <DataColumn>[

                                DataColumn(label: Text("",textAlign: TextAlign.center,)),


                                *//*DataColumn(label: Text("Tender Status",textAlign: TextAlign.center,), tooltip: "To Display Status"),
                                DataColumn(label: Text("DO Status",textAlign: TextAlign.center,), tooltip: "To Display DOactive"),*//*
                              ],
                              rows: List.generate(
                                  snapshot.data!.length,
                                      (index) {
                                    var reptlist = snapshot.data![index];
                                    return DataRow(
                                       // color: reptlist.VEHTYP_DESC.toString().contains("TOTAL") ? MaterialStateProperty.all(Color(0xFFDEDDDD)): MaterialStateProperty.all(Colors.white) ,
                                        cells: [
                                          DataCell(
                                            Text(reptlist.CURING.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                                          ),


                                          *//* DataCell(
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
                                          ),*//*
                                        ]);
                                  }
                              ).toList(),

                            ),

                          ],
                        ),
                      );
                    }
                ),*/

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
                              columnSpacing: 46,
                              headingRowColor:MaterialStateProperty.all(Color(
                                  0xFFDEDDDD))
                              ,
                              columns: <DataColumn>[
                               /* EEEEEE
                                MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD))*/
                                DataColumn(label: Text("VEHICLE\nTYPE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display CIRCLE"),
                                DataColumn(label: Text("VEHICLE ARRIVED\nTODAY",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODAY"),
                                DataColumn(label: Text("BALANCE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)), tooltip: "To Display TODATE"),

                                /*DataColumn(label: Text("Tender Status",textAlign: TextAlign.center,), tooltip: "To Display Status"),
                                DataColumn(label: Text("DO Status",textAlign: TextAlign.center,), tooltip: "To Display DOactive"),*/
                              ],
                              rows: List.generate(
                                  snapshot.data!.length,
                                      (index) {
                                    var reptlist = snapshot.data![index];
                                    return DataRow(
                                        color: reptlist.VEHTYP_DESC.toString().contains("TOTAL") ? MaterialStateProperty.all(Color(0xFFDEDDDD)): MaterialStateProperty.all(Colors.white) ,
                                        cells: [
                                          DataCell(

                                            Container(
                                                width: 70,
                                                child: Text(reptlist.VEHTYP_DESC.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: reptlist.VEHTYP_DESC.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white))),
                                          ),
                                          DataCell(
                                            Container(
                                                width: 50,
                                                child: Text(reptlist.OutYardNo.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),
                                          ),
                                          DataCell(
                                            Container(
                                                width: 60,
                                                child: Text(reptlist.BALANCE.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))),
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

  Future<List<Report_data>> fetchResults() async {
    List<Report_data> reptlist=[];

    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "getyarddata",
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


  Future<List<Report_data1>> fetchResults1() async {
    List<Report_data1> reptlist=[];

    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "gettodaycrush",
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



}

