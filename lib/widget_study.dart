// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/expand_widget/expansion_panel.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/switch_widget/switch_widget.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/widgets/f_rotated_box.dart';
import 'package:xl_flutter/widgets/cupertinos/cupertinos.dart';
import 'package:xl_flutter/widgets/longPress/focused_menu_holder_test.dart';
import 'my_text_button.dart';
import 'my_widget.dart';
import 'widgets/semantics/merges_semantics.dart';

///F 官方小部件
// ignore: must_be_immutable
class StudyFlutterWidget extends StatelessWidget {
  var listTag = [
    'Switch部件',
    "FRotatedBox",
    'progress小部件',
    '语义小部件',
    'Ios风格小部件',
    '展开小部件',
    '焦点点击弹窗Menu',
  ];
  List<Widget> listWidget = [
    AllSwitchWidget(),
    FRotatedBox(),
    AllProgressWidget(),
    MergesWidges(),
    CupertionsWidget(),
    ExpansionPanelTest(),
    FocusedMenuHolderTest()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterWidget学习'),
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
