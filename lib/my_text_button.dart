import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String tag;
  final Widget child;
  const MyTextButton({required this.tag, required this.child});
  static final home_button_text_style = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(double.infinity, 50)),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.blue)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return child;
            }));
          },
          child: Text(
            tag,
            style: home_button_text_style,
          )),
    );
  }
}
