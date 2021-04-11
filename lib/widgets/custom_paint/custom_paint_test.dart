import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class CustomPaintTest extends StatefulWidget {
  @override
  _CustomPaintTestState createState() => _CustomPaintTestState();
}

class _CustomPaintTestState extends State<CustomPaintTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaintTest'),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: CustomPaintText(),
        ),
      ),
    );
  }
}

class CustomPaintText extends CustomPainter {
  Paint mPaint = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round
    // ..blendMode = BlendMode.colorBurn
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 100),
        mPaint);
// 用颜色填充整个绘制区域
    canvas.drawPaint(Paint()..color = Colors.blue);
// 在绘制区域以外绘制一个矩形
    canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), Paint()..color = Colors.red);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
