import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  double _borderRadius = 0;
  Color _color = Colors.blue;

  void _changeBackground() {
    setState(() {
      _borderRadius = _borderRadius == 0 ? 50 : 0;
      _color = _color == Colors.blue ? Colors.red : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackground,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }
}
