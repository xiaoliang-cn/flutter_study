import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'flash_helper.dart';

///study a flash library [https://pub.dev/packages/flash]
///flash have very good [toast] [dialog] [snackbar] style widget
///our sould to study flash
class FlashPageTest extends StatefulWidget {
  FlashPageTest({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FlashPageTestState createState() => _FlashPageTestState();
}

class _FlashPageTestState extends State<FlashPageTest> {
  @override
  void dispose() {
    FlashHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlashHelper.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            '⚡️A highly customizable, powerful and easy-to-use alerting library for Flutter.',
            style: TextStyle(fontSize: 18.0, wordSpacing: 5.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) {
                  return FlashPage();
                }),
              ],
            );
          }));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(onBackPressed);
  // }
  //
  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(onBackPressed);
  //   super.dispose();
  // }
  //
  // bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo routeInfo) {
  //   // Handle android back event here. WillPopScope is not recommended.
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Flash Demo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('Flash'),
                        content: Text(
                            '⚡️A highly customizable, powerful and easy-to-use alerting library for Flutter.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('YES'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('NO'),
                          ),
                        ],
                      );
                    });
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Test FocusScopeNode',
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Wrap(
                  spacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('FlashBar'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _showBasicsFlash(),
                      child: Text('Basics'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _showBasicsFlash(duration: Duration(seconds: 2)),
                      child: Text('Basics | Duration'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _showBasicsFlash(flashStyle: FlashStyle.grounded),
                      child: Text('Basics | Grounded'),
                    ),
                    Row(children: <Widget>[]),
                    ElevatedButton(
                      onPressed: () => _showTopFlash(),
                      child: Text('Top'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _showTopFlash(style: FlashStyle.grounded),
                      child: Text('Top | Grounded'),
                    ),
                    Row(children: <Widget>[]),
                    ElevatedButton(
                      onPressed: () => _showBottomFlash(),
                      child: Text('Bottom'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showBottomFlash(
                          margin: const EdgeInsets.only(
                              left: 12.0, right: 12.0, bottom: 34.0)),
                      child: Text('Bottom | Margin'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showBottomFlash(persistent: false),
                      child: Text('Bottom | No Persistent'),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Flash Input'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _showInputFlash(),
                      child: Text('Input'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showInputFlash(
                        persistent: false,
                        onWillPop: () => Future.value(true),
                      ),
                      child: Text('Input | No Persistent | Will Pop'),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Flash Toast'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _showCenterFlash(
                          position: FlashPosition.top,
                          style: FlashStyle.floating),
                      child: Text('Top'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _showCenterFlash(alignment: Alignment.center),
                      child: Text('Center'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showCenterFlash(
                          position: FlashPosition.bottom,
                          style: FlashStyle.floating),
                      child: Text('Bottom'),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Flash Helper'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => FlashHelper.toast(
                          'You can put any message of any length here.'),
                      child: Text('Toast'),
                    ),
                    ElevatedButton(
                      onPressed: () => FlashHelper.successBar(context,
                          message: 'I succeeded!'),
                      child: Text('Success Bar'),
                    ),
                    ElevatedButton(
                      onPressed: () => FlashHelper.infoBar(context,
                          message: 'Place information here!'),
                      child: Text('Information Bar'),
                    ),
                    ElevatedButton(
                      onPressed: () => FlashHelper.errorBar(context,
                          message: 'Place error here!'),
                      child: Text('Error Bar'),
                    ),
                    ElevatedButton(
                      onPressed: () => FlashHelper.actionBar(context,
                          message: 'Place error here!',
                          primaryAction: (context, controller, setState) {
                        return TextButton(
                          child: Text('Done'),
                          onPressed: () => controller.dismiss(),
                        );
                      }),
                      child: Text('Action Bar'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showDialogFlash(),
                      child: Text('Simple Dialog'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var completer = Completer();
                        Future.delayed(Duration(seconds: 5))
                            .then((_) => completer.complete());
                        FlashHelper.blockDialog(
                          context,
                          dismissCompleter: completer,
                        );
                      },
                      child: Text('Block Dialog'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 2), () => _showDialogFlash());
                      },
                      child: Text('Simple Dialog Delay'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FlashHelper.inputDialog(context,
                                persistent: false,
                                title: 'Hello Flash',
                                message:
                                    'You can put any message of any length here.')
                            .then((value) {
                          if (value != null) _showMessage(value);
                        });
                      },
                      child: Text('Input Dialog'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBasicsFlash({
    Duration? duration,
    flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text('This is a basic flash'),
          ),
        );
      },
    );
  }

  void _showTopFlash({FlashStyle style = FlashStyle.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      persistent: false,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          style: style,
          position: FlashPosition.top,
          child: FlashBar(
            title: Text('Title'),
            message: Text('Hello world!'),
            showProgressIndicator: true,
            primaryAction: TextButton(
              onPressed: () => controller.dismiss(),
              child: Text('DISMISS', style: TextStyle(color: Colors.amber)),
            ),
          ),
        );
      },
    );
  }

  void _showBottomFlash(
      {bool persistent = true, EdgeInsets margin = EdgeInsets.zero}) {
    showFlash(
      context: context,
      persistent: persistent,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: margin,
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.blue,
          boxShadows: kElevationToShadow[8],
          backgroundGradient: RadialGradient(
            colors: [Colors.amber, Colors.black87],
            center: Alignment.topLeft,
            radius: 2,
          ),
          onTap: () => controller.dismiss(),
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text('Hello Flash'),
              message: Text('You can put any message of any length here.'),
              leftBarIndicatorColor: Colors.red,
              icon: Icon(Icons.info_outline),
              primaryAction: TextButton(
                onPressed: () => controller.dismiss(),
                child: Text('DISMISS'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () => controller.dismiss('Yes, I do!'),
                    child: Text('YES')),
                TextButton(
                    onPressed: () => controller.dismiss('No, I do not!'),
                    child: Text('NO')),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      if (_ != null) {
        _showMessage(_.toString());
      }
    });
  }

  void _showInputFlash({
    bool persistent = true,
    WillPopCallback? onWillPop,
  }) {
    var editingController = TextEditingController();
    showFlash(
      context: context,
      persistent: persistent,
      onWillPop: onWillPop,
      builder: (_, controller) {
        return Flash.bar(
          controller: controller,
          barrierColor: Colors.black54,
          borderWidth: 3,
          style: FlashStyle.grounded,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          child: FlashBar(
            title: Text('Hello Flash', style: TextStyle(fontSize: 24.0)),
            message: Column(
              children: [
                Text('You can put any message of any length here.'),
                Form(
                  child: TextFormField(
                    controller: editingController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            leftBarIndicatorColor: Colors.red,
            primaryAction: IconButton(
              onPressed: () {
                if (editingController.text.isEmpty) {
                  controller.dismiss();
                } else {
                  var message = editingController.text;
                  _showMessage(message);
                  editingController.text = '';
                }
              },
              icon: Icon(Icons.send, color: Colors.amber),
            ),
          ),
        );
      },
    );
  }

  void _showCenterFlash({
    FlashPosition? position,
    FlashStyle? style,
    Alignment? alignment,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 5),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.black87,
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.blue,
          position: position,
          style: style,
          alignment: alignment,
          enableDrag: false,
          onTap: () => controller.dismiss(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Text(
                'You can put any message of any length here.',
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (_ != null) {
        _showMessage(_.toString());
      }
    });
  }

  void _showDialogFlash() {
    FlashHelper.simpleDialog(
      context,
      title: 'Flash Dialog',
      message:
          '⚡️A highly customizable, powerful and easy-to-use alerting library for Flutter.',
      negativeAction: (context, controller, setState) {
        return TextButton(
          child: Text('NO'),
          onPressed: () => controller.dismiss(),
        );
      },
      positiveAction: (context, controller, setState) {
        return TextButton(
          child: Text('YES'),
          onPressed: () => controller.dismiss(),
        );
      },
    );
  }

  void _showMessage(String message) {
    if (!mounted) return;
    showFlash(
        context: context,
        duration: Duration(seconds: 3),
        builder: (_, controller) {
          return Flash(
            controller: controller,
            position: FlashPosition.top,
            style: FlashStyle.grounded,
            child: FlashBar(
              icon: Icon(
                Icons.face,
                size: 36.0,
                color: Colors.black,
              ),
              message: Text(message),
            ),
          );
        });
  }
}
