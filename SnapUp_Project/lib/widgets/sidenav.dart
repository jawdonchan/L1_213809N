import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/profile.dart';
import 'package:SnapUp_Project/screens/pageview.dart';
import 'package:SnapUp_Project/screens/order.dart';
import 'package:SnapUp_Project/data/account.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/screens/profile_x.dart';
import 'package:SnapUp_Project/screens/Location.dart';
import 'package:SnapUp_Project/screens/animated.dart';

class NavBar extends StatefulWidget {
  String name = email.text.split('@')[0];
  @override
  State<StatefulWidget> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.blueGrey[300],
          child: ListView(
            children: [ 
              UserAccountsDrawerHeader(               
                accountName: Text(widget.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                accountEmail: Text(email.text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),) ,
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(child: Image.asset('images/pickupIcon.png')),
                ),
              ),
              
            ListTile(
              leading: Icon(Icons.person),
              //tileColor: Colors.tealAccent,
                title: Text('Profile: ' + widget.name),
                onTap: () {
                     MyData data = new MyData(email: email.text,password: pwdacc.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                data: data,
                              )));
                },
              ),
               SizedBox(height: 20),
             ListTile(
              leading: Icon(Icons.unarchive),
             // tileColor: Colors.tealAccent,
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PromptPage()));
                },
              ),
              SizedBox(height: 20),
                  ListTile(
                  leading: Icon(Icons.home),
                 //  tileColor: Colors.tealAccent,
                  title: Text("Home"),
                  onTap: () {
                    MyData data = new MyData(email: email.text,password: pwdacc.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewPage(data: data)));
                  },
                ),
                /*
                SizedBox(height: 20),
                  ListTile(
                  leading: Icon(Icons.home),
                 //  tileColor: Colors.tealAccent,
                  title: Text("Animated"),
                  onTap: () {
                    //MyData data = new MyData(email: email.text,password: pwdacc.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedBackground()));
                  },
                ),
                */
            ],
          ),
        ),
      );
  }
}
