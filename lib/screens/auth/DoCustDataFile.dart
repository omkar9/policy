import 'package:flutter/material.dart';

class CustNo{

  //static final List<String> Rele_Orders = ['KONANAKERI','KALAKATTI','MUGALIKATTI','MANCHINKOPPA','CHANDAPUR','NEERALKATTI','SHIVAPUR','JEKINKATTI','BHADRAPUR(KONANKERI)','MULAKERI','MUDDINKOPPA','ANDALGI','SHADAGARAVALLI','BASAVNKATTI','TORUR'];

  static List<String> getSuggestions(String query,List<dynamic> Cust_No) {
    List<String>s=[""];

    s.clear();
    Cust_No.forEach((cn) async {
      s.add(cn['CUST_NAME']);
    });

    List<String> matches = <String>[];
    matches.addAll(s);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}