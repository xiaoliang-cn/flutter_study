import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

///study a to photo_view library [https://pub.dev/packages/photo_view]
//basic usage  简单的使用
class PhotoViewTest extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoViewTest> {
  PhotoViewController _photoViewController = PhotoViewController();
  @override
  void initState() {
    super.initState();
    _photoViewController.addIgnorableListener(() {});
    _photoViewController.setScaleInvisibly(110);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PhotoView(
            onTapDown: (context, index, _) async {},
            controller: _photoViewController,
            imageProvider: AssetImage("assets/qdy.jpg"),
            customSize: MediaQuery.of(context).size,
            maxScale: PhotoViewComputedScale.covered * 1.1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _photoViewController.setScaleInvisibly(0.5);
          });
        },
        child: Text("+"),
      ),
    );
  }
}
