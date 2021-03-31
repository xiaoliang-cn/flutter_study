//一种背景模糊的
import 'dart:ui';
import 'package:flutter/material.dart';

Widget backgroundFilter(Widget child) => Stack(
      fit: StackFit.passthrough,
      children: [
        Text('0' * 10000),
        Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: ClipRect(
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: child,
              ),
            ),
          ),
        )
      ],
    );
