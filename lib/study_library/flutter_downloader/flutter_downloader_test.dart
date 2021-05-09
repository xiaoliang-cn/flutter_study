import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:xl_flutter/study_library/flutter_downloader/download_state_controller.dart';

// /this is a flutter file downloader
// /need know more info please to library url [https://pub.dev/packages/flutter_downloader]
// /this is a must learn download frame
// /we shoule learn it

class FlutterDownloaderTest extends StatefulWidget {
  @override
  _FlutterDownloaderTestState createState() => _FlutterDownloaderTestState();
}

class _FlutterDownloaderTestState extends State<FlutterDownloaderTest> {
  final ReceivePort _port = ReceivePort();
  final DownloadStateController controller = Get.put(DownloadStateController());
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progressf) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progressf]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    FlutterDownloader?.registerCallback(downloadCallback);
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      print("downloader_send_port");
      String? id = data[0];
      // DownloadTaskStatus? status = data[1];
      print('id=' + id.toString());
      int? progressf = data[2];
      if (progressf != null) {}
    });
    controller.fecthStatusTasks(3).then((value) => value!.forEach((element) {
          controller.tasks.add(element);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlutterDownloaderTest'),
          elevation: 0.0,
        ),
        body: Obx(() => ListView(
              children: [
                // for (var i = 0; i < controller.tasks.value.length; i++)
                //   DownloadWidget(downloadTask: controller.tasks.value[i])
              ],
            )));
  }
}
