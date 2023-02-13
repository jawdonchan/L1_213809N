import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'pageview.dart';
import 'package:flutter/material.dart';


class TotalPage extends StatefulWidget {
  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  
  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (var order in orders) {
      _totalPrice += double.parse(order.price) * order.quantity;
    }
  }

  void _removeOrder(int index) {
    setState(() {
      orders.removeAt(index);
      _calculateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.all(40),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  Order order = orders[index];
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/' + order.imageUrl + '.png'),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              order.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
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
                                  Text("Quantity"),
                                  Text("${order.quantity}"),
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
                                  Text("\$${double.parse(order.price) * order.quantity}"),
                                   Container(
                            width: 100,
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                            IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeOrder(index),
                            ),],
                            ),
                            ),
                                ],
                              ),
                            ),
                               SizedBox(
                              height: 10,
                            ),
                           
                          ],
                        ),
                      ],
                    ),
                  );
                },
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
                },
  ),
    ),
      Container(
        padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 18
                        ),
                        ),
                        Text(
                        "\$${_totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPage()));
      },
      child: Icon(Icons.home_filled),),
    );
  }
}