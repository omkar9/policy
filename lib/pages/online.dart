import 'package:flutter/material.dart';
import 'dart:convert';



import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Report_data{

  String? SEASONDAY_DATE;
  String? CURR_SHIFT;
  String? dtime;

  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data({required this.SEASONDAY_DATE, required this.CURR_SHIFT,required this.dtime,});

  Report_data.fromJson(dynamic json){
    SEASONDAY_DATE = json['SEASONDAY_DATE'].toString();
    CURR_SHIFT = json['CURR_SHIFT'].toString();
    dtime = json['dtime'].toString();


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SEASONDAY_DATE'] = this.SEASONDAY_DATE;
    data['CURR_SHIFT'] = this.CURR_SHIFT;
    data['dtime'] = this.dtime;

    return data;
  }
}
class Report_data1{

  double? SHIFT_A;
  double? SHIFT_B;
  double? SHIFT_C;
  double? TODAY;

  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data1({required this.SHIFT_A, required this.SHIFT_B,required this.SHIFT_C,required this.TODAY});

  Report_data1.fromJson(dynamic json){
    SHIFT_A = json['SHIFT_A'];
    SHIFT_B = json['SHIFT_B'];
    SHIFT_C = json['SHIFT_C'];
    TODAY = json['TODAY'];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SHIFT_A'] = this.SHIFT_A;
    data['SHIFT_B'] = this.SHIFT_B;
    data['SHIFT_C'] = this.SHIFT_C;
    data['TODAY'] = this.TODAY;

    return data;
  }
}
class Report_data2{

  double? HOUR_1;
  double? HOUR_2;
  double? HOUR_3;
  double? HOUR_4;


  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data2({required this.HOUR_1, required this.HOUR_2,required this.HOUR_3,required this.HOUR_4,});

  Report_data2.fromJson(dynamic json){
    HOUR_1 = json['HOUR_1'];
    HOUR_2 = json['HOUR_2'];
    HOUR_3 = json['HOUR_3'];
    HOUR_4 = json['HOUR_4'];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HOUR_1'] = this.HOUR_1;
    data['HOUR_2'] = this.HOUR_2;
    data['HOUR_3'] = this.HOUR_3;
    data['HOUR_4'] = this.HOUR_4;



    return data;
  }
}
class Report_data3{


  double? HOUR_5;
  double? HOUR_6;
  double? HOUR_7;
  double? HOUR_8;

  /*String? tendno;
  String? desc;
  String? itmqty;
  String? date;
  String? status;*/

  Report_data3({ required this.HOUR_5,required this.HOUR_6,required this.HOUR_7, required this.HOUR_8,});

  Report_data3.fromJson(dynamic json){

    HOUR_5 = json['HOUR_5'];
    HOUR_6 = json['HOUR_6'];
    HOUR_7 = json['HOUR_7'];
    HOUR_8 = json['HOUR_8'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['HOUR_5'] = this.HOUR_5;
    data['HOUR_6'] = this.HOUR_6;
    data['HOUR_7'] = this.HOUR_7;
    data['HOUR_8'] = this.HOUR_8;


    return data;
  }
}

class online extends StatefulWidget {
  const online({Key? key}) : super(key: key);

