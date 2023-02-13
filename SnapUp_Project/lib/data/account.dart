import 'package:flutter/material.dart';

class MyData {
  String email;
  String password;

  MyData({
    @required this.email,
    @required this.password,
  });
}

List<MyData> myData = [
  MyData(email: "james@email.com", password: "password"),
  MyData(email: "john@email.com", password: "password123"),
  MyData(email: "jane@email.com", password: "p@ssword"),
];

/*
class MyData {
  final String name;
  final String id;
  final String pwd;

  MyData(this.name,this.id, this.pwd);

}

class DataList {
  List<MyData> users = [];

  addUser(String name, String email, String password) {
    MyData user = MyData(name, email, password);
    users.add(user);
  }
}
*/