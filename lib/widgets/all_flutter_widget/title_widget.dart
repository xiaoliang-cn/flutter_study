import 'package:flutter/material.dart';

///带有标题的widget 一般用于介绍此widget的名称
class TitleWidget extends StatelessWidget {
  final String title;
  final Widget child;
  TitleWidget({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title + '：小部件',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        child
      ],
    );
  }
}
