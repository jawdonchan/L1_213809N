import 'package:SnapUp_Project/screens/home.dart';
import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/cart.dart';
import 'package:SnapUp_Project/data/account.dart';
//import 'package:SnapUp_Project/screens/profile_x.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/screens/order.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/screens/totalcheck.dart';
import 'package:SnapUp_Project/screens/profile.dart';
import 'filter.dart';

class ViewPage extends StatefulWidget {
  final MyData data; //hold data passed into this page
  ViewPage({this.data});
  //const ViewPage({Key key, @required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ViewPageState();
}

class ViewPageState extends State<ViewPage> {
  int _selectedIndex = 0;
  final List pages = [
    HomePage(),
   // OrderPage(),
    TotalPage(),
    FilterPage(),
    AboutPage(),
  ];
  void onTappedBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[100],
        currentIndex: _selectedIndex,
        onTap: onTappedBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wheelchair_pickup_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter), label: 'Filter'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_bluetooth), label: 'About'),
        ],
      ),
      drawer: NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(''),
        backgroundColor: Colors.white,
        //utomaticallyImplyLeading: false,
        elevation: 0.0,
      ),
    );
  }
}
