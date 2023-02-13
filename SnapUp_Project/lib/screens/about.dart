import 'package:SnapUp_Project/screens/home.dart';
import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/widgets/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/screens/feedback.dart';
import 'call.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
//import 'package:SnapUp_Project/screens/settings.dart';

class AboutPage extends StatefulWidget {
  //final MyData data; //hold data passed into this page
  

  @override
  State<StatefulWidget> createState() => AboutPageState();
}

Widget expandsion(String name, String description)
{
   return  ExpansionTileCard(
  title: Text(
    name,
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  ),
  children: <Widget>[
    Container(
      child: Text(
        description,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),
      //padding: EdgeInsets.only(bottom: 30),
    ),
  ],
          );
}

class AboutPageState extends State<AboutPage> {
   Color _color1 = Colors.blue;
  Color _color2 = Colors.red;
   void _changeColors() {
    setState(() {
      _color1 = Colors.green;
      _color2 = Colors.yellow;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text(
            "About Us",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 7, color: Colors.grey)),
            child: Icon(
              Icons.settings_bluetooth,
              size: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          expandsion('Application Info', 'Apply here for the jobs'),
          expandsion('Email', '213809N@mymail.nyp.edu.sg'),
          expandsion('Contact No', '+65 8778 8740'),
          expandsion('Developers Info', 'Jordan Chan, 213809N'),
  ],
),
      ),
    floatingActionButton: SpeedD(),
    );
  }
}
