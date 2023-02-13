import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/item_x.dart';
import 'package:SnapUp_Project/screens/orderpage_x.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  CartPage({Key key, @required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.cartItems.length; i++) {
      totalPrice += widget.cartItems[i].itemPrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(widget.cartItems[index].itemImage),
                  title: Text(widget.cartItems[index].itemName),
                  subtitle: Text(
                      "Price: \$ ${widget.cartItems[index].itemPrice.toString()}"),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerRight,
            child: Text("Total: \$ ${totalPrice.toString()}"),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text("Checkout"),
              onPressed: () {
                // code for checkout process
              },
            ),
          ),
        ],
      ),
    );
  }
}