  @override
  State<online> createState() => _onlineState();




}

class _onlineState extends State<online> {
  late DateTime _selectedDate=DateTime.now();
  late String? _shiftname = "";
  late DateTime? newSelectedDate=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar:
      AppBar(  title: Text('SPSCL-CC',style: TextStyle(color: Colors.white)),backgroundColor:
      Color(0xFFE2213E)
        ,centerTitle: true,),*/
      body: Column(
        children: [

          Expanded(
            flex: 3,

            child:  Row(
              children: [
              Expanded(
                flex:3,
                child: Container(
                 alignment: Alignment.center ,

                child:Column(
                  children: [
                    Expanded(
                      flex:3,
                      child: Container(
                          alignment: Alignment.center ,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all()
                          ),

                          child: FutureBuilder<String>(

                            future: fetchResults6("getdate"), // async work
                            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting: return Text('Loading....');
                                default:
                                  if (snapshot.hasError)
                                    return Text('Error: ${snapshot.error}');
                                  else
                                    //return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold),);
                                  return TextButton(onPressed: (){_LiffselectDate(context);}, child: Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),));
                              }
                            },
                          ),
                    )
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                          alignment: Alignment.center ,
                          decoration: BoxDecoration(
                             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              border: Border.all()
                          ),

                          child: Text("CROP DAY",style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                          alignment: Alignment.center ,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all()
                          ),

                          child: FutureBuilder<String>(
                            future: fetchResults6("getcrop"), // async work
                            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting: return Text('Loading....');
                                default:
                                  if (snapshot.hasError)
                                    return Text('Error: ${snapshot.error}');
                                  else
                                    return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                              }
                            },
                          ),
                    )
                    ),

                    Expanded(
                      flex:4,
                      child: Container(
                          alignment: Alignment.center ,
                          decoration: BoxDecoration(
                             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              border: Border.all()
                          ),

                          child: Text("PRE DAY/AVG",style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Expanded(
                      flex:4,
                      child: Container(
                          alignment: Alignment.center ,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all()
                          ),

                          child: Column(
                            children: [
                              FutureBuilder<double>(
                                future: fetchResults7("getpreday"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),
                              FutureBuilder<double>(
                                future: fetchResults7("getpredayavg"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),
                            ],
                          ),

                      ),
                    ),
                  ],
                )

                ),
              ),

                Expanded(
                  flex:3,
                  child: Column(
                    children: [
                      Expanded(
                        flex:3,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child:FutureBuilder<String>(
                              future: fetchResultsshift("getshiftn"), // async work
                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return TextButton(onPressed: (){_shift(context,'${snapshot.data}');}, child: Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)));
                                }
                              },
                            )

                        ),
                      ),
                      Expanded(
                        flex:12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all()
                          ),
                            alignment: Alignment.center ,

                            child:Image.asset("assets/logo.png"),

                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex:3,
                  child:Column(
                    children: [
                      Expanded(
                        flex:3,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),

                            child: FutureBuilder<String>(
                              future: fetchResults4("Select FORMAT((case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end),'hh:mm tt')dt"), // async work
                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            )),
                      ),
                      Expanded(
                        flex:2,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),

                            child: Text("TO DATE",style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      Expanded(
                        flex:2,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),

                            child: FutureBuilder<double>(
                              future: fetchResults7("getfisttodate"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            )),
                      ),

                      Expanded(
                        flex:4,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),

                            child: Text("TODATE\nCRUSHING AVG",style: TextStyle(fontWeight: FontWeight.bold)) ),
                      ),
                      Expanded(
                        flex:4,
                        child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),

                            child:
                                FutureBuilder<double>(
                                  future: fetchResults7("getfisttodate1"), // async work
                                  builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting: return Text('Loading....');
                                      default:
                                        if (snapshot.hasError)
                                          return Text('Error: ${snapshot.error}');
                                        else
                                          return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                    }
                                  },
                                ),
                                /*FutureBuilder<String>(
                                  future: fetchResults4("getfisttodate3"), // async work
                                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting: return Text('Loading....');
                                      default:
                                        if (snapshot.hasError)
                                          return Text('Error: ${snapshot.error}');
                                        else
                                          return Text('${snapshot.data}');
                                    }
                                  },
                                ),*/
                            ),
                      ),
                    ],
                  )
                ),
              ],
            ),),

