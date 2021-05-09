import 'package:flutter/material.dart';

class UnKnownRoutePage404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找不到当前页'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text("抱歉,未找到当前页"),
      ),
    );
  }
}
