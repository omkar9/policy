
import 'package:api_app/screens/auth/DoCustDataFile.dart';
import 'package:api_app/screens/auth/DoDataFile.dart';
import 'dart:convert';


import 'package:api_app/controllers/login_controller.dart';
import 'package:api_app/controllers/tender_controller.dart';
import 'package:api_app/screens/auth/widgets/input_fields.dart';
import 'package:api_app/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoints.dart';
import '../../screens/auth/data1.dart';

import 'package:intl/intl.dart';

import 'User.dart';

/*class DOUsr{
  String tendno;
  String itmCode;
  String itmNm;
  String custNm;
  String tendtyp;
  String refDate;
  String sancDate;
  String tendQty;
  String sancQty;
  String rate;
  String CustCode;
  String CustNM;

  DOUsr({required this.tendno,required this.itmCode, required this.itmNm,required this.custNm,required this.tendtyp,required this.refDate,required this.sancDate,required this.tendQty,required this.sancQty,required this.rate,required this.CustCode,required this.CustNM});
}*/


class DOPage extends StatefulWidget {
  const DOPage({Key? key}) : super(key: key);

  @override
  State<DOPage> createState() => _DOPageState();
}

class _DOPageState extends State<DOPage> {
  String _selectDate="";

  TextEditingController QtlsController = TextEditingController();
  TextEditingController BagsController = TextEditingController();
  TextEditingController AmtController = TextEditingController();

  final TextEditingController _typeAheadTendNoController=TextEditingController();
  final TextEditingController _typeAheadCustCodeController = TextEditingController();
  final TextEditingController _typeAheadCustBuyerCodeController = TextEditingController();
  SuggestionsBoxController sgestboxTendNoController= SuggestionsBoxController();
  SuggestionsBoxController sgestboxCustNoController = SuggestionsBoxController();
  SuggestionsBoxController sgestboxCustBuyerController = SuggestionsBoxController();
  final TextEditingController _VehicleNoController = TextEditingController();
  final TextEditingController _DOQtyController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _textEditingLiffdateController = TextEditingController();
  tender_controller tenderController =
  Get.put(tender_controller());

  late DateTime _selectedDate=DateTime.now();
  String _selectedTendNo="";
  String _selectedCustNo = "";
  String _selectedCustBuyerNo="";

  String _Qtls="";
  String _Bags = "";
  String _Amt = "";
  List<dynamic> item=[""];
  List<dynamic> Custitem=[""];
  List<dynamic> Tend_no_list=[""];
  List<dynamic> Cust_no_list=[""];
  List<dynamic> Cust_Buyer_list=[""];
  List<dynamic> Billtyp_list=[""];
  List<dynamic> Bal_list=[""];

  // List<dynamic> Cust_Bank_list=[""];

  var _formkey = GlobalKey<FormState>();
  String onchangeval = "";
  List<User> DOUsr = [];
  @override
  void initState() {
    // TODO: implement initState
    //loginWithEmail();

    DOList();
    CustFetchData();
    _typeAheadTendNoController.clear();
    _typeAheadCustCodeController.clear();
    _typeAheadCustBuyerCodeController.clear();
    tenderController.TendNoController.clear();
    tenderController.RefDateController.clear();
    tenderController.SancDateController.clear();
    tenderController.TendQtyController.clear();
    tenderController.SancQtyController.clear();
    tenderController.RateController.clear();
    tenderController.DOQtyController.clear();
    tenderController.LiffDateController.clear();
    tenderController.ItmNmController.clear();
    tenderController.TENDTYP_DESC_Controller.clear();
    tenderController.ItmCodeController.clear();
    tenderController.Tend_CustNm_Controller.clear();
    tenderController.Tend_CustCode_Controller.clear();
    tenderController.CustNm_Controller.clear();
    tenderController.CustAddress_Controller.clear();
    _textEditingLiffdateController.clear();
    super.initState();
  }

