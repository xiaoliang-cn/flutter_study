import 'package:flutter/material.dart';

class TransFormExmple extends StatefulWidget {
  TransFormExmple({Key? key}) : super(key: key);

  @override
  _TransFormExmpleState createState() => _TransFormExmpleState();
}

class _TransFormExmpleState extends State<TransFormExmple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    super.initState();
    Tween(begin: 0.1, end: 1.2)..animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    ///顺转
    // return Scaffold(
    //   body: Center(
    //     child: RotatedBox(quarterTurns: 2,
    //     child: Text('Hello wo1111rd'),),
    //   ),
    // );
    ///转换文字
    // return Scaffold(
    //   body: GestureDetector(
    //     onTap: (){
    //   _first = !_first;
    //   setState(() {

    //   });
    //     },
    //     child: Center(
    //       ///两个控件之间淡出淡入的转换
    //       child: AnimatedCrossFade(
    //         duration: const Duration(seconds: 1),
    //         firstChild: const FlutterLogo(
    //             style: FlutterLogoStyle.horizontal, size: 100.0),
    //         secondChild:
    //             const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
    //         crossFadeState:
    //             _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //       ),
    //     ),
    //   ),
    // );
    //---------------------------

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // _height = Random().nextInt(100).toDouble();
          // setState(() {

          // });
        },
        child: Center(
          ///复杂的动画需要AnimatedBuilder
          child: AnimatedBuilder(
            animation: _controller,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
              child: const Center(
                child: Text('Whee!'),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _controller.value,
                // angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
