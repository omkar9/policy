import 'dart:convert';


import 'package:api_app/controllers/login_controller.dart';
import 'package:api_app/controllers/registeration_controller.dart';
import 'package:api_app/screens/auth/widgets/input_fields.dart';
import 'package:api_app/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoints.dart';
import 'DataFile.dart';
import '../../screens/auth/data1.dart';

import 'package:intl/intl.dart';
class User {
  String Item_Code;
  String Description;
  String Rate;
  String qty;
  String Liffting_Date;

  User({required this.Item_Code, required this.Description,required this.Rate,required this.qty,required this.Liffting_Date});
}
class tender extends StatefulWidget {
  const tender({Key? key}) : super(key: key);

  @override
  State<tender> createState() => _tenderState();
}

class _tenderState extends State<tender> {
  List<dynamic> item=[""];
  String _selecteditem="";
  RegisterationController registerationController =
  Get.put(RegisterationController());
  final TextEditingController _typeAheadResiController=TextEditingController();
  SuggestionsBoxController sgestboxResiController= SuggestionsBoxController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _selectedResiVlg="";


  List<dynamic> Rele_Orders=[""];
  final TextEditingController DescriptionController=TextEditingController();
  SuggestionsBoxController sgestboxitemController= SuggestionsBoxController();
  TextEditingController RateController = TextEditingController();
  TextEditingController QtyController = TextEditingController();
  late DateTime _selectedDate=DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  final form = GlobalKey<FormState>();
  final form_key = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  bool update = false;

  User user = User(Item_Code: '',Description:'',Rate:'0',qty:'0',Liffting_Date:'');

