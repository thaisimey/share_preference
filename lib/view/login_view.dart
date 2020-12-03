import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saving_object/constant/constant.dart';
import 'package:saving_object/data/local_data.dart';
import 'package:saving_object/model/user.dart';
import 'package:saving_object/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/component_pro.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LocalData localData = LocalData();

  String name= "simey";
  String pass = "simey";
  bool isLoggedIn = false;
  final nameController = TextEditingController();
  final passController = TextEditingController();

  List<User> listUser = [];





  void login() {
    if(nameController.text == listUser[0].username && passController.text == listUser[0].password) {
      print("Login Successfully");
    } else {
      print("failed");
    }
  }
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   // leading: Icon(Icons.arrow_back),
      //
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6,right: 6,bottom: 16,top: 10),
                    child: Text("Let's sign you in.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Welcome back",style: TextStyle(fontSize: 26,color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("You've been missed",style: TextStyle(fontSize: 26,color: Colors.white),),
                  ),
                  SizedBox(height: 70,),
                  ComponentPro.textField("Phone, email or username",nameController),
                  SizedBox(height : 20),
                  ComponentPro.textField("Password",passController,icon: Icon(Icons.remove_red_eye_rounded,color: HexColor("5e5e69"))),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("Don't have an account?",style: TextStyle(color: HexColor("5e5e69")),),
                      ),
                      Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async{
                      User user = User(id: 1, name: nameController.text, photo: "https://pbs.twimg.com/media/EbNX_erVcAUlwIx.jpg", gender: "Male",username: nameController.text, password: passController.text);
                      if(nameController.text == 'simey' && passController.text == '123') {
                          try {
                            await localData.saveUser(key: Constant.user, value: user.toJson());
                          } catch(e) {
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
                        } else {
                          isLoggedIn = false;
                        }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:18.0,right: 18,top: 18,bottom: 40),
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                          child: Align(alignment: Alignment.center,child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold),))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
