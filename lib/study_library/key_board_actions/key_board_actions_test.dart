import 'package:flutter/material.dart';
import 'package:xl_flutter/study_library/key_board_actions/sample.dart';
import 'package:xl_flutter/study_library/key_board_actions/sample1.dart';

import '../../my_text_button.dart';
import 'kb_content.dart';

///this is a custom key boary widget
///need know more info please to library url [https://pub.dev/packages/keyboard_actions]
class KeyBoardActionsTest extends StatefulWidget {
  @override
  _KeyBoardTestState createState() => _KeyBoardTestState();
}

class _KeyBoardTestState extends State<KeyBoardActionsTest> {
  var listTag = [
    "带有上卡和关闭的虚拟键盘",
    "带有自定义按键和函数的键盘",
    "自定义键盘",
  ];
  List<Widget> listWidget = [Sample(), Sample2(), Content()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeyBoardTest'),
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
