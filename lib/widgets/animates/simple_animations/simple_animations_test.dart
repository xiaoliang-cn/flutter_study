import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:xl_flutter/my_text_button.dart';

///this is a not simple animations library
///we shoule learn it
enum AniProps { width, height, color }
enum AniProps1 { x, y }
enum AniProps2 { x, y, color }
enum AniProps3 { offset }
enum AniProps4 { offset, color }

class SimpleAnimationsTest extends StatefulWidget {
  @override
  _SimpleAnimationsState createState() => _SimpleAnimationsState();
}

class _SimpleAnimationsState extends State<SimpleAnimationsTest> {
  var listTag = [
    "颜色转换",
    "放大",
    "带有一定线性的动画",
    "带有一定线性的动画2",
    '带有线性的循环放大缩小',
    '循环放大缩小的文字',
    '左右移动循环播放',
    '按键性左右滑动',
    '连续的线性动画',
    '连续的线性动画TBLR2',
    '连续的线性动画TBLR3',
    'multiTween组合动画',
    'multiTween组合滑动和颜色动画'
  ];
  late List<Widget> listWidget = [
    Center(
      child: _buildPlayAnimation(),
    ),
    Center(
      child: _buildPlayXYAnimation(),
    ),
    Center(
      child: _buildW,
    ),
    Center(
      child: _buildA,
    ),
    Center(
      child: _buildAS,
    ),
    Center(
      child: _buildAnimationText,
    ),
    Center(
      child: _buildAnimationLoopLeftToRight,
    ),
    Center(
      child: _buildClickAnimation,
    ),
    Center(
      child: timeLineTween1,
    ),
    Center(
      child: _timeLineTween2,
    ),
    Center(
      child: _buildTimeLineTween3,
    ),
    Center(
      child: _buildMultiTween,
    ),
    Center(
      child: _multiTweenScorllAndColor,
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  ///线性队列动画
  final _tween = TimelineTween<AniProps>()
    ..addScene(begin: 0.milliseconds, end: 1000.milliseconds)
        .animate(AniProps.width, tween: 0.0.tweenTo(100.0))
    ..addScene(begin: 1000.milliseconds, end: 1500.milliseconds)
        .animate(AniProps.width, tween: 100.0.tweenTo(200.0))
    ..addScene(begin: 0.milliseconds, duration: 2500.milliseconds)
        .animate(AniProps.height, tween: 0.0.tweenTo(200.0))
    ..addScene(begin: 0.milliseconds, duration: 3.seconds)
        .animate(AniProps.color, tween: Colors.red.tweenTo(Colors.blue));
  Widget get timeLineTween1 => PlayAnimation<TimelineValue<AniProps>>(
        tween: _tween, // Pass in tween
        duration: _tween.duration, // Obtain duration
        builder: (context, child, value) {
          return Container(
            width: value.get(AniProps.width), // Get animated value for width
            height: value.get(AniProps.height), // Get animated value for height
            color: value.get(AniProps.color), // Get animated value for color
          );
        },
      );
  final _tween1 = TimelineTween<AniProps1>()
    ..addScene(begin: 0.seconds, duration: 1.seconds)
        .animate(AniProps1.x, tween: (-100.0).tweenTo(100.0))
    ..addScene(begin: 1.seconds, duration: 1.seconds)
        .animate(AniProps1.y, tween: (-100.0).tweenTo(100.0))
    ..addScene(begin: 2.seconds, duration: 1.seconds)
        .animate(AniProps1.x, tween: (100.0).tweenTo(-100.0))
    ..addScene(begin: 3.seconds, duration: 1.seconds)
        .animate(AniProps1.y, tween: (100.0).tweenTo(-100.0));

  Widget get _timeLineTween2 => LoopAnimation<TimelineValue<AniProps1>>(
        tween: _tween1, // Pass in tween
        duration: _tween.duration, // Obtain duration
        builder: (context, child, value) {
          return Transform.translate(
            // Get animated offset
            offset: Offset(value.get(AniProps1.x), value.get(AniProps1.y)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          );
        },
      );

  final _tween2 = TimelineTween<AniProps2>()
    ..addScene(begin: 0.seconds, duration: 1.seconds)
        .animate(
          AniProps2.x,
          tween: (-100.0).tweenTo(100.0),
          curve: Curves.easeInOutSine,
        )
        .animate(AniProps2.color, tween: Colors.red.tweenTo(Colors.yellow))
    ..addScene(begin: 1.seconds, duration: 1.seconds).animate(
      AniProps2.y,
      tween: (-100.0).tweenTo(100.0),
      curve: Curves.easeInOutSine,
    )
    ..addScene(begin: 2.seconds, duration: 1.seconds).animate(
      AniProps2.x,
      tween: (100.0).tweenTo(-100.0),
      curve: Curves.easeInOutSine,
    )
    ..addScene(begin: 1.seconds, end: 3.seconds)
        .animate(AniProps2.color, tween: Colors.yellow.tweenTo(Colors.blue))
    ..addScene(begin: 3.seconds, duration: 1.seconds)
        .animate(
          AniProps2.y,
          tween: (100.0).tweenTo(-100.0),
          curve: Curves.easeInOutSine,
        )
        .animate(AniProps2.color, tween: Colors.blue.tweenTo(Colors.red));
  Widget get _buildTimeLineTween3 => LoopAnimation<TimelineValue<AniProps2>>(
        tween: _tween2, // Pass in tween
        duration: _tween.duration, // Obtain duration
        builder: (context, child, value) {
          return Transform.translate(
            // Get animated offset
            offset: Offset(value.get(AniProps2.x), value.get(AniProps2.y)),
            child: Container(
              width: 100,
              height: 100,
              color: value.get(AniProps2.color), // Get animated color
            ),
          );
        },
      );

  // ignore: unused_element
  Widget get _buildTimeLineAnimation => ListView(
        children: [
          Center(child: timeLineTween1),
          SizedBox(
            height: 50,
          ),
          Center(child: _timeLineTween2),
          SizedBox(
            height: 50,
          ),
          Center(child: _buildTimeLineTween3)
        ],
      );

  final _tween3 = MultiTween<AniProps3>()
    ..add(
        // top left => top right
        AniProps3.offset,
        Tween(begin: Offset(-100, -100), end: Offset(100, -100)),
        1000.milliseconds)
    ..add(
        // top right => bottom right
        AniProps3.offset,
        Tween(begin: Offset(100, -100), end: Offset(100, 100)),
        1000.milliseconds)
    ..add(
        // bottom right => bottom left
        AniProps3.offset,
        Tween(begin: Offset(100, 100), end: Offset(-100, 100)),
        1000.milliseconds)
    ..add(
        // bottom left => top left
        AniProps3.offset,
        Tween(begin: Offset(-100, 100), end: Offset(-100, -100)),
        1000.milliseconds);

  Widget get _buildMultiTween => LoopAnimation<MultiTweenValues<AniProps3>>(
        tween: _tween3, // Pass in tween
        duration: _tween3.duration, // Obtain duration from MultiTween
        builder: (context, child, value) {
          return Transform.translate(
            offset: value.get(AniProps3.offset), // Get animated offset
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          );
        },
      );

  final _tween4 = MultiTween<AniProps4>()
    ..add(
        // top left => top right
        AniProps4.offset,
        Tween(begin: Offset(-100, -100), end: Offset(100, -100)),
        1000.milliseconds,
        Curves.easeInOutSine)
    ..add(
        // top right => bottom right
        AniProps4.offset,
        Tween(begin: Offset(100, -100), end: Offset(100, 100)),
        1000.milliseconds,
        Curves.easeInOutSine)
    ..add(
        // bottom right => bottom left
        AniProps4.offset,
        Tween(begin: Offset(100, 100), end: Offset(-100, 100)),
        1000.milliseconds,
        Curves.easeInOutSine)
    ..add(
        // bottom left => top left
        AniProps4.offset,
        Tween(begin: Offset(-100, 100), end: Offset(-100, -100)),
        1000.milliseconds,
        Curves.easeInOutSine)
    ..add(AniProps4.color, Colors.red.tweenTo(Colors.yellow), 1.seconds)
    ..add(AniProps4.color, Colors.yellow.tweenTo(Colors.blue), 2.seconds)
    ..add(AniProps4.color, Colors.blue.tweenTo(Colors.red), 1.seconds);

  Widget get _multiTweenScorllAndColor =>
      LoopAnimation<MultiTweenValues<AniProps4>>(
        tween: _tween4, // Pass in tween
        duration: _tween.duration, // Obtain duration from MultiTween
        builder: (context, child, value) {
          return Transform.translate(
            offset: value.get(AniProps4.offset), // Get animated offset
            child: Container(
              width: 100,
              height: 100,
              color: value.get(AniProps4.color), // Get animated color
            ),
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleAnimations'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          for (var i = 0; i < listTag.length; i++)
            MyTextButton(tag: listTag[i], child: Scaffold(body: listWidget[i]))
        ],
      ),
    );
  }

  ///color transition animation
  Widget _buildPlayAnimation() => PlayAnimation<Color?>(
      tween: Colors.red.tweenTo(Colors.blue),
      builder: (context, child, value) {
        // <-- builder function
        return Container(
          color: value,
          width: 100,
          height: 100,
        );
      });
  //从中心变大
  Widget _buildPlayXYAnimation() => PlayAnimation<double>(
        tween: (50.0).tweenTo(200.0), // <-- specify tween (from 50.0 to 200.0)
        duration: 5.seconds, // <-- set a duration
        builder: (context, child, value) {
          // <-- use builder function
          return Container(
            width:
                value, // <-- apply animated value obtained from builder function parameter
            height:
                value, // <-- apply animated value obtained from builder function parameter
            color: Colors.green,
          );
        },
      );

  Widget get _buildW => PlayAnimation<double>(
        tween: (50.0).tweenTo(200.0),
        duration: 5.seconds,
        child:
            Center(child: Text("Hello!")), // <-- specify widget called "child"
        builder: (context, child, value) {
          // <-- obtain child from builder function parameter
          return Container(
            width: value,
            height: value,
            child: child, // <-- place child inside your animation
            color: Colors.green,
          );
        },
      );

//This example demonstrates a non-linear animation. A pink square increases it's size.
// The easeOut curve applied to the animation makes it slow down at the end.
  Widget get _buildA => PlayAnimation<double>(
        tween: 0.0.tweenTo(200.0),
        duration: 2.seconds,
        curve: Curves.easeOut,
        builder: (context, child, value) {
          return Container(
            width: value,
            height: value,
            color: Colors.pink,
          );
        },
      );

  //变大变小的持续动画
  Widget get _buildAS => CustomAnimation<double>(
        control: CustomAnimationControl.MIRROR,
        tween: 100.0.tweenTo(200.0),
        duration: 2.seconds,
        delay: 1.seconds,
        curve: Curves.easeInOut,
        child: Center(
            child: Text(
          "Hello!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        )),
        startPosition: 0.5,
        animationStatusListener: (status) {
          //动画状态
          print("status updated: $status");
        },
        builder: (context, child, value) {
          return Container(
              width: value, height: value, color: Colors.blue, child: child);
        },
      );

//持续播放的动画
  Widget get _buildAnimationText => LoopAnimation<double>(
      tween: 0.0.tweenTo(10.0),
      duration: 2.seconds,
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Text("Hello!"));

//不会停止的左到右
  Widget get _buildAnimationLoopLeftToRight => MirrorAnimation<double>(
        tween: (-100.0).tweenTo(100.0), // <-- value for offset x-coordinate
        duration: 2.seconds,
        curve: Curves.easeInOutSine, // <-- non-linear animation
        builder: (context, child, value) {
          return Transform.translate(
            offset: Offset(value, 0), // <-- use animated value for x-coordinate
            child: child,
          );
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      );

  CustomAnimationControl control = CustomAnimationControl.PLAY;
  Widget get _buildClickAnimation => CustomAnimation<double>(
        control: control, // <-- bind state variable to parameter
        tween: (-100.0).tweenTo(100.0),
        builder: (context, child, value) {
          return Transform.translate(
            // <-- animation that moves childs from left to right
            offset: Offset(value, 0),
            child: child,
          );
        },
        child: MaterialButton(
          // <-- there is a button
          color: Colors.yellow,
          child: Text("Swap"),
          onPressed:
              toggleDirection, // <-- clicking button changes animation direction
        ),
      );

  void toggleDirection() {
    setState(() {
      // toggle between control instructions
      control = (control == CustomAnimationControl.PLAY)
          ? CustomAnimationControl.PLAY_REVERSE
          : CustomAnimationControl.PLAY;
    });
  }
}
