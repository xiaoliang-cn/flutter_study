import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return FluroRoute2();
});

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var message = params["message"]?.first;
  print(message);
  return FluroRoute2();
});

final router = FluroRouter();

class FluroRoute1 extends StatelessWidget {
  void defineRoutes(FluroRouter router) {
    router.define("/users/:id", handler: rootHandler);
    router.define("fluro1", handler: rootHandler);
    // it is also possible to define the route transition to use
    // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluroRoute1'),
        elevation: 0.0,
      ),
    );
  }
}

class FluroRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluroRoute2'),
        elevation: 0.0,
      ),
    );
  }
}
