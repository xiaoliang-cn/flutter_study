import 'package:flutter/material.dart';
import 'package:xl_flutter/encrypt/rsa_test.dart';

import '../my_text_button.dart';

class MianEncrypt extends StatelessWidget {
  MianEncrypt({Key? key}) : super(key: key);
  final listTag = [
    'RSA加密',
  ];
  final listWidget = [
     RASTest()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加密学习'),
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
