import 'dart:collection';
import 'package:flutter/material.dart';

class FoodItem {
String name;
String imageUrl;
String rating;
String numberOfRating;
String price;
String slug;

FoodItem({
this.name,
this.imageUrl,
this.rating,
this.numberOfRating,
this.price,
this.slug,
});
}

List<FoodItem> foodItems = [
  FoodItem( //0
    name: "Fried Egg",
    imageUrl: "ic_popular_food_1",
    rating: "4.9",
    numberOfRating: "200",
    price: "15.06",
    slug: "fried_egg"
  ),
   FoodItem(//1
    name: "Mixed Vegetable",
    imageUrl: "ic_popular_food_3",
    rating: "4.9",
    numberOfRating: "100",
    price: "17.03",
    slug: "",
  ),
  FoodItem(//2
    name: "Salad With Chicken",
    imageUrl: "ic_popular_food_4",
    rating: "4.0",
    numberOfRating: "50",
    price: "11.00",
    slug: "",
  ),
  FoodItem(//3
     name: "Mixed Salad",
            imageUrl: "ic_popular_food_5",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""
    ),
  FoodItem( //4
    name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""
            ),
 
    FoodItem(//5
      name: "Potato,Meat fry",
            imageUrl: "ic_popular_food_6",
            rating: "4.2",
            numberOfRating: "70",
            price: "23.0",
            slug: ""
            ),
    FoodItem(//6
       name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""
            ),
  // Add more food items here
];

List<FoodItem> filtered = [
  FoodItem( //0
    name: "Fried Egg",
    imageUrl: "ic_popular_food_1",
    rating: "4.9",
    numberOfRating: "200",
    price: "15.06",
    slug: "fried_egg"
  ),
   FoodItem(//1
    name: "Mixed Vegetable",
    imageUrl: "ic_popular_food_3",
    rating: "4.9",
    numberOfRating: "100",
    price: "17.03",
    slug: "",
  ),
  FoodItem(//2
    name: "Salad With Chicken",
    imageUrl: "ic_popular_food_4",
    rating: "4.0",
    numberOfRating: "50",
    price: "11.00",
    slug: "",
  ),
  FoodItem(//3
     name: "Mixed Salad",
            imageUrl: "ic_popular_food_5",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""
    ),
  FoodItem( //4
    name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""
            ),
 
    FoodItem(//5
      name: "Potato,Meat fry",
            imageUrl: "ic_popular_food_6",
            rating: "4.2",
            numberOfRating: "70",
            price: "23.0",
            slug: ""
            ),
    FoodItem(//6
       name: "Red meat,Salad",
            imageUrl: "ic_popular_food_2",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""
            ),
  // Add more food items here
];
class Order {
  String imageUrl;
   String name;
   String rating;
   String numberOfRating;
   String price;
  int quantity;

  Order({
    @required this.imageUrl,
    @required this.name,
    @required this.rating,
    @required this.numberOfRating,
    @required this.price,
    @required this.quantity,
  });
}
List<Order> orders = [];