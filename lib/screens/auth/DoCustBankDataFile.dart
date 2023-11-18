import 'package:flutter/material.dart';

class CustBank{

  //static final List<String> Rele_Orders = ['KONANAKERI','KALAKATTI','MUGALIKATTI','MANCHINKOPPA','CHANDAPUR','NEERALKATTI','SHIVAPUR','JEKINKATTI','BHADRAPUR(KONANKERI)','MULAKERI','MUDDINKOPPA','ANDALGI','SHADAGARAVALLI','BASAVNKATTI','TORUR'];

  static List<String> getSuggestions(String query,List<dynamic> Cust_Bank_list) {
    List<String>s=[""];
    s.clear();
    Cust_Bank_list.forEach((cn) async {
      s.add(cn['Customer Bank List']);
    });

    List<String> matches = <String>[];
    matches.addAll(s);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}