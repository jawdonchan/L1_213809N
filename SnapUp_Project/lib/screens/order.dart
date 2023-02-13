import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'package:SnapUp_Project/animation/quatity.dart';

class Cart {
final FoodItem foodItem;
final int quantity;

Cart({this.foodItem, this.quantity});
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
  }

  class _OrderPageState extends State<OrderPage> {
  final List<Cart> _carts = [];
  double _totalPrice = 0;

  void _addToCart(FoodItem foodItem, int quantity) {
  setState(() {
  _carts.add(Cart(foodItem: foodItem, quantity: quantity));
  _totalPrice += double.parse(foodItem.price) * quantity;
  });
  }

  void _removeFromCart(Cart cart) {
    setState(() {
    _carts.remove(cart);
    _totalPrice -= double.parse(cart.foodItem.price) * cart.quantity;
    });
    }

      @override
        Widget build(BuildContext context) {
          return Scaffold(
            drawer: NavBar(),
              appBar: AppBar(
                title: Text("Order Page"),
                ),
                body: Container(
                  padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                        child: ListView.builder(
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                        final foodItem = foodItems[index];
                        return ListTile(
                        title: Text(foodItem.name),
                        subtitle: Text("Price: \$${foodItem.price}"),
                        onTap: () {
                        showDialog(
                        context: context,
                        builder: (context) {
                        return QuantityPickerDialog(
                        onQuantitySelected: (quantity) {
                        Navigator.of(context).pop();
                        _addToCart(foodItem, quantity);
                        },
                        );
                        },
                        );
                        },
                        );
                        },
                        ),
                        ),
                        Container(
                        height: 120,
                        child: ListView.builder(
                        itemCount: _carts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        final cart = _carts[index];
                        return Container(
                        margin: EdgeInsets.all(8),
                        child: Card(
                        child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Text(cart.foodItem.name),
                        Text("x${cart.quantity}"),
                        Text("\$${double.parse(cart.foodItem.price) * cart.quantity}"),
                        IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                        _removeFromCart(cart);
                        },
                        )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
          padding: EdgeInsets.all(16),
          child: Column(
          children: <Widget>[
          Text("Total"),
          Text("\$${_totalPrice}"),
          ],
          ),
        )
        ],
      ),
    ),
  );
  }
}





