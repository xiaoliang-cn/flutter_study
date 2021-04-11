import 'package:flutter/material.dart';
import 'package:xl_flutter/study_library/bloc/flutter_bloc/bloc_timer/bloc_ticker_test.dart';
import 'package:xl_flutter/study_library/flash/flash.test.dart';
import 'package:xl_flutter/study_library/flutter_signin_button/flutter_signin_button_test.dart';
import 'package:xl_flutter/study_library/just_audio/just_audio_test.dart';
import 'package:xl_flutter/study_library/key_board_actions/key_board_actions_test.dart';
import 'package:xl_flutter/study_library/sliver_tools/sliver_tools_test.dart';

import 'my_text_button.dart';
import 'study_library/cache_manager/flutter_cache_manager_test.dart';
import 'study_library/charcode/charcode_test.dart';
import 'study_library/photo_view/photo_view_test.dart';
import 'study_library/scroll_to_index/scroll_to_index.test.dart';

/// study libarary test
// ignore: must_be_immutable
class StudyLibrary extends StatelessWidget {
  var listTag = [
    "flutter_cache_manager文件缓存",
    "photo_view图片操作",
    "scroll_to_index滑动指定item",
    "字符串常量",
    'flutter_signin_button各种登陆按键widget',
    'flash各种snackBar-toast-dialog',
    'bloc',
    'sliver_tools_滑动工具',
    'key_board_actions键盘工具',
    'just_audio音乐播放器',
  ];
  List<Widget> listWidget = [
    CaCheManagerTEST(),
    PhotoViewTest(),
    ScrollToIndexTest(),
    CharCodeTest(),
    FlutterSigninButtonTest(),
    FlashPageTest(
      title: '',
    ),
    BlocTickerTest(),
    SLiverToolsTest(),
    KeyBoardActionsTest(),
    JustAudioTest(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StudyLibrary'),
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
