import 'package:SnapUp_Project/main.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/widgets/PopularFoods.dart';
import 'package:SnapUp_Project/widgets/RecommendFood.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/widgets/SearchBar.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:SnapUp_Project/widgets/topMenu.dart';
import 'package:SnapUp_Project/widgets/SearchFood.dart';
import 'Location.dart';

class HomePage extends StatefulWidget {
  //final MyData data; //hold data passed into this page
  TextEditingController search = new TextEditingController();
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _location = "124 Conch Street";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: 
      AppBar(
        automaticallyImplyLeading: false,
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () async{
            final result = await
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectLocationPage()),
            );
            if (result != null){
                setState(() {
                    _location = result;
                  });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Deliver to",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Color.fromRGBO(238, 100, 83, 1),
                    ),
                    SizedBox(width: 2.5),
                    Text(
                      _location,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 26.0,
              color: Colors.black45,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.receipt,
              size: 26.0,
              color: Colors.black45,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8.0),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchBar(), //search bar
            TopMenus(),
            PopularFoodsWidget(),
             RecFoodsWidget(),
          ],
        ),
      ),
    );
  }
}
