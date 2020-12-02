import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saving_object/model/user.dart';
import 'package:saving_object/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/component_pro.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  String name= "simey";
  String pass = "simey";
  bool isLoggedIn = false;
  final nameController = TextEditingController();
  final passController = TextEditingController();

  List<User> listUser = [];

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

  void login() {
    if(nameController.text == listUser[0].username && passController.text == listUser[0].password) {
      isLoggedIn = true;
      print("Login Successfully");
    } else {
      print("failed");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listUser.add(User(1, "User", "https://pbs.twimg.com/media/EbNX_erVcAUlwIx.jpg","Male",name, pass));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var username = await getUser();
      print(username);
    if( username != null ) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView(user: listUser[0],)));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()));
    }
    });


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
                    onTap: () {
                      saveUser();
                        if(nameController.text == listUser[0].username && passController.text == listUser[0].password) {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView(user: listUser[0],)));
                          isLoggedIn = true;
                        } else {
                          print("failed");
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
