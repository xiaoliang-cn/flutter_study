import 'package:flutter/material.dart';
import 'package:xl_flutter/study_library/get/get_test/getx_route_test.dart';
import '../../my_widget.dart';
import 'get_test/timer_impl.dart';

///study get frame
///this is a number one  getX frame
///usr need use it

// ignore: must_be_immutable
class GetTest extends StatelessWidget {
  var listTag = [
    'GetX计时器实现',
    'Getx导航实现',
  ];
  List<Widget> listWidget = [GetToTimerImpl(), GetXRouteTest()];
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
