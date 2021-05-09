import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetControllerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetControllerTest'),
        elevation: 0.0,
      ),
    );
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {}
}
