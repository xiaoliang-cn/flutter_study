// import 'dart:isolate';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';

///this is a flutter file downloader
///need know more info please to library url [https://pub.dev/packages/flutter_downloader]
///this is a must learn download frame
///we shoule learn it
///不支持空安全 等待作者更新
// class FlutterDownloaderTest extends StatefulWidget {
//   @override
//   _FlutterDownloaderTestState createState() => _FlutterDownloaderTestState();
// }

// class _FlutterDownloaderTestState extends State<FlutterDownloaderTest> {
//   ReceivePort _port = ReceivePort();

//   @override
//   void dispose() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();

//     IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port');
//     _port.listen((dynamic data) {
//       String id = data[0];
//       DownloadTaskStatus status = data[1];
//       int progress = data[2];
//       setState(() {});
//     });

//     FlutterDownloader.registerCallback(downloadCallback);
//   }

//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     final SendPort send =
//         IsolateNameServer.lookupPortByName('downloader_send_port')!;
//     print(progress);
//     send.send([id, status, progress]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FlutterDownloaderTest'),
//         elevation: 0.0,
//       ),
//     );
//   }
// }
