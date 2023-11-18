import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../DOPage.dart';
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
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
      Get.off(DOPage());;
    });
  }



  Future<List<Report_data>> fetchResults() async {
    List<Report_data> reptlist=[];
    final SharedPreferences? prefs = await _prefs;
    Object? custid=prefs?.get('Custid');
    try{

      var url = Uri.http(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "SELECT PK_CVER_ID ,CVER_CODE,CVER_DESC \n" +
            ",round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.FK_CVER_ID = PK_CVER_ID AND A.SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3) AS TODAY \n" +
            ",round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.FK_CVER_ID = PK_CVER_ID AND A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3)  AS TODATE\n" +
            ",round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.FK_CVER_ID = PK_CVER_ID AND A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0))*100,2)    as [PERCENTAGE],  0 as sr\n" +
            "FROM   AGRI_CVER_MST AS D   \n" +
            "WHERE ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.FK_CVER_ID = PK_CVER_ID AND A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0) >0 \n" +
            "union all SELECT max(PK_CVER_ID) ,'TOTAL' as CVER_CODE, 'TOTAL' as CVER_DESC \n" +
            ",round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3) AS TODAY \n" +
            ",round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE  A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3)  AS TODATE,(round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3)/round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0),3))*100    as [PERCENTAGE],\n" +
            "1 as sr\n" +
            "FROM   AGRI_CVER_MST AS D   \n" +
            "WHERE ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN AS A   WHERE A.FK_CVER_ID = PK_CVER_ID AND A.SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end))),0) >0\n" +
            "ORDER BY PK_CVER_ID ,sr, CVER_CODE ",
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
        'sqlq1': "SELECT '00 TO 10' AS DISTANCE , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE <=10),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE <=10),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE <=10),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)   as [PERCENTAGE],   0 as sr \n" +
            "UNION\n" +
            "SELECT '11 TO 20' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 11 AND 20),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 11 AND 20),0),3) AS TODATE   ,round(( ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 11 AND 20),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)   as [PERCENTAGE],   0 as sr \n" +
            "UNION\n" +
            "SELECT '21 TO 30' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 21 AND 30),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 21 AND 30),0),3) AS TODATE ,round( (ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 21 AND 30),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE],   0 as sr \n" +
            "UNION\n" +
            "SELECT '31 TO 40' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 31 AND 40),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 31 AND 40),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 31 AND 40),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE] ,0 as sr \n" +
            "UNION\n" +
            "SELECT '41 TO 50' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 41 AND 50),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 41 AND 50),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 41 AND 50),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE],0 as sr \n" +
            "UNION\n" +
            "SELECT '51 TO 60' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 51 AND 60),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 51 AND 60),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 51 AND 60),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE],0 as sr \n" +
            "UNION\n" +
            "SELECT '61 TO 70' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 61 AND 70),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 61 AND 70),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 61 AND 70),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)   as [PERCENTAGE],   0 as sr \n" +
            "UNION\n" +
            "SELECT '71 TO 80' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 71 AND 80),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 71 AND 80),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 71 AND 80),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2) as [PERCENTAGE] ,0 as sr \n" +
            "UNION\n" +
            "SELECT '81 TO 90' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 81 AND 90),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 81 AND 90),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 81 AND 90),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2) as [PERCENTAGE],0 as sr \n" +
            "UNION\n" +
            "SELECT '91 TO 100' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 91 AND 100),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 91 AND 100),0),3) AS TODATE ,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE BETWEEN 91 AND 100),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2) as [PERCENTAGE],0 as sr \n" +
            "UNION\n" +
            "SELECT 'ABOVE 100' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE > 100),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE > 100),0),3) AS TODATE  ,round( (ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) AND  SLIP_DISTANCE > 100),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE],   0 as sr \n" +
            "UNION\n" +
            "SELECT 'TOTAL' , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE =convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0),3) AS TODAY , round(ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0),3) AS TODATE,round((ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0)/ISNULL((SELECT SUM(SLIP_ACT_FAR_WT)  FROM WB_SLIP_TRN WHERE SLIP_TARE_WT_DATE <=convert(date,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end)) ),0))*100,2)  as [PERCENTAGE],   1 as sr \n"
        ,
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
      appBar:
      AppBar(  title: Text('SPSCL-CC',style: TextStyle(color: Colors.white)),backgroundColor:
    Color(0xFFE2213E)
    ,centerTitle: true,),
      body: SingleChildScrollView(
          scrollDirection:Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              Container(
               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                child: Column(

                  children: [
                    Text('VARIETY WISE CANE CRUSHING INFORMATION FOR ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text('CURRENT DATE ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                            headingRowColor:
                            MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                              columns: <DataColumn>[

                                DataColumn(label: Text("VARIETY",textAlign: TextAlign.center,), tooltip: "To Display CIRCLE"),
                                DataColumn(label: Text("TODAY",textAlign: TextAlign.center,), tooltip: "To Display TODAY"),
                                DataColumn(label: Text("TODATE",textAlign: TextAlign.center,), tooltip: "To Display TODATE"),
                                DataColumn(label: Text("PERCENTAGE",textAlign: TextAlign.center,), tooltip: "To Display PERCENTAGE"),
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

                                            Text(reptlist.CVER_DESC.toString(),textAlign: TextAlign.center,style: TextStyle(backgroundColor: reptlist.CVER_DESC.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white)),
                                          ),
                                          DataCell(
                                            Text(reptlist.TODAY!.toStringAsFixed(3),textAlign: TextAlign.center),
                                          ),
                                          DataCell(
                                            Text(reptlist.TODATE!.toStringAsFixed(3),textAlign: TextAlign.center),
                                          ),
                                          DataCell(
                                            Text(reptlist.PERCENTAGE!.toStringAsFixed(2),textAlign: TextAlign.center),
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
             SizedBox(height: 10,),
              Container(
               color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                child: Column(

                  children: [
                    Text('DISTANCE WISE CANE CRUSHING INFORMATION FOR ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text('CURRENT DATE ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                            headingRowColor:
                            MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)),
                            columns: <DataColumn>[

                              DataColumn(label: Text("DISTANCE",textAlign: TextAlign.center,), tooltip: "To Display CIRCLE"),
                              DataColumn(label: Text("TODAY",textAlign: TextAlign.center,), tooltip: "To Display TODAY"),
                              DataColumn(label: Text("TODATE",textAlign: TextAlign.center,), tooltip: "To Display TODATE"),
                              DataColumn(label: Text("PERCENTAGE",textAlign: TextAlign.center,), tooltip: "To Display PERCENTAGE"),
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

                                          Text(reptlist.DISTANCE.toString(),textAlign: TextAlign.center,style: TextStyle(backgroundColor: reptlist.DISTANCE.toString().contains("TOTAL") ? MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)): Colors.white)),
                                        ),
                                        DataCell(
                                          Text(reptlist.TODAY!.toStringAsFixed(3),textAlign: TextAlign.center),
                                        ),
                                        DataCell(
                                          Text(reptlist.TODATE!.toStringAsFixed(3),textAlign: TextAlign.center),
                                        ),
                                        DataCell(
                                          Text(reptlist.PERCENTAGE!.toStringAsFixed(2),textAlign: TextAlign.center),
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
