import 'package:flutter/material.dart';
import 'package:flutter_advanced_progress/flutter_advanced_progress.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:xl_flutter/study_library/flutter_downloader/downloader_manager.dart';
import 'download_state_controller.dart';

class DownloadWidget extends StatefulWidget {
  final DownloadTask downloadTask;
  DownloadWidget({Key? key, required this.downloadTask}) : super(key: key);
  @override
  _DownloadWidgetState createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  //局部状态
  final downloadState = DownloadSate.DownloadPause.obs;
  final DownloaderManager _downloaderManager = DownloaderManager();
  late Rx<DownloadTask> _downloadTask = widget.downloadTask.obs;
  var progress = 0.0.obs;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          DownloaderManager().openFile(widget.downloadTask.taskId);
        },
        title: Center(child: Text(widget.downloadTask.filename!)),
        subtitle: Center(child: Obx(() => _buildDownloadingWidget())),
        leading: GestureDetector(
            onTap: () async {
              // downloadState.value = DownloadSate.Downloading;
              // 创建一个下载任务
              // var _downloadID = await _downloaderManager.createSinkDownload();

              if (widget.downloadTask.status == DownloadTaskStatus.paused) {
                _downloaderManager.resumetask(widget.downloadTask.taskId);
              } else if (widget.downloadTask.status ==
                  DownloadTaskStatus.failed) {
                FlutterDownloader.retry(taskId: widget.downloadTask.taskId);
              }
            },
            child: Container(
              width: 50,
              color: Colors.red,
            )),
        trailing: Obx(() => Stack(
              alignment: Alignment.center,
              children: [
                AdvancedProgress(
                  primaryColor: Colors.red,
                  tertiaryColor: Colors.grey[300],
                  levelAmount: 0,
                  radius: 30,
                  secondaryValue: _downloadTask.value.progress / 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (widget.downloadTask.progress).toStringAsFixed(1),
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "进度".tr,
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildDownloadingWidget() {
    switch (this.downloadState.value) {
      case DownloadSate.DownloadPause:
        return Text("等待下载");
      case DownloadSate.DownloadFail:
        return Text("下载失败");
      case DownloadSate.Downloading:
        return Text("下载中");
      case DownloadSate.Downloaded:
        break;
    }
    return Text("页面出错拉");
  }
}
