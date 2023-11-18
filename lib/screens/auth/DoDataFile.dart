import 'package:flutter/material.dart';

class TenderNo{

  //static final List<String> Rele_Orders = ['KONANAKERI','KALAKATTI','MUGALIKATTI','MANCHINKOPPA','CHANDAPUR','NEERALKATTI','SHIVAPUR','JEKINKATTI','BHADRAPUR(KONANKERI)','MULAKERI','MUDDINKOPPA','ANDALGI','SHADAGARAVALLI','BASAVNKATTI','TORUR'];

  static List<String> getSuggestions(String query,List<dynamic> Tend_no) {
    List<String>s=[""];
    s.clear();
    Tend_no.forEach((tn) async {
      s.add(tn['TEND_NO']);
    });

    List<String> matches = <String>[];
    matches.addAll(s);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}