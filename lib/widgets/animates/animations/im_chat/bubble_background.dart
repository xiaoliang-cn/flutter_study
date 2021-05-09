import 'dart:ui' as ui;

import 'package:flutter/material.dart';

@immutable // 类不可变的
class BubbleBackground extends StatelessWidget {
  const BubbleBackground({
    Key? key,
    required this.colors,
    this.child,
  }) : super(key: key);

  final List<Color> colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (Scrollable.of(context) == null) {
      return Center();
    }
    return CustomPaint(
      painter: BubblePainter(
          colors: colors,
          scrollableState: Scrollable.of(context)!,
          bubbleContext: context),
      child: child,
    );
  }
}

class BubblePainter extends CustomPainter {
  BubblePainter({
    required List<Color> colors,
    required ScrollableState scrollableState,
    required BuildContext bubbleContext,
  })   : _colors = colors,
        _bubbleContext = bubbleContext,
        _scrollableState = scrollableState;

  final List<Color> _colors;
  final BuildContext _bubbleContext;
  final ScrollableState _scrollableState;

  @override
  void paint(Canvas canvas, Size size) {
    //重点掌握 这些类能获取到的主要信息
    RenderBox scrollableBox =
        _scrollableState.context.findRenderObject() as RenderBox;
    final scrollableRect = Offset.zero & scrollableBox.size;
    //绘制
    final bubbleBox = _bubbleContext.findRenderObject() as RenderBox;
    final origin =
        bubbleBox.localToGlobal(Offset.zero, ancestor: scrollableBox);
    final mPaint = Paint();
    mPaint
      ..shader = mPaint.shader = ui.Gradient.linear(
        scrollableRect.topCenter,
        scrollableRect.bottomCenter,
        _colors,
        [0.0, 1.0],
        TileMode.clamp,
        Matrix4.translationValues(-origin.dx, -origin.dy, 1.0).storage,
      );
    canvas.drawRect(Offset.zero & size, mPaint);
  }

  @override
  bool shouldRepaint(covariant BubblePainter oldDelegate) {
    return oldDelegate._scrollableState != _scrollableState ||
        oldDelegate._bubbleContext != _bubbleContext ||
        oldDelegate._colors != _colors;
  }
}
