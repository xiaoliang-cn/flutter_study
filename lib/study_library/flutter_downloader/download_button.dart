import 'package:flutter/material.dart';

///this is a download button widget

class DownloadButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  DownloadButton({required this.child, required this.onTap});
  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DownloadButton'),
        elevation: 0.0,
      ),
    );
  }
}
