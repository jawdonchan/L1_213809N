import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/home.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/data/account.dart';

//import 'package:project_snapup/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String email, password;


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
                      "Register",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 800,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 800,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Email can't be empty";
                                }
                                if (!RegExp(
                                        r"[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              onSaved: (value) => email = value,
                              decoration: InputDecoration(
                                hintText: "Email",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 800,
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password can't be empty";
                                }
                                return null;
                              },
                              onSaved: (value) => password = value,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text("Register"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  MyData data =
                                      MyData(email: email, password: password);
                                  myData.add(data);
                                  print(myData);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
