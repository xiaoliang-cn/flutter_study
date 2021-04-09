import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverSection extends State {
  final bool? infinite;
  SliverSection({this.infinite});
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: <Widget>[
        SliverAnimatedPaintExtent(
          duration: Duration(seconds: 1),
          child: Text(""),
        )
      ],
    );
  }
}
