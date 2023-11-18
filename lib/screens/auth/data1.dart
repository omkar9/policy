import 'package:flutter/material.dart';

class data1{

  //static final List<String> Rele_Orders = ['KONANAKERI','KALAKATTI','MUGALIKATTI','MANCHINKOPPA','CHANDAPUR','NEERALKATTI','SHIVAPUR','JEKINKATTI','BHADRAPUR(KONANKERI)','MULAKERI','MUDDINKOPPA','ANDALGI','SHADAGARAVALLI','BASAVNKATTI','TORUR'];

  static List<String> getSuggestions(String query,List<dynamic> item) {
    List<String>s=[""];
    s.clear();
    item.forEach((v) async {
      s.add(v['ITM_DESC']);
    });

    List<String> matches = <String>[];
    matches.addAll(s);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}