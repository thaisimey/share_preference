
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saving_object/view/home_view.dart';
import 'package:saving_object/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/constant.dart';
import 'data/local_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String name= "simey";
  String pass = "simey";
  bool isHomeScreen = true;
  LocalData localData = LocalData();

  Future<String> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String username = pref.getString("name");
    String password = pref.getString("pass");
    return username;
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      try {
        var localUser = await localData.getUser(key: Constant.user);
        if(localUser == null) {
          isHomeScreen = false;
        } else {
          isHomeScreen = true;
        }
      } catch (e) {
        isHomeScreen = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("isHomeScreen $isHomeScreen");
    return MaterialApp(
      title: "Shopping",
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: HexColor("#191720"),
        fontFamily: 'Quicksand-VariableFont_wght',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ) ,
      themeMode: ThemeMode.system,
      home: isHomeScreen ? HomeView() : LoginView(),
    );
  }
}
