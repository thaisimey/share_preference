import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ComponentPro {
  static Widget textField(String hint,TextEditingController controller,{Icon icon}) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: HexColor("5e5e69")) ,
        fillColor: Colors.black12,
        filled: true,
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor("5e5e69")),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        border: InputBorder.none,
      ),
    );
  }
}