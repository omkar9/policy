import 'dart:convert';

import 'package:api_app/screens/home.dart';
import 'package:api_app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class tender_controller extends GetxController{
  TextEditingController TendNoController = TextEditingController();
  TextEditingController RefDateController = TextEditingController();
  TextEditingController SancDateController = TextEditingController();
  TextEditingController TendQtyController = TextEditingController();
  TextEditingController SancQtyController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController DOQtyController = TextEditingController();

  TextEditingController LiffDateController = TextEditingController();
  TextEditingController ItmNmController = TextEditingController();
  TextEditingController TENDTYP_DESC_Controller = TextEditingController();
  TextEditingController ItmCodeController = TextEditingController();
  TextEditingController Tend_CustNm_Controller = TextEditingController();
  TextEditingController Tend_CustCode_Controller = TextEditingController();

  TextEditingController CustNm_Controller = TextEditingController();
  TextEditingController CustAddress_Controller = TextEditingController();

  TextEditingController Cust_Buyer_Nm_Controller = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController PeriodController = TextEditingController();
  TextEditingController RORefController = TextEditingController();
  TextEditingController ROQtyController = TextEditingController();


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}