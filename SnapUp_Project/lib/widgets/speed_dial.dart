import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:SnapUp_Project/screens/feedback.dart';
import 'package:SnapUp_Project/screens/call.dart';

class SpeedD extends StatefulWidget{
  @override
  _SpeedDState createState() => _SpeedDState();
}
class _SpeedDState extends State<SpeedD> {
  @override
  Widget build(BuildContext context) {
return SpeedDial(
  icon: Icons.add,
  buttonSize: 56.0,
  visible: true,
  closeManually: true,
  curve: Curves.bounceIn,
  children: [
    SpeedDialChild(
      child: Icon(Icons.feedback),
      backgroundColor: Colors.blueAccent,
      label: 'Feedback',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedbackPage()),
        );
      },
    ),
    SpeedDialChild(
      child: Icon(Icons.call),
      backgroundColor: Colors.greenAccent,
      label: 'Call',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CallPhonePage()),
        );
      },
    ),
  ],
);
 }
}