SizedBox(height: 10,),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                  border: Border.all()
                              ),
                              child: Text("SHIFT A/AVG",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all()
                              ),
                              child: FutureBuilder<double>(
                                future: fetchResults7("getshift1"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all()
                              ),
                              child: FutureBuilder<double>(
                                future: fetchResults7("getshift1avg"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                 color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                  border: Border.all()
                              ),
                              child: Text("SHIFT B/AVG",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all()
                              ),
                              child: FutureBuilder<double>(
                                future: fetchResults7("getshift2"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                              alignment: Alignment.center ,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all()
                              ),
                              child: FutureBuilder<double>(
                                future: fetchResults7("getshift2avg"), // async work
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting: return Text('Loading....');
                                    default:
                                      if (snapshot.hasError)
                                        return Text('Error: ${snapshot.error}');
                                      else
                                        return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                  }
                                },
                              ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("SHIFT C/AVG",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResults7("getshift3"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResults7("getshift3avg"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
              flex:2,
              child: Container(
                child:Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(

                        alignment: Alignment.center ,
                        decoration: BoxDecoration(
                           color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                            border: Border.all()
                        ),
                        child: Text("TODAY /AVG",style: TextStyle(fontWeight: FontWeight.bold)),




                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(

                        alignment: Alignment.center ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all()
                        ),
                        child: FutureBuilder<double>(
                          future: fetchResults7("gettodayshift"), // async work
                          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting: return Text('Loading....');
                              default:
                                if (snapshot.hasError)
                                  return Text('Error: ${snapshot.error}');
                                else
                                  return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                            }
                          },
                        ),




                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(

                        alignment: Alignment.center ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all()
                        ),
                        child:  FutureBuilder<double>(
                          future: fetchResults7("getshifttoavg"), // async work
                          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting: return Text('Loading....');
                              default:
                                if (snapshot.hasError)
                                  return Text('Error: ${snapshot.error}');
                                else
                                  return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                            }
                          },
                        ),




                      ),
                    )



                  ],


                ) ,
              ),
            ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("1ST HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour1"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("5TH HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour5"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("2ND HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour22"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("6TH HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour6"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("3RD HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour3"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("7TH HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour7"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    child:Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("4TH HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour4"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                border: Border.all()
                            ),
                            child: Text("8TH HR",style: TextStyle(fontWeight: FontWeight.bold)),




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(

                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()
                            ),
                            child: FutureBuilder<double>(
                              future: fetchResultsshift7("get_ShiftHour8"), // async work
                              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return Text('Loading....');
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else
                                      return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                }
                              },
                            ),




                          ),
                        )



                      ],


                    ) ,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 4,
            child:
                Column(
                  children: [
                    Expanded(
                      flex:4,
                      child: Column(
                        children: [
                          Expanded(
                            flex:3,
                            child: Container(
                                alignment: Alignment.center ,
                                decoration: BoxDecoration(
                                   color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                    border: Border.all()
                                ),
                                child:Text("VEHICLE WISE CANE YARD BALANCE",style: TextStyle(fontWeight: FontWeight.bold))


                            ),
                          ),
                          Expanded(
                            flex:8,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TRACTOR",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults4("getyarddatatractor"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("T CART",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults4("getyarddataTCart"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TRUCK",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults4("getyarddataTruck"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TOTAL",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults4("getyarddatatotal"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      flex:2,
                      child: Row(
                        children: [
                          Expanded(
                            flex:7,
                            child: Container(
                                alignment: Alignment.center ,
                                decoration: BoxDecoration(
                                   color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                    border: Border.all()
                                ),
                                child:Text("ESTIMATED CANE YARD\nBALANCE IN MT:",style: TextStyle(fontWeight: FontWeight.bold))


                            ),
                          ),
                          Expanded(
                            flex:3,
                            child: Container(
                                alignment: Alignment.center ,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all()
                                ),
                                child:FutureBuilder<double>(
                                  future: fetchResults5("getyarddatatotalmt"), // async work
                                  builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting: return Text('Loading....');
                                      default:
                                        if (snapshot.hasError)
                                          return Text('Error: ${snapshot.error}');
                                        else
                                          return Text('${snapshot.data!.toStringAsFixed(0)}',style: TextStyle(fontWeight: FontWeight.bold));
                                    }
                                  },
                                )


                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      flex:4,
                      child: Column(
                        children: [
                          Expanded(
                            flex:3,
                            child: Container(
                                alignment: Alignment.center ,
                                decoration: BoxDecoration(
                                   color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                                    border: Border.all()
                                ),
                                child:Text("TODAY'S VEHICLE ARRIVAL",style: TextStyle(fontWeight: FontWeight.bold))


                            ),
                          ),
                          Expanded(
                            flex:8,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TRACTOR",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults6("getvtractor"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("T CART",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults6("getvtcart"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TRUCK",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults6("getvTRUCK"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    child:Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: Text("TOTAL",style: TextStyle(fontWeight: FontWeight.bold)),




                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(

                                            alignment: Alignment.center ,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()
                                            ),
                                            child: FutureBuilder<String>(
                                              future: fetchResults6("getvtotal"), // async work
                                              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                switch (snapshot.connectionState) {
                                                  case ConnectionState.waiting: return Text('Loading....');
                                                  default:
                                                    if (snapshot.hasError)
                                                      return Text('Error: ${snapshot.error}');
                                                    else
                                                      return Text('${snapshot.data}',style: TextStyle(fontWeight: FontWeight.bold));
                                                }
                                              },
                                            ),




                                          ),
                                        ),




                                      ],


                                    ) ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),

        ],
      ),
    );
  }
  _shift(BuildContext context,String shift) async {

      setState(()  {
        if(shift.compareTo('SHIFT A')==0){
          _shiftname="SHIFT B";
        }else if(_shiftname!.compareTo('SHIFT B')==0){
          _shiftname="SHIFT C";
        }
        else if(_shiftname!.compareTo('SHIFT C')==0){
          _shiftname="SHIFT A";
        }


      });
      /*_selectedDate = newSelectedDate;

        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingLiffdateController.text.length,
            affinity: TextAffinity.upstream));*/
    }

  _LiffselectDate(BuildContext context) async {
   newSelectedDate = await showDatePicker(

        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2021) ,
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Color(0xFFE2213E),
                onPrimary: Colors.white,
                surface:Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      setState(()  {
        _selectedDate = newSelectedDate!;
        _shiftname="";
      });
      /*_selectedDate = newSelectedDate;

        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingLiffdateController.text.length,
            affinity: TextAffinity.upstream));*/
    }
  }

  Future<List<Report_data>> fetchResults() async {
    List<Report_data> reptlist=[];

    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "getfirsttab ",
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
        'sqlq1': "getshiftdata ",
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

  Future<List<Report_data2>> fetchResults2() async {
    List<Report_data2> reptlist=[];

    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "get_ShiftHour ",
        'constr': "ConStringh"
      };

      //var response = await http.get(url);
      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['Table'] != null) {
          json['Table'].forEach((V){
            reptlist.add(Report_data2.fromJson(V));
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

  Future<List<Report_data3>> fetchResults3() async {
    List<Report_data3> reptlist=[];

    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "get_ShiftHour2 ",
        'constr': "ConStringh"
      };

      //var response = await http.get(url);
      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['Table'] != null) {
          json['Table'].forEach((V){
            reptlist.add(Report_data3.fromJson(V));
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


  Future<String> fetchResults6( String sql) async {
    String datad="";


    final SharedPreferences? prefs = await _prefs ;
    if(prefs?.getString('_selectedDate')==null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(newSelectedDate!=null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }

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

  Future<String> fetchResultsshift( String sql) async {
    String datad="";


    final SharedPreferences? prefs = await _prefs ;
    if(prefs?.getString('_shiftname')==null  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }
    if(prefs?.getString('_selectedDate')==null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(newSelectedDate!=null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(_shiftname!=""  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }

    String? datedt=     prefs?.getString('_selectedDate');
    String? datedt1=     prefs?.getString('_shiftname');
    sql=sql +(datedt==null?"":" '" +datedt! +"'")+(datedt1==""?"":", '" +datedt1! +"'");
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
            _shiftname=datad;
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

  Future<String> fetchResultsshift1( String sql) async {
    String datad="";


    final SharedPreferences? prefs = await _prefs ;
    if(prefs?.getString('_shiftname')==null  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }
    if(prefs?.getString('_selectedDate')==null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(newSelectedDate!=null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(_shiftname!=""  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }

    String? datedt=     prefs?.getString('_selectedDate');
    String? datedt1=     prefs?.getString('_shiftname');
    sql=sql +(datedt==null?"":" '" +datedt! +"'")+(datedt1==""?"":", '" +datedt1! +"'");
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
  Future<String> fetchResults4( String sql) async {
    String datad="";

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

  Future<double> fetchResults5( String sql) async {
    double datad=0;

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
            datad= V["dt"];
        // datad=dddd.toStringAsFixed(0);
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

  Future<double> fetchResults7( String sql) async {
    double datad=0;
    final SharedPreferences? prefs = await _prefs ;
    if(prefs?.getString('_selectedDate')==null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(newSelectedDate!=null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }

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
            datad= V["dt"];
            // datad=dddd.toStringAsFixed(0);
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

  Future<double> fetchResultsshift7( String sql) async {
    double datad=0;
    final SharedPreferences? prefs = await _prefs ;
    if(prefs?.getString('_shiftname')==null  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }
    if(prefs?.getString('_selectedDate')==null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(newSelectedDate!=null  ) {
      await prefs?.setString('_selectedDate', _selectedDate.toString());
    }
    if(_shiftname!=""  ) {
      await prefs?.setString('_shiftname', _shiftname.toString());
    }

    String? datedt=     prefs?.getString('_selectedDate');
    String? datedt1=     prefs?.getString('_shiftname');
    sql=sql +(datedt==null?"":" '" +datedt! +"'")+(datedt1==""?"":", '" +datedt1! +"'");
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
            datad= V["dt"];
            // datad=dddd.toStringAsFixed(0);
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
}
