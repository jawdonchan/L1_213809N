import 'package:SnapUp_Project/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/fooddetail.dart';
import 'package:flutter/rendering.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'package:SnapUp_Project/animation/ScaleRoute.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  CartPage({
    Key key,
    @required this.name,
    @required this.imageUrl,
    @required this.rating,
    @required this.numberOfRating,
    @required this.price,
    @required this.slug,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/' + widget.imageUrl + '.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(widget.rating),
                          SizedBox(
                            width: 5,
                          ),
                          Text("(${widget.numberOfRating})")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.black,
                              iconSize: 30,
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add),
                              color: Color(0xFFfd2c2c),
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Text("Total"),
      Text("\$${double.parse(widget.price) * quantity}")
        ],
          ),
            ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 100,
                  child: RaisedButton(
                  color: Color(0xFFfd2c2c),
                  child: Text(
                  "Proceed to Checkout",
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                  // perform checkout actions
                  Order checkout = new Order(
                    name: widget.name, 
                    imageUrl: widget.imageUrl,
                    rating: widget.rating,
                    numberOfRating: widget.numberOfRating,
                    price: widget.price,
                    quantity: quantity); 
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutPage(order: checkout,)));
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
  }


