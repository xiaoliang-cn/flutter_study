import 'package:flutter/material.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/widgets/animates/animations/animations_test.dart';
import 'package:xl_flutter/widgets/animates/animations/im_chat/im_chat_%20gradient.dart';
import 'package:xl_flutter/widgets/animates/animations/loading_widget.dart';
import 'package:xl_flutter/widgets/animates/scrolling_parallax_effect.dart';
import 'package:xl_flutter/widgets/animates/simple_animations/simple_animations_test.dart';
import 'package:xl_flutter/widgets/animates/transform/transform_exmple.dart';

// ignore: must_be_immutable
class StudyAnimate extends StatelessWidget {
  var listTag = [
    '嵌入滑动的图片效果',
    'animations-强大的动画库',
    'simpleAnimations-一款部件的小部件动画',
    '带有渐变的聊天气泡效果',
    '带微光的加载状态',
    'TransForm例子',
  ];
  List<Widget> listWidget = [
    ScrollingParallaxEffect(),
    AnimationsTest(),
    SimpleAnimationsTest(),
    ImChatGradient(),
    ExampleUiLoadingAnimation(),
    TransFormExmple()
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
