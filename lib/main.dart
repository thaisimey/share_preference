
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'file:///E:/Simey/saving_object/lib/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> saveUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
    pref.setString("pass", pass);
  }

  Future<String> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String username = pref.getString("name");
    String password = pref.getString("pass");
    return username;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping",
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: HexColor("#191720"),
        fontFamily: 'Quicksand-VariableFont_wght',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ) ,
      themeMode: ThemeMode.system,
      home: LoginView(),
    );
  }
}
