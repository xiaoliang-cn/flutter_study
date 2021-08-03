import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';

///study a to charcode library url: [https://pub.dev/packages/charcode]
/// Check whether `(` and `)` are balanced in [input].
bool checkBalancedParentheses(String input) {
  var openParenCount = 0;
  for (var i = 0; i < input.length; i++) {
    var char = input.codeUnitAt(i);
    if (char == $lparen) {
      openParenCount++;
    } else if (char == $rparen) {
      openParenCount--;
      if (openParenCount < 0) return false;
    }
  }
  return openParenCount == 0;
}

class CharCodeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CharCodeTest'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(String.fromCharCodes([
          $E,
          $x,
          $a,
          $m,
          $p,
          $l,
          $e,
          $exclamation,
        ])),
      ),
    );
  }
}
