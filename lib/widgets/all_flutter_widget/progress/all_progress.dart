import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/custom_appbar.dart';

import 'package:xl_flutter/my_widget.dart';
import 'flutter_advanced_progress_test.dart';

// ignore: must_be_immutable
class AllProgressWidget extends StatelessWidget {
  var listTag = [
    'AdvancedProgress一款强大的自定义progress',
  ];
  List<Widget> listWidget = [
    AdvancedProgressTest(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "all_progress",
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
