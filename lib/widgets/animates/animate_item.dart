//一种弹出淡入的动画
import 'package:flutter/material.dart';

Widget animataSwitcher(int _counter, context) => AnimatedSwitcher(
      duration: Duration(
        seconds: 1,
      ),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Text(
        _counter.toString(),
        key: ValueKey(_counter),
        style: Theme.of(context).textTheme.headline4,
      ),
    );