  List<User> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    loginWithEmail();
    _typeAheadResiController.clear();
    registerationController.PeriodController.clear();
    registerationController.RORefController.clear();
    registerationController.ROQtyController.clear();
    userList.add(User(Item_Code: 'Select Item', Description: '',Rate:'',qty:'',Liffting_Date: ''  ));
    super.initState();
  }


  Future<void> itemload(var itemgrpid) async {
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "SELECT     ST_ITM_MST.PK_ITM_ID, ST_ITM_MST.ITM_CODE, ST_ITM_MST.ITM_DESC, 0 as Extra_1, 0 as Extra_2   FROM ST_ITM_MST INNER JOIN ST_ITMGRP_MST ON ST_ITM_MST.FK_ITMGRP_ID = ST_ITMGRP_MST.PK_ITMGRP_ID\n" +
            "where      ST_ITM_MST.ITM_TENDRING=1 AND ST_ITM_MST.ITM_STOCK > 0\n" +" and FK_ITMGRP_ID="+itemgrpid +
            " ORDER BY [ITM_CODE]",
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
          item=json['Table'];
          /*json['Table'].forEach((v) async {
            int i=0;


            Rele_Orders[i]=v['RELEORDER_REF'];
            i=i+1;
            //token = v['PK_CUST_ID'];
          });*/
          // final SharedPreferences? prefs = await _prefs;
          //await prefs?.setInt('Custid', token);
        }

        /*} else if (json[''] == 1) {
          throw jsonDecode(response.body)['message'];
        }*/
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

  Future<void> Saverecord() async {
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      int resorderid=0;
      final SharedPreferences? prefs = await _prefs;
      Object? custid=prefs?.get('Custid');


      Rele_Orders.forEach((v) async {
        if(v['RELEORDER_REF'].toString()==_typeAheadResiController.text){
          setState(() {
            resorderid= v['PK_RELEORDER_ID'];


          });

        };
      });



String sbox="";
      userList.forEach((v1) async {
        int itemid = 0;
if(v1.Item_Code!="Select Item"){
        item.forEach((v2) async {
          if (v1.Description == v2['ITM_DESC'].toString()) {
            itemid = v2['PK_ITM_ID'];
          }
        });


        String qury = "insert into MOB_TENDER_TRN( FK_RELEASE_ORDR_ID," +
            "FK_CUST_ID," +
            "FK_SEASON_ID," +
            "FK_ITM_ID," +
            "ITM_QTY," +
            "ITM_RATE," +
            "LIFTING_DATE," +
            "ORDER_STATUS_FLG," +
            "ORDER_STATUS_RMK," +
            "SANC_QTY," +
            "SANC_RATE," +
            "DEVICE_ID)" +
            "values(" + resorderid.toString() + "," +
            "" + custid.toString() + "," +
            "(select RELEORDER_SEASON from ST_RELEORDER_TRN where PK_RELEORDER_ID=" +
            resorderid.toString() + ")," +
            "" + itemid.toString() + "," +
            "" + v1.qty + "," +
            "" + v1.Rate + "," +
            "convert(DATE,'" + v1.Liffting_Date + "',103)," +
            "0, " +
            "''," +
            "0," +
            "0," +
            "'null')";


        var url = Uri.https(
            ApiEndPoints.baseUrl, ApiEndPoints.authEndpoints.loginEmail);
        Map body = {
          'sqlq1': qury,
          'constr': "ConStringh"
        };

        var response = await http.post(url, body: jsonEncode(body),
            headers: {
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*',
              'Accept': 'application/json'
            });
        /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'*','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          int token = 0;

          if (json['Table'] != null) {
            item = json['Table'];
            /*json['Table'].forEach((v) async {
            int i=0;


            Rele_Orders[i]=v['RELEORDER_REF'];
            i=i+1;
            //token = v['PK_CUST_ID'];
          });*/
            // final SharedPreferences? prefs = await _prefs;
            //await prefs?.setInt('Custid', token);
          }

          /*} else if (json[''] == 1) {
          throw jsonDecode(response.body)['message'];
        }*/
          int currentIndex = userList.indexOf(v1);
          currentIndex=currentIndex+1;
          if(currentIndex==(userList.length-1) ){

            setState((){

              userList.clear();

              userList.add(User(Item_Code: 'Select Item', Description: '',Rate:'',qty:'',Liffting_Date: ''  ));
            });

            _typeAheadResiController.clear();
            registerationController.PeriodController.clear();
            registerationController.RORefController.clear();
            registerationController.ROQtyController.clear();
            showDialog(
                context: Get.context!,
                builder: (context) {
                  return SimpleDialog(
                    title: Text('Information'),
                    contentPadding: EdgeInsets.all(20),
                    children: [Text('Record Saved Successfully')
                      ,
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("OK"))

                    ],
                  );
                });
          }

        } else {
          sbox="error";
          throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
        }
      }


      });



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




  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "SELECT TOP 100 PERCENT ST_RELEORDER_TRN.PK_RELEORDER_ID,  ST_RELEORDER_TRN.RELEORDER_NO, ST_RELEORDER_TRN.RELEORDER_REF,cast(day(RELEORDER_PERIOD_FROM) as varchar(5))+'/'+cast(month(RELEORDER_PERIOD_FROM) as varchar(5))+'/'+cast(year(RELEORDER_PERIOD_FROM) as varchar(5))  as PERIOD_FROM,cast(day(RELEORDER_PERIOD_TO) as varchar(5))+'/'+cast(month(RELEORDER_PERIOD_TO) as varchar(5))+'/'+cast(year(RELEORDER_PERIOD_TO) as varchar(5)) as PERIOD_TO,RELEORDER_QTY ,FK_ITMGRP_ID FROM ST_RELEORDER_TRN INNER JOIN ST_ITMGRP_MST ON ST_RELEORDER_TRN.FK_ITMGRP_ID = ST_ITMGRP_MST.PK_ITMGRP_ID INNER JOIN ST_TENDTYP_MST ON ST_RELEORDER_TRN.FK_TENDTYP_ID = ST_TENDTYP_MST.PK_TENDTYP_ID INNER JOIN SYS_SEASON_MST ON ST_RELEORDER_TRN.RELEORDER_SEASON = SYS_SEASON_MST.PK_SEASON_ID\n" +
            "WHERE (ST_RELEORDER_TRN.FK_FAYR <= 4) AND (ST_RELEORDER_TRN.RELEORDER_QTY > ST_RELEORDER_TRN.RELEORDER_TEND_QTY + ST_RELEORDER_TRN.RELEORDER_CLOSE_QTY)\n" +
            "ORDER BY [RELEORDER_NO]",
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
           Rele_Orders=json['Table'];
          /*json['Table'].forEach((v) async {
            int i=0;


            Rele_Orders[i]=v['RELEORDER_REF'];
            i=i+1;
            //token = v['PK_CUST_ID'];
          });*/
          // final SharedPreferences? prefs = await _prefs;
          //await prefs?.setInt('Custid', token);
        }

        /*} else if (json[''] == 1) {
          throw jsonDecode(response.body)['message'];
        }*/
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
              children: [
                Text(error.toString())



              ],

            );
          });
    }
  }
  bool visibleicon(String itmcode ){
    if(itmcode=="Select Item"){
      return false;
    }else{
      return true;
    }
  }
  bool visibleiconADD(String itmcode ){
    if(itmcode=="Select Item"){
      return true;
    }else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    String Period="";
    String RORef="";
    String ROQty = "";
    Widget bodyData() => SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
      child: SingleChildScrollView(

          child:DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 0,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(label: Text("Options"), tooltip: ""),
        DataColumn(label: Text("Item Code"), tooltip: "To Display Item Code"),
        DataColumn(label: Text("Description"), tooltip: "To Display Description"),
        DataColumn(label: Text("Quantity"), tooltip: "To Display Quantity"),
        DataColumn(label: Text("Rate"), tooltip: "To Display Rate"),
        DataColumn(label: Text("Liffting Date"), tooltip: "To Liffting Date"),
      /*  DataColumn(label: Text("Update"), tooltip: "Update data"),*/

      ],
      rows: userList
          .map(
            (user) => DataRow(
          cells: [
            DataCell(
                Row(
                  children: [
                    Visibility(
                      visible: visibleiconADD(user.Item_Code),
                      child: IconButton(
                        onPressed: () {
                          this.user = user;
                          //_deleteTextControllers(); // new function here
                          if(_typeAheadResiController.text!= "") {

                            _popup();
                          }
                          else {
                            showDialog(
                                context: Get.context!,
                                barrierDismissible: false,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text('Error'),
                                    contentPadding: EdgeInsets.all(20),
                                    children: [Text("Please select Release Order"),
                                      ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("Ok",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  side: BorderSide.none)),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            Color(0xFFE2213E),

                                          ),),
                                      )],
                                  );
                                });
                          }
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visibleicon(user.Item_Code),

                      child: IconButton(

                        onPressed: () {
                          this.user = user;
                          _deleteTextControllers(); // new function here
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )

            ),
            DataCell(
              Text(user.Item_Code),
            ),
            DataCell(
              Text(user.Description),
            ),
            DataCell(
              Text(user.qty.toString()),
            ),
            DataCell(
              Text(user.Rate.toString()),
            ),
            DataCell(
              Text(user.Liffting_Date),
            ),
            /*DataCell(
              IconButton(
                onPressed: () {
                  this.user = user;
                  _updateTextControllers(); // new function here
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),*/

          ],
        ),
      )
          .toList(),
    )
      ),
    );


    return  Scaffold(
      appBar: AppBar(  title: Text('TENDER',style: TextStyle(color: Colors.white)),backgroundColor:
        Color(0xFFE2213E)
      ,centerTitle: true,),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                     width:700,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 5),
                      ],
                      ),
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                            child: Column(


                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(

                                    children: [
                                      Text("Release Order",style: TextStyle(fontSize: 18),),
                                      SizedBox(width: 1,),
                                      Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2,),
                                TypeAheadFormField(

                                  textFieldConfiguration: TextFieldConfiguration(
                                    decoration: InputDecoration(
                                      //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                                        hintText: 'Select Release Order',labelStyle: TextStyle(fontSize: 15),
                                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)) ),
                                    controller: this._typeAheadResiController,
                                  ),
                                  suggestionsCallback: (pattern) {

                                    return Rele_Order.getSuggestions(pattern,Rele_Orders);

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
                                    this._typeAheadResiController.text = suggestion;
                                    var  itemgrpid;
                                    Rele_Orders.forEach((v) async {
                                      if(v['RELEORDER_REF'].toString()==suggestion){
                                        setState(() {

                                          registerationController.PeriodController.text=v['PERIOD_FROM']+' - '+v['PERIOD_TO'];
                                          registerationController.RORefController.text=v['RELEORDER_REF'];

                                          registerationController.ROQtyController.text= v['RELEORDER_QTY'].toString();
                                          itemgrpid=v['FK_ITMGRP_ID'].toString();

                                        });

                                      };
                                    });
                                    item.clear();
                                    itemload(itemgrpid);

                                  },
                                  suggestionsBoxController: sgestboxResiController,
                                  validator: (value) => value!.isEmpty ? 'Please select a release order' : null,
                                  onSaved: (value) => this._selectedResiVlg = value!,
                                ),
                              ],
                            ),
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
                                          labelText: 'Period',
                                          hintText: 'Period',
                                          labelStyle: new TextStyle(
                                              decorationStyle: TextDecorationStyle.solid)),
                                      //maxLines: 2,
                                      enabled: false,

                                      controller: registerationController.PeriodController,),
                                  ]
                              )
                          ),
                          SizedBox(height: 1,),
                          Padding(
                              padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                              child:Column(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    TextField(
                                        decoration: new InputDecoration(
                                            labelText: 'RO Referance',
                                            hintText: 'RO Referance',
                                            labelStyle: new TextStyle(
                                                decorationStyle: TextDecorationStyle.solid)),
                                        //maxLines: 2,
                                        enabled: false,
                                        controller:registerationController.RORefController),
                                  ] )),
                          SizedBox(height: 1,),
                          Padding(
                              padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                              child:Column(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    TextField(
                                        decoration: new InputDecoration(
                                            labelText: 'RO Qty',
                                            hintText: 'RO Qty',
                                            labelStyle: new TextStyle(
                                                decorationStyle: TextDecorationStyle.solid)),


                                        //maxLines: 2,
                                        enabled: false,
                                        controller: registerationController.ROQtyController),
                                  ])),
                          SizedBox(height: 1,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        SizedBox(height: 20,),




            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: form,
                child: Container(
                  child: Column(
                    children: <Widget>[


                      /*SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                        child: TextFormField(
                          controller: QtyController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          autocorrect: false,
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: new InputDecoration(
                              labelText: 'Quantity',
                              hintText: 'Quantity',
                              labelStyle: new TextStyle(
                                  decorationStyle: TextDecorationStyle.solid)),
                        ),
                      ),
                      SizedBox(height: 7,),


                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                        child: TextFormField(
                          controller: RateController,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          autocorrect: false,
                          //maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: new InputDecoration(
                            labelText: 'Rate',
                            hintText: 'Rate',
                            labelStyle: new TextStyle(
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                        child: TextField(
                          focusNode: AlwaysDisabledFocusNode(),
                          controller: _textEditingController,
                          decoration: new InputDecoration(
                            labelText: 'Liffting Date',
                            hintText: 'Select Liffting Date',
                            labelStyle: new TextStyle(
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ),*/
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      bodyData(),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide.none)),
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Color(0xFFE2213E),
                                    )),
                                onPressed: (){
                                  String Rvalidation="";
                                  String ivalidation="";
                                  if(_typeAheadResiController.text==""){
                                    Rvalidation="Please Select Release Order";
                                  }
    if(userList.length==1) {
      ivalidation="Please Add Item List";
    }
                                  if(Rvalidation!=""){
                                    showDialog(
                                        context: Get.context!,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return SimpleDialog(
                                            title: Text('Error'),
                                            contentPadding: EdgeInsets.all(20),
                                            children: [Text(Rvalidation),
                                              ElevatedButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("Ok",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          side: BorderSide.none)),
                                                  backgroundColor: MaterialStateProperty.all<Color>(
                                                    Color(0xFFE2213E),

                                                  ),),
                                              )],
                                          );
                                        });
                                  }
                                else  if(ivalidation!="") {
                                    showDialog(
                                        context: Get.context!,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return SimpleDialog(
                                            title: Text('Error'),
                                            contentPadding: EdgeInsets.all(20),
                                            children: [Text(ivalidation),
                                              ElevatedButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("Ok",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          side: BorderSide.none)),
                                                  backgroundColor: MaterialStateProperty.all<Color>(
                                                    Color(0xFFE2213E),

                                                  ),),
                                              )],
                                          );
                                        });

    }
                                   else{
                                    setState((){
                                      Saverecord();

                                    });

    }

                                },
                                child: Text("Submit".toUpperCase(),style: TextStyle(fontSize: 20,color: Colors.white,),))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
            ),




           // SizedBox(height: 20,),
            /*Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        *//*Text("RO Referance",style: TextStyle(fontSize: 20),),
                        SizedBox(width: 5,),
                        Text(' : '),
                        SizedBox(width: 5,),*//*
                        InputTextFieldWidget(
                            registerationController.RORefController, 'RO Referance')
                        //Text('$RORef',style: TextStyle(fontSize: 20,),)
                      ],
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        *//*Text("RO Qty",style: TextStyle(fontSize: 20),),
                        SizedBox(width: 5,),
                        Text(' : '),
                        SizedBox(width: 5,),*//*
                        InputTextFieldWidget(
                            registerationController.ROQtyController, 'RO Qty')
                       //Text('$ROQty',style: TextStyle(fontSize: 20,),)
                      ],
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),*/

          ],
        ),
      ),






    );
  }
  void _popup(){
    setState(() {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return Form(
              key: form_key,
              child: SimpleDialog(
                title: Text('Items'),
                contentPadding: EdgeInsets.all(20),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Text("Item",style: TextStyle(fontSize: 18),),
                          SizedBox(width: 1,),
                          Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                        ],
                      ),
                      SizedBox(height: 2,),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                              hintText: 'Select Item',labelStyle: TextStyle(fontSize: 15),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)) ),
                          controller: this.DescriptionController,
                        ),
                        suggestionsCallback: (pattern) {

                          return data1.getSuggestions(pattern,item);

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
                          this.DescriptionController.text = suggestion;


                        },
                        suggestionsBoxController: sgestboxitemController,
                        validator: (value) => value!.isEmpty ? 'Please select a release order' : null,
                        onSaved: (value) => this._selecteditem = value!,
                      ),
                    ],
                  ),
                 /* Padding(
                    padding: const EdgeInsets.only(left: 20,top: 1,bottom: 1,right: 20),
                    child:
                  ),*/
                  //SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: QtyController ,
                      //focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                      autocorrect: false,
                      //maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        labelText: 'Qty in Qtls',
                        hintText: 'Qty',
                        labelStyle: new TextStyle(
                            decorationStyle: TextDecorationStyle.solid),
                      ),


                    ),

                  ),
                  //SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: RateController ,
                      //focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                      autocorrect: false,
                      //maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        labelText: 'Rate/Qtls',
                        hintText: 'Rate',
                        labelStyle: new TextStyle(
                            decorationStyle: TextDecorationStyle.solid),
                      ),


                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      controller: _textEditingController,
                      decoration: new InputDecoration(
                        labelText: 'Liffting Date',
                        hintText: 'Select Liffting Date',
                        labelStyle: new TextStyle(
                            decorationStyle: TextDecorationStyle.solid),
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("Add",style:TextStyle(fontSize: 20,color: Colors.white,),),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide.none)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFE2213E),

                          ),),
                        onPressed: () {
                          if (validate() == true) {
                            form.currentState?.save();
                            var item_code;
                            item.forEach((v) async {
                              if(v['ITM_DESC'].toString()==DescriptionController.text){
                                setState(() {
                                  item_code=v['ITM_CODE'];



                                });

                              };
                            });
                            String valid="";
                            userList.forEach((v) async {
                              if(item_code==v.Item_Code){
                                valid="error";
                              }
                            });
                            if(valid=="") {
                              addUserToList(
                                  item_code,
                                  DescriptionController.text,
                                  RateController.text,
                                  QtyController.text,
                                  _textEditingController.text
                              );
                              clearForm();
                              Navigator.pop(context);
                            }else{
                              showDialog(
                                  context: Get.context!,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return SimpleDialog(
                                      title: Text('Error'),
                                      contentPadding: EdgeInsets.all(20),
                                      children: [Text("Already Item Added Please Add Different Item"),
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text("Ok",style:TextStyle(fontSize: 20,color: Colors.white,),),
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    side: BorderSide.none)),
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                              Color(0xFFE2213E),

                                            ),),
                                        )],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                      SizedBox(width: 10,),
                      TextButton(
                          onPressed: (){

                            Navigator.pop(context);

                          }, child: Text("Cancel")
                      )
                    ],
                  )

                ],
              ),
            );
          });
    });
  }


  void updateForm() {
    setState(() {
      //Code to update the list after editing
      var item_code;
      item.forEach((v) async {
        if(v['ITM_DESC'].toString()==DescriptionController.text){
          setState(() {
            item_code=v['ITM_CODE'];



          });

        };
      });
      user.Item_Code=item_code;
      user.Description = DescriptionController.text;
      user.Rate = RateController.text ;
      user.qty = QtyController.text ;
      user.Liffting_Date=_textEditingController.text;
    });
  }

  void _updateTextControllers() {
    setState(() {

      DescriptionController.text = user.Description;
      RateController.text = user.Rate as String;
      QtyController.text = user.qty as String;
      _textEditingController.text=user.Liffting_Date;
    });
  }

  void _deleteTextControllers() {
    setState(() {
      //How to delete the list data on clicking Delete button?
      int currentIndex = userList.indexOf(user);
      userList.removeAt(currentIndex);
    });
  }

  void addUserToList(Item_Code,Description,Rate ,qty,Liffting_Date) {
    setState(() {
      int currentIndex = userList.indexOf(user);
      userList.removeAt(currentIndex);
      userList.add(User(Item_Code: Item_Code, Description: Description,Rate:Rate,qty:qty,Liffting_Date: Liffting_Date  ));
      userList.add(User(Item_Code: 'Select Item', Description: '',Rate:'',qty:'',Liffting_Date: ''  ));
    });
  }

  void _pop(){
    showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Items'),
            contentPadding: EdgeInsets.all(20),
            children: [

            ],
          );
        });
  }

  clearForm() {
    DescriptionController.clear();
    RateController.clear();
    QtyController.clear();
    _textEditingController.clear();
  }

  bool validate() {
    var valid = form.currentState?.validate();
    if (valid!) form.currentState?.save();
    return valid;
  }

  _selectDate(BuildContext context) async {
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
      _textEditingController
        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }



}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}


