import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/home.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:SnapUp_Project/screens/signin.dart';

import 'package:SnapUp_Project/style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PromptPage(),
    );
  }
}

Widget buildLogo() {
  return Container(
    //margin: EdgeInsets.only(top: 0, bottom: 0.5),
    height: 50,
    alignment: Alignment.topCenter,
    child: Text(
      "Snap Up",
      // textAlign: TextAlign.start,
      style: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
    ),
  );
}

Widget build_login(String logintype) {
  //, String logo) {
  return ElevatedButton(
    onPressed: () {},
    child: Container(
      width: 295,
      height: 44,
      alignment: Alignment.center,
      child: Text('$logintype'),
    ),
  );
}

Widget build_OrWidget() {
  return Container(
    margin: EdgeInsets.all(2),
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            indent: 50,
            height: 2,
            color: Colors.black,
          ),
        ),
        const Text("  or  "),
        Expanded(
          child: Divider(
            endIndent: 50,
            height: 3,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

class PromptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 120.0),

            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/Logo.png",
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Snap Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //Text("Snap up"),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[600],
              ),
              height: 250.0,
              child: Column(
                children: <Widget>[
                  Row( 
                    children: <Widget>[ 
                      Expanded(
                        child: FlatButton(
                          color: Colors.redAccent,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Expanded(
                        child: FlatButton(
                          color: facebookColor,
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row( 
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: dbasicGreyColor,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Or connect with social",
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: dbasicGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: facebookColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        /*
                        Icon(
                          FontAwesomeIcons.facebookSquare,
                          color: Colors.white,
                        ), */
                        Expanded(
                          child: Text(
                            "Login with Facebook",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        /*
                        Icon(
                          FontAwesomeIcons.google,
                          color: _theme.primaryColor,
                        ),  */
                        Expanded(
                          child: Text(
                            "Login with Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
