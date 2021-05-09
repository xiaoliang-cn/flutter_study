import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

///listener network staus
///soule learn it
class ConnectivityTest extends StatefulWidget {
  @override
  _ConnectivityTestState createState() => _ConnectivityTestState();
}

class _ConnectivityTestState extends State<ConnectivityTest> {
  @override
  void initState() {
    super.initState();
    networdStatusListener();
  }

  void networdStatusListener() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    log(connectivityResult.toString(), level: 1);
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
    //设置监听
    Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      log(event.toString(), level: 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConnectivityTest'),
        elevation: 0.0,
      ),
    );
  }
}
