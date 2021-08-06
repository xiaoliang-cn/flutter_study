import 'dart:math';

import 'package:flutter/material.dart';

class PaintPathTest extends StatelessWidget {
  const PaintPathTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: PaintPath1(),
      ),
    ));
  }
}

class PaintPath1 extends CustomPainter {
  Paint mpaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    // Path path = Path();
    // path.moveTo(100,200);
    // path.lineTo(100,300);
    // path.lineTo(150, 200);
    // canvas.drawPath(path, mpaint);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 - 10,
        Paint()
          ..color = Colors.purple
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.0);

    canvas.drawLine(
        Offset(size.width / 2, size.height / 2),
        Offset(size.width / 2 + 30, size.height / 2 + 40),
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 2.0);
    canvas.drawLine(
        Offset(size.width / 2, size.height / 2 - 1),
        Offset(size.width / 2, size.height / 2 + 20),
        Paint()
          ..color = Colors.black45
          ..strokeWidth = 4.0);

    canvas.drawCircle(Offset.zero, 100, Paint()..color = Colors.yellow);
    canvas.drawCircle(Offset(size.width, 0), 100, Paint()..color = Colors.blue);
    canvas.drawCircle(
        Offset(size.width, size.height), 100, Paint()..color = Colors.red);
    canvas.drawCircle(
        Offset(0, size.height), 100, Paint()..color = Colors.green);

var radius = min(size.width / 2 -30, size.height / 2);
    var circleRaidus = radius * .012;
    for (int i = 0; i < 24; i++) {
      // print(i);
      var angle = i * 360 / 24;
      var a = -angle * pi / 180;
      print("angle=$angle");
      print("a=$a");
      print("cosa=${cos(a)}");
      print("sina=${sin(a)}");
      print("size.width / 2 + radius * cos(a)=${size.width / 2 + radius * cos(a)}");
      var point = Offset(size.width / 2 + radius * cos(a),
          size.height /2+ radius * sin(a));
      canvas.drawCircle(point,circleRaidus * 2,mpaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
