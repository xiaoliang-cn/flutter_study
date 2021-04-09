import 'package:flutter/material.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/widgets/animates/scrolling_parallax_effect.dart';

// ignore: must_be_immutable
class StudyAnimate extends StatelessWidget {
  var listTag = [
    '嵌入滑动的图片效果',
  ];
  List<Widget> listWidget = [ScrollingParallaxEffect()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimateStudy'),
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
