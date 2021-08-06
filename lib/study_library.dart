import 'package:flutter/material.dart';
import 'package:xl_flutter/encrypt/main_encrypt.dart';
import 'package:xl_flutter/study_library/bloc/flutter_bloc/bloc_timer/bloc_ticker_test.dart';
import 'package:xl_flutter/study_library/file_picker/file_picker_test.dart';
import 'package:xl_flutter/study_library/flash/flash.test.dart';
import 'package:xl_flutter/study_library/flutter_signin_button/flutter_signin_button_test.dart';
import 'package:xl_flutter/study_library/flutter_slidable/flutter_slidable_test.dart';
import 'package:xl_flutter/study_library/get/get_test.dart';
import 'package:xl_flutter/study_library/getwidget/get_widget_test.dart';
import 'package:xl_flutter/study_library/hive/hive_box_test.dart';
import 'package:xl_flutter/study_library/hooks/hooks_test.dart';
import 'package:xl_flutter/study_library/just_audio/just_audio_test.dart';
import 'package:xl_flutter/study_library/key_board_actions/key_board_actions_test.dart';
import 'package:xl_flutter/study_library/rx_data/rx_data_test.dart';
import 'package:xl_flutter/study_library/sliver_tools/sliver_tools_test.dart';
import 'package:xl_flutter/study_library/translator/translator_test.dart';

import 'my_text_button.dart';
import 'study_library/cache_manager/flutter_cache_manager_test.dart';
import 'study_library/charcode/charcode_test.dart';
import 'study_library/connectivity/connectivity_test.dart';
import 'study_library/flutter_downloader/flutter_downloader_test.dart';
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
    'hive一款nosql数据库',
    'getX框架学习',
    'slidable滑动选择框架',
    'rx_dart学习',
    'file_picker文件选择器',
    'translator翻译',
    'downloader下载器',
    '网络状态监听Connectivity',
    '加密相关',
    'getWidget-ui框架',
    'hooks_tesdt'
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
    HiveTest(),
    GetTest(),
    FlutterSlidableTest(),
    RxDataTest(),
    FilePickerTest(),
    TranSlatorTest(),
    FlutterDownloaderTest(),
    ConnectivityTest(),
    MianEncrypt(),
    GetWidgetTest(),
    HooksTest()
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
