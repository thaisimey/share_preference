import 'package:flutter/material.dart';
import 'package:saving_object/constant/constant.dart';
import 'package:saving_object/data/local_data.dart';
import 'package:saving_object/model/user.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  User user;
  LocalData localData = LocalData();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        var localUser = await localData.getUser(key: Constant.user);
        user = User.fromJson(localUser);
        print('local user ${user.name}');
      } catch (e) {
        print('error ${e}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background:
                      Image(image: NetworkImage(user.photo), fit: BoxFit.fill),
                )),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, top: 10),
                  child: Text(
                    user.name,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand-VariableFont_wght',
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text(
                    "Matinia Junior",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand-VariableFont_wght',
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Actively Looking ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: 'Quicksand-VariableFont_wght',
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.pinkAccent,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Text(
                            "Applied",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "98",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Text(
                            "Reviewed",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "98",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Contacted",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "98",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Quicksand-VariableFont_wght',
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Complete Profile",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily:
                                              'Quicksand-VariableFont_wght',
                                              color: Colors.white,
                                              decoration: TextDecoration.none),
                                        ),
                                        Text(
                                          "Personal | Job Experience | Certification",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                              'Quicksand-VariableFont_wght',
                                              color: Colors.white,
                                              decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Icon(Icons.arrow_right_alt),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
