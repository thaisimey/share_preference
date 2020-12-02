import 'package:flutter/material.dart';
import 'package:saving_object/model/user.dart';
import 'package:saving_object/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  final User user;

  const HomeView({Key key, this.user}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  User user;

  Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.network(user.photo),
            Row(
              children: [
                Text("Username :"),
                SizedBox(width: 20,),
                Text(user.name),
              ],
            ),

            Row(
              children: [
                Text("Gender :"),
                SizedBox(width: 20,),
                Text(user.gender),
              ],
            ),

            Row(
              children: [
                Text("Name :"),
                SizedBox(width: 20,),
                Text(user.username),
              ],
            ),
            Row(
              children: [
                Text("Password :"),
                SizedBox(width: 20,),
                Text(user.password),
              ],
            ),

            GestureDetector(
              onTap: () {
                clear();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()));

              },
              child: Padding(
                padding: const EdgeInsets.only(left:18.0,right: 18,top: 18,bottom: 40),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.purple
                    ),
                    child: Align(alignment: Alignment.center,child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold),))),
              ),
            ),



          ],
        )
      ),
    );
  }
}
