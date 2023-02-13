import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/locations.dart';
import 'package:location/location.dart';


class SelectLocationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(locations[index]),
              onTap: () {
                  
                Navigator.pop(context, locations[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

