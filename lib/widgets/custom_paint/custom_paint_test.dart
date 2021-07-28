import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/custom_paint/paint_path.dart';

import '../../my_text_button.dart';

class CustomPaintTest extends StatelessWidget {
  CustomPaintTest({Key? key}) : super(key: key);
  final listTag = ['绘制时钟例子(未完成)'];
  final listWidget = [PaintPathTest()];
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
