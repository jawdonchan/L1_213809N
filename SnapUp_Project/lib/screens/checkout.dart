import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'totalcheck.dart';
import 'package:flutter/material.dart';
/*
class Order {
  final String name;
  final String imageUrl;
  final String price;
  final int quantity;

  Order({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    @required this.quantity,
  });
}
*/
class CheckoutPage extends StatefulWidget {
  final Order order;

  CheckoutPage({
    Key key,
    @required this.order,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
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
                            image: AssetImage('images/' + widget.order.imageUrl + '.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.order.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Quantity"),
                            Text("${widget.order.quantity}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Total"),
                            Text("\$${double.parse(widget.order.price) * widget.order.quantity}"),
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
              width: double.infinity,
              height: 100,
              child: RaisedButton(
                color: Color(0xFFfd2c2c),
                child: Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // perform checkout actions
                  setState(() {
                  orders.add(widget.order);
                  });
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TotalPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
