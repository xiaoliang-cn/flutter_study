import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math';

///study a to scroll to index library  [https://pub.dev/packages/scroll_to_index/]
class ScrollToIndexTest extends StatefulWidget {
  @override
  _ScrollToIndexTestState createState() => _ScrollToIndexTestState();
}

class _ScrollToIndexTestState extends State<ScrollToIndexTest> {
  static const maxCount = 100;
  final random = Random();
  final scrollDirection = Axis.horizontal;

  AutoScrollController? controller;
  List<List<int>>? randomList;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(

        ///设置边界，用于滑动后显示和上一个item 边距
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    randomList = List.generate(maxCount,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scrollToIndexTest"),
      ),
      body: ListView(
        scrollDirection: scrollDirection,
        controller: controller,
        children: randomList!.map<Widget>((data) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: _getRow(data[0], max(data[1].toDouble(), 50.0)),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );
  }

  int counter = -1;
  Future _scrollToIndex() async {
    setState(() {
      counter++;
      if (counter >= maxCount) counter = 0;
    });

    await controller!
        .scrollToIndex(counter, preferPosition: AutoScrollPosition.begin);

    //是否突出显示
    controller!.highlight(counter);
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 4),
              borderRadius: BorderRadius.circular(12)),
          child: Text('index: $index, height: $height'),
        ));
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: controller!,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}
