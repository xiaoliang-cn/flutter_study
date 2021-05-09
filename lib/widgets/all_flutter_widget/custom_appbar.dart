import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  CustomAppbar({required this.title});
  @override
  _CustomAppbarState createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size(double.infinity, 60);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
    );
  }
}
