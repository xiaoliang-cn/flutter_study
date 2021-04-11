import 'package:flutter/material.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/widgets/animates/animations/animations_test.dart';
import 'package:xl_flutter/widgets/animates/scrolling_parallax_effect.dart';
import 'package:xl_flutter/widgets/animates/simple_animations/simple_animations_test.dart';

// ignore: must_be_immutable
class StudyAnimate extends StatelessWidget {
  var listTag = [
    '嵌入滑动的图片效果',
    'animations-强大的动画库',
    'simpleAnimations-一款部件的小部件动画',
  ];
  List<Widget> listWidget = [
    ScrollingParallaxEffect(),
    AnimationsTest(),
    SimpleAnimationsTest()
  ];
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