  Future<void> DOList() async {
    final SharedPreferences? prefs = await _prefs;
    Object? custid=prefs?.get('Custid');
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "SELECT DISTINCT TOP 100 PERCENT ST_TEND_TRN.PK_TEND_TRN_ID, ST_TEND_TRN.TEND_SR_NO, ST_TENDTYP_MST.TENDTYP_DESC, ST_TENDTYP_MST.TENDTYP_DEV_DESC, ST_TEND_MST.TEND_NO, ST_ITM_MST.ITM_DESC, ST_ITM_MST.ITM_DEV_DESC, ST_TEND_TRN.TEND_QTY, ST_TEND_TRN.TEND_QTY_QTLS, (ST_TEND_TRN.TEND_QTY - (ST_TEND_TRN.TEND_DO_QTY + ST_TEND_TRN.TEND_CLOSE_QTY + ST_TEND_TRN.TEND_TRANSF_QTY))  AS BAL_QTY , ST_TEND_TRN.TEND_RATE \n" +
            ",(ST_TEND_TRN.TEND_SANC_QTY - (ST_TEND_TRN.TEND_CLOSE_QTY + ST_TEND_TRN.TEND_TRANSF_QTY + ST_TEND_TRN.TEND_DO_QTY )) as TEND_SANC_QTY,CONVERT(DATE, ST_TEND_MST.TEND_DATE)TEND_DATE,CONVERT(DATE, ST_TEND_trn.TEND_SANC_DATE)TEND_SANC_DATE,ST_ITM_MST.ITM_CODE,ST_TEND_trn.TEND_SANC_RATE,ST_CUST_MST.CUST_NAME,ST_CUST_MST.CUST_CD FROM ST_TEND_MST\n" +
            "INNER JOIN ST_TEND_TRN ON ST_TEND_MST.PK_TEND_ID = ST_TEND_TRN.FK_TEND_ID \n" +
            "INNER JOIN ST_TENDTYP_MST ON ST_TEND_MST.FK_TENDTYP_ID = ST_TENDTYP_MST.PK_TENDTYP_ID \n" +
            "INNER JOIN ST_ITM_MST ON ST_TEND_TRN.FK_ITM_ID = ST_ITM_MST.PK_ITM_ID\n" +
            "inner join ST_CUST_MST on ST_TEND_TRN.FK_CUST_ID=ST_CUST_MST.PK_CUST_ID\n" +
            "WHERE    (ST_TEND_MST.FK_FAYR <= 4)\n" +
            " AND ST_TEND_MST.FK_TENDTYP_ID IN (1,2,3)\n" +
            " AND (ST_TEND_TRN.FK_CUST_ID = "+custid.toString()+")\n" +
            " AND (ST_TEND_TRN.TEND_SANC_QTY - (ST_TEND_TRN.TEND_CLOSE_QTY + ST_TEND_TRN.TEND_TRANSF_QTY + ST_TEND_TRN.TEND_DO_QTY ) > 0)\n" +
            "ORDER BY [TEND_NO]",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;

        if (json['Table'] != null) {
          Tend_no_list=json['Table'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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
  }

  Future<void> CustFetchData() async {
    final SharedPreferences? prefs = await _prefs;
    //Object? custid=prefs?.get('Custid');
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "select Distinct ST_CUST_DELV_ADDRESS.PK_DELV_SRNO,ST_CUST_MST.CUST_CD,ST_CUST_MST.CUST_CD+' - '+ST_CUST_MST.CUST_NAME as CUST_NAME,ST_CUST_DELV_ADDRESS.DELV_ADDRESS,ST_CUST_DELV_ADDRESS.DELV_CITY, ST_CUST_DELV_ADDRESS.DELV_STATE,\n" +
            "ST_CUST_DELV_ADDRESS.DELV_COUNTRY\n" +
            "from ST_CUST_MST inner join ST_CUST_DELV_ADDRESS on ST_CUST_MST.PK_CUST_ID = ST_CUST_DELV_ADDRESS.FK_CUST_ID\n" +
            "ORDER BY [CUST_NAME]",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;

        if (json['Table'] != null) {
          Cust_no_list=json['Table'];

        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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
  }

  Future<void> CustFetchData1(String id) async {
    final SharedPreferences? prefs = await _prefs;
    //Object? custid=prefs?.get('Custid');
    final SharedPreferences? prefs1 = await _prefs;
    Object? custid=prefs1?.get('Custid');
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "select Distinct ST_CUST_DELV_ADDRESS.PK_DELV_SRNO,ST_CUST_MST.CUST_CD,ST_CUST_MST.CUST_CD+' - '+ST_CUST_MST.CUST_NAME as CUST_NAME,ST_CUST_DELV_ADDRESS.DELV_ADDRESS,ST_CUST_DELV_ADDRESS.DELV_CITY, ST_CUST_DELV_ADDRESS.DELV_STATE,\n" +
            "ST_CUST_DELV_ADDRESS.DELV_COUNTRY\n" +
            "from ST_CUST_MST inner join ST_CUST_DELV_ADDRESS on ST_CUST_MST.PK_CUST_ID = ST_CUST_DELV_ADDRESS.FK_CUST_ID\n" +
            "  Where   ST_CUST_MST.CUST_CD in (" + id.toString() + "," + custid.toString() + ")    ORDER BY [CUST_NAME]",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;

        if (json['Table'] != null) {

          Cust_Buyer_list=json['Table'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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
  }

  Future <void> SaveDOrec() async{

    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      int tendnoid=0;
      var custtoid;
      var custbroid;
      final SharedPreferences? prefs = await _prefs;
      Object? custid=prefs?.get('Custid');


      Tend_no_list.forEach((v) async {
        if(v['TEND_NO'].toString()==_typeAheadTendNoController.text){
          setState(() {
            tendnoid= v['PK_TEND_TRN_ID'];


          });

        };
      });
      Cust_no_list.forEach((vc) async {
        if(vc['CUST_NAME'].toString()==_typeAheadCustCodeController.text){
          setState(() {
            custbroid= vc['CUST_CD'].toString();


          });

        };
      });

      Cust_Buyer_list.forEach((vc1) async {
        if(vc1['CUST_NAME'].toString()==_typeAheadCustBuyerCodeController.text){
          setState(() {
            custtoid= vc1['CUST_CD'].toString();


          });

        };
      });

      String sql="INSERT INTO MOB_DO_TRN( FK_TEND_TRN_ID,  " +
          "FK_CUST_ID_BUYER,  " +
          "FK_CUST_ID,  " +
          "FK_SEASON_ID,  " +
          "FK_ITM_ID, " +
          "DO_QTY,  " +
          "LIFT_DATE," +
          "VEHICAL_NO )" +
          "VALUES("+tendnoid.toString()+"," +
          ""+custtoid.toString()+"," +
          ""+custid.toString()+"," +
          "(select FK_SEASON_ID from ST_TEND_TRN where PK_TEND_TRN_ID="+tendnoid.toString()+")," +
          "(select PK_ITM_ID from ST_ITM_MST where ITM_CODE="+tenderController.ItmCodeController.text.toString()+"),"+
          ""+_DOQtyController.text.toString()+"," +
          "convert(DATE,'"+_textEditingLiffdateController.text.toString()+"',103)," +
          "'"+_VehicleNoController.text.toString()+"') "+
          "  " +
          "     insert into ST_DO_TRN(FK_FAYR," +
          "FK_TEND_TRN_ID," +
          "DO_NO," +
          "DO_DATE,"+
          "FK_CUST_ID," +
          "DO_REF_NO,"+
          "DO_REF_DATE,"+
          "DO_QTY," +
          "DO_DISP_QTY,"+
          "DO_RMK,"+
          "CR_DATE,"+
          "CR_LOGIN,"+
          "DELV_ADDRESS_NO,"+
          "DO_RATE,"+
          "FK_ITM_ID," +
          "DO_SEASON," +
          "VEHICAL_NO," +
          "FK_BROKER_ID," +
          "FK_CUST_TO_ID," +
          "BANK_NAME," +
          "FK_INST_TYPE_ID)" +
          "values((select max(PK_FAYR) as PK_FAYR from SYS_YEAR)," +
          ""+tendnoid.toString()+"," +
          "(select MAX(DO_NO)+1 as do_no from ST_DO_TRN where FK_FAYR =(select max(PK_FAYR) as PK_FAYR from SYS_YEAR))," +
          "convert(DATE,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end),103),"+
          ""+custbroid.toString()+"," +
          "(select MAX(DO_NO)+1 as do_no from ST_DO_TRN where FK_FAYR =(select max(PK_FAYR) as PK_FAYR from SYS_YEAR))," +
          "(select CONVERT(varchar(10),(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end),103)),"+
          ""+_DOQtyController.text.toString()+"," +
          "0," +
          "'SALE',"+
          "convert(DATE,(case when  CONVERT(VARCHAR(5),getdate(),108) between '00:00'And '04:59' then DATEADD(Day,-1,SYSDATETIME()) else SYSDATETIME()end),103),"+
          "'mob',"+
          "1," +
          "'"+tenderController.RateController.text.toString()+"'," +
          "(select PK_ITM_ID from ST_ITM_MST where ITM_CODE="+tenderController.ItmCodeController.text.toString()+")," +
          "(select FK_SEASON_ID from ST_TEND_TRN where PK_TEND_TRN_ID="+tendnoid.toString()+")," +
          "'"+_VehicleNoController.text.toString()+"'," +
          ""+custid.toString()+"," +
          ""+custtoid.toString()+"," +
          "''," +
          "3)"+

          " UPDATE ST_TEND_TRN SET TEND_DO_QTY =ISNULL( TEND_DO_QTY ,0)+("+_DOQtyController.text.toString()+") WHERE PK_TEND_TRN_ID="+tendnoid.toString()+""+
          // st.executeUpdate(sql_1);

          " select MAX(DO_NO) as do_no from ST_DO_TRN where FK_FAYR  in (SELECT max(PK_FAYR) from SYS_YEAR) and FK_BROKER_ID="+custid.toString()+"";






      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1':sql ,

        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;

        if (json['Table'] != null) {

          json['Table']..forEach((v6) async {

            token= v6['do_no'];
          });



          showDialog(
              context: Get.context!,
              builder: (context) {
                return SimpleDialog(
                  title: Text('Delivery Order Information'),
                  contentPadding: EdgeInsets.all(20),
                  children: [Text('Delivery order is successfully save.\nYour Delivery Order No : '+token.toString()),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      setState((){

                        ClearAll();
                      });

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

        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }



    } catch (error) {

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
  }




  Future<void> BillTypFunc() async{

    /*final SharedPreferences? prefs = await _prefs;
    Object? custid=prefs?.get('Custid');*/
    int tendnoid=0;
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);

      Tend_no_list.forEach((v) async {
        if(v['TEND_NO'].toString()==_typeAheadTendNoController.text){
          setState(() {
            tendnoid= v['PK_TEND_TRN_ID'];


          });

        };
      });
      Map body = {
        'sqlq1': "SELECT TOP 1 SYS_PURSAL_BILLTYP_MST.PK_BILLTYP_ID "+
            "FROM ST_TEND_TRN"+
            "INNER JOIN ST_TEND_MST ON ST_TEND_TRN.FK_TEND_ID = ST_TEND_MST.PK_TEND_ID"+
            "INNER JOIN ST_TENDTYP_MST ON ST_TEND_MST.FK_TENDTYP_ID = ST_TENDTYP_MST.PK_TENDTYP_ID"+
            "INNER JOIN  ST_TRANS_RELEASE_TRN ON ST_TENDTYP_MST.PK_TENDTYP_ID = ST_TRANS_RELEASE_TRN.FK_TENDTYP_ID"+
            "INNER JOIN ST_TRANS_MST ON ST_TRANS_RELEASE_TRN.FK_TRANS_ID = ST_TRANS_MST.PK_TRANS_ID"+
            "INNER JOIN SYS_PURSAL_RELEASE_BILL_TRN ON ST_TRANS_MST.PK_TRANS_ID = SYS_PURSAL_RELEASE_BILL_TRN.FK_TRANS_ID"+
            "INNER JOIN  SYS_PURSAL_BILLTYP_MST ON SYS_PURSAL_RELEASE_BILL_TRN.FK_BILLTYP_ID = SYS_PURSAL_BILLTYP_MST.PK_BILLTYP_ID"+
            "WHERE(ST_TEND_TRN.PK_TEND_TRN_ID = "+tendnoid.toString()+")",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;

        if (json['Table'] != null) {
          Billtyp_list=json['Table'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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


  }

  Future <void> BalanceCheck() async{
    int tendnoid=0;
    int billtypid=0;
    var custtoid;
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);

      Tend_no_list.forEach((v) async {
        if(v['TEND_NO'].toString()==_typeAheadTendNoController.text){
          setState(() {
            tendnoid= v['PK_TEND_TRN_ID'];


          });

        };
      });

      Cust_Buyer_list.forEach((vc1) async {
        if(vc1['CUST_NAME'].toString()==_typeAheadCustBuyerCodeController.text){
          setState(() {
            custtoid= vc1['CUST_CD'].toString();


          });

        };
      });

      Map body = {
        'sqlq1': "SELECT (ACC_AC_OPBAL.AC_OPBAL_DB + ACC_AC_OPBAL.AC_CLOSE_DB) - (ACC_AC_OPBAL.AC_OPBAL_CR + ACC_AC_OPBAL.AC_CLOSE_CR) AS BALANCE,"+
            "CASE WHEN (ACC_AC_OPBAL.AC_OPBAL_DB + ACC_AC_OPBAL.AC_CLOSE_DB) - (ACC_AC_OPBAL.AC_OPBAL_CR + ACC_AC_OPBAL.AC_CLOSE_CR) > 0 THEN 'Dr'"+
            "ELSE 'Cr' END AS DRCR"+
            "FROM ST_CUST_MST"+
            "INNER JOIN SHR_MEMB_MST ON ST_CUST_MST.FK_MEMB_ID = SHR_MEMB_MST.PK_MEMB_ID"+
            "INNER JOIN ACC_AC_MST ON SHR_MEMB_MST.PK_MEMB_ID = ACC_AC_MST.FK_MEMB_ID"+
            "INNER JOIN ACC_AC_OPBAL ON ACC_AC_MST.PK_AC_CD = ACC_AC_OPBAL.FK_AC_CD"+
            "WHERE (ACC_AC_OPBAL.FK_FAYR in (SELECT TOP 1 PERCENT PK_FAYR FROM SYS_YEAR ORDER BY PK_FAYR DESC))"+
            "AND (ST_CUST_MST.PK_CUST_ID= "+ custtoid.toString()+")"+
            "AND ACC_AC_OPBAL.FK_GLPL_CD in"+
            "(SELECT ACC_GLPL_MST.PK_GLPL_CD FROM ACC_GLPL_MST"+
            "INNER JOIN ACC_SCH_MST ON ACC_GLPL_MST.FK_SCH_CD = ACC_SCH_MST.PK_SCH_CD"+
            "AND ACC_GLPL_MST.FK_SCH_CD = ACC_SCH_MST.PK_SCH_CD WHERE (ACC_SCH_MST.SCH_TYPE IN ('A')"+
            ")"+
            ")"+
            "",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {'Content-Type':'application/json','Access-Control-Allow-Origin': '*','Accept':'application/json'} );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;
        if (json['Table'] != null) {
          Bal_list=json['Table'];
        }

      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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


  }

  void ClearAll(){
    setState(() {
      DOUsr.clear();
      Custitem.clear();
     // Tend_no_list.clear();
      Cust_no_list.clear();
      Cust_Buyer_list.clear();
      _typeAheadTendNoController.clear();
      _typeAheadCustCodeController.clear();
      _typeAheadCustBuyerCodeController.clear();
      tenderController.TendNoController.clear();
      tenderController.RefDateController.clear();
      tenderController.SancDateController.clear();
      tenderController.TendQtyController.clear();
      tenderController.SancQtyController.clear();
      tenderController.RateController.clear();
      tenderController.DOQtyController.clear();
      tenderController.LiffDateController.clear();
      tenderController.ItmNmController.clear();
      tenderController.TENDTYP_DESC_Controller.clear();
      tenderController.ItmCodeController.clear();
      tenderController.Tend_CustNm_Controller.clear();
      tenderController.Tend_CustCode_Controller.clear();
      tenderController.CustNm_Controller.clear();
      tenderController.CustAddress_Controller.clear();
      _textEditingLiffdateController.clear();
      QtlsController.clear();
      BagsController.clear();
      AmtController.clear();
      _DOQtyController.clear();
      _VehicleNoController.clear();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  title: Text('Delivery Order',style: TextStyle(color: Colors.white)),backgroundColor:
      Color(0xFFE2213E)
        ,centerTitle: true,),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                width: 700,
                child: Column(
                  children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tender No",style: TextStyle(fontSize: 18),),
                                  SizedBox(width: 1,),
                                  Text('*',style: TextStyle(fontSize: 12,color: Colors.red),)
                                ],
                              ),

                              Container(
                                width: 250,
                                child: TypeAheadFormField(
                                  textFieldConfiguration: TextFieldConfiguration(
                                    decoration: InputDecoration(
                                      //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                                        hintText: 'Select Tender No',labelStyle: TextStyle(fontSize: 12),
                                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)) ),
                                    controller: this._typeAheadTendNoController,
                                  ),
                                  suggestionsCallback: (pattern) {

                                    return TenderNo.getSuggestions(pattern,Tend_no_list);

                                  },
                                  itemBuilder: (context, String suggestion) {
                                    return ListTile(
                                      title: Text(suggestion),
                                    );
                                  },
                                  transitionBuilder: (context, suggestionsBox, controller) {
                                    return suggestionsBox;
                                  },

                                  onSuggestionSelected: (String suggestion) {
                                    this._typeAheadTendNoController.text = suggestion;

                                    Tend_no_list.forEach((tn) async {
                                      try{
                                        if(tn['TEND_NO'].toString()==suggestion){
                                          setState(() {
                                            tenderController.TendNoController.text=tn['TEND_NO'];
                                            tenderController.ItmCodeController.text=tn['ITM_CODE'];
                                            tenderController.ItmNmController.text=tn['ITM_DEV_DESC'];
                                            tenderController.TENDTYP_DESC_Controller.text=tn['TENDTYP_DESC'];
                                            tenderController.RefDateController.text=tn['TEND_DATE'];
                                            tenderController.SancDateController.text=tn['TEND_SANC_DATE'];
                                            tenderController.RateController.text=tn['TEND_SANC_RATE'].toString();
                                            tenderController.TendQtyController.text=tn['TEND_QTY'].toString();
                                            tenderController.SancQtyController.text=tn['TEND_SANC_QTY'].toString();
                                            tenderController.Tend_CustCode_Controller.text=tn['CUST_CD'].toString();
                                            tenderController.Tend_CustNm_Controller.text=tn['CUST_NAME'].toString();

                                            /*.text=tn[''];
                                     tenderController.BagsController.text=tn[''];
                                     tenderController.AmtController.text=tn['TEND_SANC_RATE'];*/

                                          });
                                        }
                                      }
                                      catch(ex){
                                        print(ex);
                                      }

                                    });

                                    //DOList();
                                  },
                                  suggestionsBoxController: sgestboxTendNoController,
                                  validator: (value) => value!.isEmpty ? 'Please select a tender no' : null,
                                  onSaved: (value) => this._selectedTendNo = value!,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 60,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 350,
                                  child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child:Column(

                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,

                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Tender Type",style:TextStyle(fontSize: 18)),
                                              ],
                                            ),
                                            SizedBox(height: 8,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(tenderController.TENDTYP_DESC_Controller.text,style:TextStyle(fontSize: 18,fontFamily: "ROBOTO") ,),
                                              ],
                                            ),

                                          ]
                                      )
                                  ),
                              )

                            ],
                          )

                        ],
                      ),


                //SizedBox(height: 8,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Container(
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : ",style:TextStyle(fontSize: 25)),
                                SizedBox(width: 10,),
                                Text(tenderController.Tend_CustNm_Controller.text,style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "ROBOTO") ,),
                              ],
                            ),
                            //SizedBox(height: 10,),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Item Code",style: TextStyle(fontSize: 15),),
                                          SizedBox(width: 1,),

                                        ],
                                      ),
                                      //SizedBox(height: 10,),
                                      Container(
                                        child: Text(tenderController.ItmCodeController.text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "ROBOTO"),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Item Name",style: TextStyle(fontSize: 15),),
                                          SizedBox(width: 1,),

                                        ],
                                      ),
                                      //SizedBox(height: 10,),
                                      Container(
                                        child: Text(tenderController.ItmNmController.text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "ROBOTO"),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ref.Date : ",style:TextStyle(fontSize: 15)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tenderController.RefDateController.text,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "ROBOTO") ,),
                                  ],
                                ),


                              ],
                            ),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sanc. Date : ",style:TextStyle(fontSize: 15)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tenderController.SancDateController.text,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "ROBOTO") ,),
                                  ],
                                ),

                                /*Text("Sanc. Date : ",style:TextStyle(fontSize: 15)),
                                SizedBox(width: 10,),
                                Text(tenderController.SancDateController.text,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "ROBOTO") ,),*/
                            ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),

                Column(
                    children: [
                     Row(
                        children: [


                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Tender Qty in Qtls",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              //padding: const EdgeInsets.all(8),
                                            ),
                                            Container(
                                              child: Text(
                                                "${tenderController.TendQtyController.text}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 30,),
                                        VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                        SizedBox(width: 10,),



                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Sanction Qty in Qtls",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              //padding: const EdgeInsets.all(8),
                                            ),
                                            Container(
                                              child: Text(
                                                "${tenderController.SancQtyController.text}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                        SizedBox(width: 10,),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Rate",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              //padding: const EdgeInsets.all(8),
                                            ),
                                            Container(
                                              child: Text(
                                                "${tenderController.RateController.text}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                        SizedBox(width: 10,),




                                      ],
                                    ),
                                  ),




                                  /*Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Text("Student"),
                padding: const EdgeInsets.all(12),
              )*/





                         /* Expanded(child: getCardItem("Tender Qty","${tenderController.TendQtyController.text}" )),
                          Expanded(child: getCardItem("Sanction Qty","${tenderController.SancQtyController.text}" )),
                          Expanded(child: getCardItem("Rate","${tenderController.RateController.text}" )),*/
                        ],
                      ),
                      SizedBox(height: 10,),
                      /*Row(
                        children: [
                          Expanded(child: getCardItem("Customer Code","${tenderController.Tend_CustCode_Controller.text}" )),
                          Expanded(child: getCardItem("Customer Name","${tenderController.Tend_CustNm_Controller.text}" )),
                        ],
                      ),
                      SizedBox(height: 10,),*/
                    ],
                  ) ,

                  ],
                ),
              ),
              SizedBox(height: 10,),
              /*Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Item Code',
                              hintText: 'Item Code',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.ItmCodeController,),

                        *//*Row(
                          children: [
                            Expanded(
                              child:getCardItem("Item Code", "${tenderController.ItmCodeController.text}"),
                            ),
                            Expanded(
                              child:getCardItem("Item Name", "${tenderController.ItmNmController.text}"),
                            ),
                            Expanded(child: getCardItem("Tender Type","${tenderController.TENDTYP_DESC_Controller.text}" )),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(child: getCardItem("Ref Date","${tenderController.RefDateController.text}" )),
                            Expanded(child: getCardItem("Sanction Date","${tenderController.SancDateController.text}" )),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(child: getCardItem("Tender Qty","${tenderController.TendQtyController.text}" )),
                            Expanded(child: getCardItem("Sanction Qty","${tenderController.SancQtyController.text}" )),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            *//**//*Expanded(child: getCardItem("","${tenderController..text}" )),*//**//*
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            *//**//*Expanded(child: getCardItem("","${tenderController..text}" )),*//**//*
                          ],
                        ),
                        SizedBox(height: 10,),*//*



                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Item Name',
                              hintText: 'Item Name',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.ItmNmController,),
                      ]
                  )
              ),

              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Tender Type',
                              hintText: 'Tender Type',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.TENDTYP_DESC_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Ref Date',
                              hintText: 'Ref Date',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.RefDateController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Sanction Date',
                              hintText: 'Sanction Date',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.SancDateController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Tender Qty',
                              hintText: 'Tender Qty',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.TendQtyController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Sanction Qty',
                              hintText: 'Sanction Qty',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.SancQtyController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Rate',
                              hintText: 'Rate',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.RateController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Customer Code',
                              hintText: 'Customer Code',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.Tend_CustCode_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Customer Name',
                              hintText: 'Customer Name',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.Tend_CustNm_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),*/
              /*Padding(
                padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                child: TextFormField(
                  focusNode: AlwaysDisabledFocusNode(),
                  controller: _textEditingLiffdateController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Select the liffiting date";
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    labelText: 'Liffting Date',
                    hintText: 'Select Liffting Date',
                    labelStyle: new TextStyle(
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                  onTap: () {
                    _LiffselectDate(context);
                  },
                ),
              ),
              SizedBox(height: 10,),*/
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Liff_Date()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: DOEdtCardItm()),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 10,),
              /*Padding(
                padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("DO Qty.",style: TextStyle(fontSize: 15),),
                        SizedBox(width: 5,),
                        Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                      *//*cursorColor: kPrimaryColor,*//*
                      controller: _DOQtyController ,
                      onChanged: (value){
                        final val = double.parse( _DOQtyController.text as String);
                        final scanval = double.parse(tenderController.SancQtyController.text);
                        if(val!=0){
                          if(val<=scanval){
                            setState(() {
                              QtlsController.text= (val/100).toString();
                              BagsController.text = (val/50).toString();
                              AmtController.text = ((val/100)* double.parse(tenderController.RateController.text.toString())).toString();
                            });
                          }
                          else{
                            showDialog(
                                context: Get.context!,
                                barrierDismissible: false,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text('Delivery Quantity Information'),
                                    contentPadding: EdgeInsets.all(20),
                                    children: [Text('Please check tender sanction quantity'),
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                        _DOQtyController.clear();
                                        ClearDOQtyScrn();
                                        *//*getCardItem("",_DOQtyController.text);
                                        getCardItem("",QtlsController.text);
                                        getCardItem("",BagsController.text);
                                        getCardItem("",AmtController.text);
                                        _DOQtyController.clear();
                                        QtlsController.clear();
                                        BagsController.clear();
                                        AmtController.clear();*//*
                                        //ClearAll();
                                      }, child: Text("OK"))

                                    ],
                                  );
                                });

                          }
                        }

                      },
                      onSaved: (doqty) {

                      },

                      decoration: InputDecoration(
                          hintText: "DO QTY.",
                          labelStyle: TextStyle(fontSize: 12),
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter the DO Qty";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10,),

                  ],
                ),),*/
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Row(
                      children: [


                       // Expanded(child: getCardItem("Qtls","${QtlsController.text} " )),
                        Expanded(child: getCardItem("Bags","${BagsController.text} ")),
                        Expanded(child: getCardItem("Amount","${AmtController.text} " )),
                      ],
                    ),
                  ],
                ),
              ),
              /*SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Qtls',
                              hintText: 'Qtls',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: QtlsController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Bags',
                              hintText: 'Bags',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller:BagsController,),
                      ]
                  )
              ),
              SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Amount',
                              hintText: 'Amount',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: AmtController,),
                      ]
                  )
              ),*/
              SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text("Customer Code",style: TextStyle(fontSize: 18),),
                        SizedBox(width: 1,),
                        Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 2,),
                    TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Select Customer Code',labelStyle: TextStyle(fontSize: 15),
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)) ),
                        controller: this._typeAheadCustCodeController,
                      ),
                      suggestionsCallback: (pattern) {

                        return CustNo.getSuggestions(pattern,Cust_no_list);

                      },
                      itemBuilder: (context, String suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },

                      onSuggestionSelected: (String suggestion) {
                        this._typeAheadCustCodeController.text = suggestion;
                        //var  custid;

                        String custbroid="";
                        Cust_no_list.forEach((cn) async {
                          if(cn['CUST_NAME'].toString()==suggestion /*&& cn['CUST_NAME'].toString()==suggestion*/){
                            setState(() {
                              //tenderController.CustNm_Controller.text=cn['CUST_NAME'];
                              tenderController.CustAddress_Controller.text=cn['DELV_ADDRESS']+','+cn['DELV_CITY']+','+cn['DELV_STATE']+','+cn['DELV_COUNTRY'];
                              custbroid= cn['CUST_CD'].toString();
                              /*v['PERIOD_FROM']+'\n-'+v['PERIOD_TO']*/
                            });
                          }
                        });
                        Cust_Buyer_list.clear();
                        CustFetchData1(custbroid);
                        // Cust_no_list.clear();
                        //CustFetchData();
                      },
                      suggestionsBoxController: sgestboxCustNoController,
                      validator: (value) => value!.isEmpty ? 'Please select a customer code' : null,
                      onSaved: (value) => this._selectedCustNo = value!,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              /*Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Customer Name',
                              hintText: 'Customer Name',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.CustNm_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),*/
              /*Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Customer Address',
                              hintText: 'Customer Address',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          maxLines: 2,
                          enabled: false,

                          controller: tenderController.CustAddress_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),*/
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: getCardItem("Customer Address", "${tenderController.CustAddress_Controller.text}")),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text("Bill To Customer",style: TextStyle(fontSize: 18),),
                        SizedBox(width: 1,),
                        Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 2,),
                    TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Select Bill To Customer',labelStyle: TextStyle(fontSize: 15),
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)) ),
                        controller: this._typeAheadCustBuyerCodeController,
                      ),
                      suggestionsCallback: (pattern) {

                        return CustNo.getSuggestions(pattern,Cust_Buyer_list);

                      },
                      itemBuilder: (context, String suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },

                      onSuggestionSelected: (String suggestion) {
                        this._typeAheadCustBuyerCodeController.text = suggestion;
                        //var  custid;
                        Cust_Buyer_list.forEach((cn) async {
                          if(cn['CUST_NAME'].toString()==suggestion /*&& cn['CUST_NAME'].toString()==suggestion*/){
                            setState(() {
                              tenderController.Cust_Buyer_Nm_Controller.text=cn['CUST_NAME'];

                              /*v['PERIOD_FROM']+'\n-'+v['PERIOD_TO']*/
                            });
                          }
                        });
                        //BalanceCheck();
                        // Cust_no_list.clear();
                        //CustFetchData();
                      },
                      suggestionsBoxController: sgestboxCustBuyerController,
                      validator: (value) => value!.isEmpty ? 'Please select Bill To Customer' : null,
                      onSaved: (value) => this._selectedCustBuyerNo = value!,
                    ),
                  ],
                ),
              ),
              /*Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                  child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: new InputDecoration(
                              labelText: 'Bill To Customer Name',
                              hintText: 'Bill To Customer Name',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                          //maxLines: 2,
                          enabled: false,

                          controller: tenderController.Cust_Buyer_Nm_Controller,),
                      ]
                  )
              ),
              SizedBox(height: 5,),*/
              /*Padding(
                padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                child: TextFormField(
                  maxLength:10,
                  keyboardType: TextInputType.text,
                  //inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                  //cursorColor: kPrimaryColor,
                  controller: _VehicleNoController,
                  onSaved: (vehicle_no) {},

                  decoration: InputDecoration(
                      hintText: "Vehicle No.",
                      labelStyle: TextStyle(fontSize: 15),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                  validator: (mobile_no){
                    if (mobile_no!.isEmpty ) {
                      return "Enter the Vehicle No.";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 5,),*/
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: VechiCard()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "Submit",
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                      onPressed: () {
                        /*_submit();*/
                        if(_formkey.currentState!.validate()){
                          SaveDOrec();

                        }
                      },
                      child: Text(
                        "Submit".toUpperCase(),style:TextStyle(fontSize: 20,color: Colors.white,),/*Login*/
                      ),
                    ),
                  ),
                  /*SizedBox(width: 20,),
                  Hero(
                    tag: "Cancel",
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xFFE2213E)),),
                      onPressed: () {
                        /*_submit();*/
                        // if(_formkey.currentState!.validate()){/*NewScrn_1 Main_HomeScrn*/
                        // }
                      },
                      child: Text(
                        "Cancel".toUpperCase(),
                      ),
                    ),
                  ),*/
                ],
              ),
              SizedBox(height: 5,)



            ],
          ),
        ),
      ),
    );
  }

  _LiffselectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,

        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
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
      _selectedDate = newSelectedDate;
      _textEditingLiffdateController
        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingLiffdateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }



  Widget DOEdtCardItm(){
    //TextFormField _txtController =TextFormField();
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0),
                        child: Row(
                          children: [
                            Text("DO Qty.in Qtls",style: TextStyle(fontSize: 15),),
                            SizedBox(width: 5,),
                            Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                    /*cursorColor: kPrimaryColor,*/
                    controller: _DOQtyController ,
                    onChanged: (value){
                      final val = double.parse( _DOQtyController.text as String);
                      final scanval = double.parse(tenderController.SancQtyController.text);
                      if(val!=0){
                        if(val<=scanval){
                          setState(() {
                            //QtlsController.text= (val/100).toString();
                            BagsController.text = (val/0.5).toString();
                            //final qtlsVal = int.parse(QtlsController.text);
                            AmtController.text = ((val)* double.parse(tenderController.RateController.text.toString())).toString();
                          });
                        }
                        else{
                          showDialog(
                              context: Get.context!,
                              barrierDismissible: false,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text('Delivery Quantity Information'),
                                  contentPadding: EdgeInsets.all(20),
                                  children: [Text('Please check tender sanction quantity'),
                                    SizedBox(height: 10,),
                                    ElevatedButton(onPressed: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        _DOQtyController.clear();
                                        this.QtlsController.text='';
                                        this.BagsController.text='';
                                        this.AmtController.text='';
                                      });
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

                        }
                      }

                    },
                    onSaved: (doqty) {

                    },

                    decoration: InputDecoration(
                        hintText: "DO QTY.",
                        labelStyle: TextStyle(fontSize: 12),
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter the DO Qty";
                      }

                      return null;
                    },
                  ),
                  padding: const EdgeInsets.all(12),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget Liff_Date(){
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: TextFormField(
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: _textEditingLiffdateController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Select the liffiting date";
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                      labelText: 'Liffting Date',
                      hintText: 'Select Liffting Date',
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid),
                    ),
                    onTap: () {
                      _LiffselectDate(context);
                    },
                  ),
                  padding: const EdgeInsets.all(12),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget VechiCard(){
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: TextFormField(
                    maxLength:10,
                    keyboardType: TextInputType.text,
                    //inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                    //cursorColor: kPrimaryColor,
                    controller: _VehicleNoController,
                    onSaved: (vehicle_no) {},

                    decoration: InputDecoration(
                        hintText: "Vehicle No.",
                        labelStyle: TextStyle(fontSize: 15),
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                    ),
                    validator: (mobile_no){
                      if (mobile_no!.isEmpty ) {
                        return "Enter the Vehicle No.";
                      }
                      return null;
                    },
                  ),
                  padding: const EdgeInsets.all(12),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget getCardItem(String txtTitle, String txtController) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        /*height: 100,
          width: 105,*/
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
             color: MaterialStateColor.resolveWith((states) => const Color(0xFFDEDDDD)).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),*/
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text(
                    "${txtTitle}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  //padding: const EdgeInsets.all(8),
                ),
                Container(
                  child: Text(
                    "${txtController}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                ),
              ],
            ),
            /*Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Text("Student"),
                padding: const EdgeInsets.all(12),
              )*/
          ],
        ),
      ),
    );
  }

}
