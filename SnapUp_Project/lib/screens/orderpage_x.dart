import 'package:flutter/material.dart';
import 'package:SnapUp_Project/screens/cartpage_x.dart';
import 'package:SnapUp_Project/data/item_x.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  List<CartItem> _cartItems = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  void addToCart(CartItem item) {
    setState(() {
      _cartItems.add(item);
    });
  }

  void removeFromCart(CartItem item) {
    setState(() {
      _cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: _cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an item name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Item price'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an item price';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  addToCart(CartItem(itemId: 'item1', itemName: _nameController.text, itemImage: 'imageUrl', itemPrice: double.parse(_priceController.text)));
                }
              },
              child: Text('Add to Cart'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cartItems[index].itemName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeFromCart(_cartItems[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

