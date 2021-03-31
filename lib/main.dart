import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addTimingsCallback((timings) {
      print('timings');
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print("timeStamp");
    });
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
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
                        child: animataSwitcher(_counter, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
