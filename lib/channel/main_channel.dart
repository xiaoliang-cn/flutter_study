




import 'package:flutter/material.dart';

import '../my_text_button.dart';

class MainChannel extends StatelessWidget {
  final listTag = [
    '地理围栏',
  ];
  final listWidget = [
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通道学习'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          for (var i = 0; i < listTag.length; i++)
            MyTextButton(tag: listTag[i], child: listWidget[i])
        ],
      ),
    );
  }
}
