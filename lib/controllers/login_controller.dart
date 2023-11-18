import 'dart:convert';

import 'package:api_app/DOPage.dart';
import 'package:api_app/screens/auth/tender.dart';
import 'package:api_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:api_app/menu1.dart';

import '../screens/Report.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin':'http://tender.customersupportatharvasolutions.co.in/','Access-Control-Allow-Credentials':true,'Access-Control-Allow-Headers':'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale','Access-Control-Allow-Methods':'POST, OPTIONS'};
    try {
      var url = Uri.parse('https://erp.sangamnathsugars.com/testapi/api/Report');
          //ApiEndPoints.baseUrl , ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'sqlq1': "Select PK_CUST_ID,CUST_CD,\tCUST_NAME from sys_login_Cust inner join ST_CUST_MST on sys_login_Cust.FK_CUST_ID=ST_CUST_MST.PK_CUST_ID where USR_NAME='"+ emailController.text.trim()+"' and USR_PASSWORD='"+ passwordController.text.trim()+"'",
        'constr': "ConStringh"
      };

      var response = await http.post(url,body:jsonEncode(body),headers: {

      'Content-Type':'application/json','Accept':'application/json'
      } );
      /*http.Response response =
          await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json','Access-Control-Expose-Headers':'Content-Length,Content-Range','Access-Control-Allow-Origin':'http://tender.customersupportatharvasolutions.co.in/','Access-Control-Allow-Headers':'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range','Access-Control-Allow-Methods':'GET, POST, OPTIONS'});
*/
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        int token = 0;
        if (json['Table'] != null) {

          json['Table'].forEach((v) async {
            token = v['PK_CUST_ID'];
          });
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setInt('Custid', token);
        }
        if(token == 0){
          Get.back();
        }else{
          emailController.clear();
          passwordController.clear();
          final SharedPreferences? prefs = await _prefs;
         var type=  prefs?.get('typ');
          if(type=='te') {
            Get.off(tender());
          }else{
            Get.off(Report());
          }
        }
        /*var token1=json['Table'];
        if (json[''] == 0) {*/
          /*int token = json['Table']['PK_CUST_ID'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setInt('Custid', token);*/


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
}
