import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/home.dart';
import 'package:SnapUp_Project/screens/profile.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/data/account.dart';
import 'package:SnapUp_Project/screens/pageview.dart';



TextEditingController email = new TextEditingController();
TextEditingController pwdacc = new TextEditingController();

final _formKey = GlobalKey<FormState>();


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  /*
  List<MyData> myData = [
    MyData("james@email.com", "password"),
    MyData("john@email.com", "password123"),
    MyData("jane@email.com", "p@ssword"),
  ];
  */
  String _validateEmail(String email) {
    if (!email.contains('@') || !email.endsWith('.com'))
      return 'Please enter a valid email address';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.red,
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Log In",
                      style: //_theme.textTheme.title.merge(
                          TextStyle(fontSize: 30.0),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 800,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Email can't be empty";
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              // onSaved: (value) => email = value,
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                                labelText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.grey[400],
                                )),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.redAccent)),
                              ),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0,
                                  color: Color(0xFF9CA4AA)),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password can't be empty";
                              }
                              return null;
                            },
                            controller: pwdacc,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                              labelText: "Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: Colors.grey[400],
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.redAccent)),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                color: Color(0xFF9CA4AA)),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                 Container(
  width: MediaQuery.of(context).size.width,
  height: 45.0,
  child: RaisedButton(
    color: Colors.redAccent,
    onPressed: () {
      if (_formKey.currentState.validate()) {
        // Perform login
        String eMail = email.text;
        String password = pwdacc.text;

        // Check if user exists in MyData list
        bool userExists = false;
        MyData acc;
        //myData is the List of Users
        for (MyData data in myData) {
          if (data.email == eMail && data.password == password) {
            userExists = true;
            acc = data;
            break;
          }
        }

        if (userExists) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewPage(data: acc)),
          );
        } else {
          // Show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Please enter the correct values."),
                actions: [
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    },
    child: Text(
      "Login",
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  ),
),

                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}