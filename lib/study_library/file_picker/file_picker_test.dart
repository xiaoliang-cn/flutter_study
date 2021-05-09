import 'package:flutter/material.dart';

class FilePickerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FilePickerTest'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text("----"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initData();
        },
      ),
    );
  }

  void initData() async {
    // var result = (await FilePicker.platform.getDirectoryPath());
    // print(result);
    // if (result != null) {
    // File file = File(result.files.first.path!);
    // print(file.path);
    // }

// Will filter and only let you pick files with svg and pdf extension
    // FilePickerResult result = (await FilePicker.platform
    //     .pickFiles(type: FileType.custom, allowedExtensions: ['mp3', 'pdf']))!;

// if(result != null) {
//  File file = File(result.files.first.path!);

//   }
  }
}
