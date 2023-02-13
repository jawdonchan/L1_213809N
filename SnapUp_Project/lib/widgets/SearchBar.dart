import 'package:SnapUp_Project/main.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/register.dart';
import 'package:SnapUp_Project/widgets/PopularFoods.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'package:SnapUp_Project/screens/about.dart';
import 'package:SnapUp_Project/widgets/topMenu.dart';
import 'package:SnapUp_Project/widgets/SearchFood.dart';

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
width: 0,
color: Color(0xFFfb3132),
style: BorderStyle.none,
),
),
filled: true,
prefixIcon: Icon(
Icons.search,
color: Color(0xFFfb3132),
),
fillColor: Color(0xFFFAFAFA),
suffixIcon: Icon(
Icons.sort,
color: Color(0xFFfb3132),
),
hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
hintText: "What would your like to buy?",
),
onSubmitted: (value) {
showSearch(
context: context, delegate: FoodItemSearchDelegate(_controller.text));
},
),
);
}
}

class SearchBar extends StatefulWidget {
@override
_SearchBarState createState() => _SearchBarState();
}

