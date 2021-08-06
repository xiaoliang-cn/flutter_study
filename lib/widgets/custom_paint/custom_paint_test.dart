import 'package:flutter/material.dart';

class Matrix4Test extends StatefulWidget {
  @override
  _Matrix4TestState createState() => _Matrix4TestState();
}

class _Matrix4TestState extends State<Matrix4Test> {

  double x = 1;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4.diagonal3Values(2, 1, 1),
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = details.globalPosition.dy;
                x = details.globalPosition.dx;
              });
            },
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}