import 'package:flutter/material.dart';

///语义widget
class MergesWidges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetName'),
        elevation: 0.0,
      ),
      body: MergeSemantics(
        child: Row(
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
            const Text("Settings"),
          ],
        ),
      ),
    );
  }
}
