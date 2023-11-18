// I write this because you don't show me the User Model
import 'dart:convert';


import 'package:api_app/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
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

class Episode5 extends StatefulWidget {
  @override
  _Episode5State createState() => _Episode5State();
}

class _Episode5State extends State<Episode5> {
  List<dynamic> item=[""];
  String _selecteditem="";
  @override
  void initState() {
    // TODO: implement initState
    itemload();
    super.initState();
  }

  Future<void> itemload() async {
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'*','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.https(
          ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "SELECT     ST_ITM_MST.PK_ITM_ID, ST_ITM_MST.ITM_CODE, ST_ITM_MST.ITM_DESC, 0 as Extra_1, 0 as Extra_2   FROM ST_ITM_MST INNER JOIN ST_ITMGRP_MST ON ST_ITM_MST.FK_ITMGRP_ID = ST_ITMGRP_MST.PK_ITMGRP_ID\n" +
      "where      ST_ITM_MST.ITM_TENDRING=1 AND ST_ITM_MST.ITM_STOCK > 0\n" +" and FK_ITMGRP_ID=1"+
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
  final TextEditingController DescriptionController=TextEditingController();
  SuggestionsBoxController sgestboxitemController= SuggestionsBoxController();
  TextEditingController RateController = TextEditingController();
  TextEditingController QtyController = TextEditingController();
  late DateTime _selectedDate=DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  final form = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  bool update = false;

  User user = User(Item_Code: '',Description:'',Rate:'0',qty:'0',Liffting_Date:'');

  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 0,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(label: Text("Item Code"), tooltip: "To Display Item Code"),
        DataColumn(label: Text("Description"), tooltip: "To Display Description"),
        DataColumn(label: Text("Quantity"), tooltip: "To Display Quantity"),
        DataColumn(label: Text("Rate"), tooltip: "To Display Rate"),
        DataColumn(label: Text("Liffting Date"), tooltip: "To Liffting Date"),
        DataColumn(label: Text("Update"), tooltip: "Update data"),
        DataColumn(label: Text("Delete"), tooltip: "Delete data"),
      ],
      rows: userList
          .map(
            (user) => DataRow(
          cells: [
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
            DataCell(
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
            ),
            DataCell(
              IconButton(
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
        ),
      )
          .toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            bodyData(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: form,
                child: Container(
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text("Item",style: TextStyle(fontSize: 20),),
                                SizedBox(width: 1,),
                                Text('*',style: TextStyle(fontSize: 20,color: Colors.red),)
                              ],
                            ),
                            SizedBox(height: 2,),
                            TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                  //labelText: 'Residential Village',labelStyle: TextStyle(fontSize: 20),
                                    hintText: 'Select Item',labelStyle: TextStyle(fontSize: 20),
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
                      ),

                      TextFormField(
                        controller: QtyController,
                        keyboardType: TextInputType.text,
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
                      SizedBox(
                        height: 10,
                      ),


                      TextFormField(
                        controller: RateController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
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
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingController,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextButton(
                                  child: Text("Add"),
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
                                      addUserToList(
                                        item_code,
                                        DescriptionController.text,
                                        RateController.text,
                                        QtyController.text,
                                          _textEditingController.text
                                      );
                                      clearForm();
                                    }
                                  },
                                ),
                                TextButton(
                                  child: Text("Update"),
                                  onPressed: () {
                                    if (validate() == true) {
                                      form.currentState?.save();
                                      updateForm();
                                      clearForm();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
      userList.add(User(Item_Code: Item_Code, Description: Description,Rate:Rate,qty:qty,Liffting_Date: Liffting_Date  ));
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
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
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