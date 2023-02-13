import 'package:SnapUp_Project/main.dart';
import 'package:SnapUp_Project/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/account.dart';
import 'package:SnapUp_Project/screens/pageview.dart';
import 'package:SnapUp_Project/screens/profile.dart';
import 'package:SnapUp_Project/screens/orderpage_x.dart';
import 'package:SnapUp_Project/data/account.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';

class UpdatePage extends StatefulWidget {
  final MyData data;

  //final MyData data; //hold data passed into this page

  UpdatePage({Key key, @required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() => UpdatePageState();
}


class UpdatePageState extends State<UpdatePage> {
  // bool color = false;
  //TextEditingController name = new TextEditingController();
    TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Widget updateinput(String type, TextEditingController x) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Update ${type}'.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
              color: Color(0xFF9CA4AA),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          alignment: Alignment.center,
          child: TextField(
            controller: x,
            decoration: InputDecoration(
              hintText: '${type}',
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[400],
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              contentPadding: const EdgeInsets.all(20),
            ),
          ),
        ),
      ],
    );
  }

void _updateData() {
  MyData updatedData = new MyData(email: email.text,password: password.text);
  // Perform the update operation here, for example, call an API to update the data on the server
  // ...

  // Navigate back to the profile page with the updated data
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder: (context) => ProfilePage(data: updatedData)
    )
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: NavBar(),
     /* Drawer(
        child: Container(
          color: Colors.blueGrey[300],
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('${widget.data.email}'),
                accountEmail: Text('example@gaymail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(child: Image.asset('images/pickupIcon.png')),
                ),
              ),
              
            ListTile(
              leading: Icon(Icons.person),
              tileColor: Colors.tealAccent,
                title: Text(widget.data.email + ': Profile'),
                onTap: () {
                     MyData data = new MyData(email: widget.data.email,password: widget.data.password);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                data: data,
                              )));
                },
              ),
               SizedBox(height: 20),
             ListTile(
              leading: Icon(Icons.unarchive),
              tileColor: Colors.tealAccent,
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PromptPage()));
                },
              ),
              SizedBox(height: 20),
                  ListTile(
                  leading: Icon(Icons.home),
                   tileColor: Colors.tealAccent,
                  title: Text("Home"),
                  onTap: () {
                    MyData data = new MyData(email: widget.data.email,password: widget.data.password);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewPage(data: data)));
                  },
                ),

                SizedBox(height: 20),
              //OrderPageX
               ListTile(
                leading: Icon(Icons.shopping_cart),
                tileColor: Colors.tealAccent,
                title: Text('OrderPageX'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                },
              ), 
            ],
          ),
        ),
      ), 
      */
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(''),

        backgroundColor: Colors.white,
        //utomaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           // updateinput('name', name),
            updateinput('email', email),
            updateinput('password', password),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Update Profile'),
              onPressed: _updateData,
            ),

          ],
        ),
      ),
    );
  }
/*
  void _updateDataBack(BuildContext context) {
    MyData data = new MyData(widget.profile.id, widget.profile.pwd);
    Navigator.pop(
      context,
      data,
    );
  } */
}
