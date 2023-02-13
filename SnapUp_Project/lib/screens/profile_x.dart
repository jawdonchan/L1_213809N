import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageX extends StatefulWidget {
  @override
  _ProfilePageStateX createState() => _ProfilePageStateX();
}

class _ProfilePageStateX extends State<ProfilePageX> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) {
  // handle the case where no image is selected
} else {
  setState(() {
    _image = File(image.path);
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: _image == null
                  ? AssetImage("images/pickupIcon.png")
                  : FileImage(_image),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              "johndoe@email.com",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: getImage,
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}