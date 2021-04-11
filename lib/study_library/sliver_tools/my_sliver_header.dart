import 'package:flutter/material.dart';

///sliver_tools should custom view head
class MySliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Text("head");
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this.runtimeType != oldDelegate.runtimeType;
  }
}
