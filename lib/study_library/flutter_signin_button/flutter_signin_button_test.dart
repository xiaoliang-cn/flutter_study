import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class FlutterSigninButtonTest extends StatefulWidget {
  @override
  _FlutterSigninButtonTestState createState() =>
      _FlutterSigninButtonTestState();
}

class _FlutterSigninButtonTestState extends State<FlutterSigninButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterSigninButtonTest'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SignInButtonBuilder(
            text: 'Get going with Email',
            icon: Icons.email,
            onPressed: () {
              _showButtonPressDialog(context, 'Email');
            },
            backgroundColor: Colors.blueGrey[700]!,
            width: 220.0,
          ),
          Divider(),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              _showButtonPressDialog(context, 'Google');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              _showButtonPressDialog(context, 'Google (dark)');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {
              _showButtonPressDialog(context, 'FacebookNew');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
              _showButtonPressDialog(context, 'Apple');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.GitHub,
            text: "Sign up with GitHub",
            onPressed: () {
              _showButtonPressDialog(context, 'Github');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Microsoft,
            text: "Sign up with Microsoft ",
            onPressed: () {
              _showButtonPressDialog(context, 'Microsoft ');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Twitter,
            text: "Use Twitter",
            onPressed: () {
              _showButtonPressDialog(context, 'Twitter');
            },
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.LinkedIn,
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'LinkedIn (mini)');
                },
              ),
              SignInButton(
                Buttons.Tumblr,
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'Tumblr (mini)');
                },
              ),
              SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'Facebook (mini)');
                },
              ),
              SignInButtonBuilder(
                icon: Icons.email,
                text: "Ignored for mini button",
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'Email (mini)');
                },
                backgroundColor: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Show a simple "___ Button Pressed" indicator
  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$provider Button Pressed!'),
        backgroundColor: Colors.black,
        duration: Duration(milliseconds: 400)));
  }
}
