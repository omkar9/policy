// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputTextFieldWidget1 extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget1(this.textEditingController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 400,
      child: TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        controller: textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}
