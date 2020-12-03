import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {

  Future<void> saveUser({String key,value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, json.encode(value));
  }

  getUser({String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return json.decode(pref.getString(key));
  }


  Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}