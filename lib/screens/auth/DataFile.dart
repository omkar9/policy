import 'package:flutter/material.dart';

class Rele_Order{

  //static final List<String> Rele_Orders = ['KONANAKERI','KALAKATTI','MUGALIKATTI','MANCHINKOPPA','CHANDAPUR','NEERALKATTI','SHIVAPUR','JEKINKATTI','BHADRAPUR(KONANKERI)','MULAKERI','MUDDINKOPPA','ANDALGI','SHADAGARAVALLI','BASAVNKATTI','TORUR'];

  static List<String> getSuggestions(String query,List<dynamic> Rele_Orders) {
    List<String>s=[""];
    s.clear();
    Rele_Orders.forEach((v) async {
     s.add(v['RELEORDER_REF']);
    });

    List<String> matches = <String>[];
    matches.addAll(s);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}