import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/screens/pageview.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/account.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/screens/orderpage_x.dart';
import 'package:SnapUp_Project/screens/updateprofile.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  MyData data;
   String name = email.text.split('@')[0];
  //final MyData data; //hold data passed into this page
  ProfilePage({Key key, @required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  // bool color = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) {
  // handle the case where no image is selected
} else {
  setState(() {
    _image = File(image.path);
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Profile"),

        backgroundColor: Colors.blueGrey,
        //utomaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1509023464722-18d996393ca8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
           // margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: _image == null
                  ? AssetImage("images/pickupIcon.png")
                  : FileImage(_image),
            ),
          ),
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w800
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.data.email,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Customer",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: Colors.blueGrey[700],
            //margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: getImage,
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        //backgroundColor: Colors.blueGrey
                      ),
                     // textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                    RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text('Update Profile'),
                        onPressed: () {
                           MyData data = new MyData(email: widget.data.email,password: widget.data.password);
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatePage(
                                        data: data,
                                      )));
                          //_updateAcc(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
