import 'package:flutter/material.dart';

class MyData {
  final String id;
  final String pwd;

  MyData(this.id, this.pwd);
}

class CartItem {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final String itemId;

  CartItem({this.itemName, this.itemPrice, this.itemImage, this.itemId});
}
