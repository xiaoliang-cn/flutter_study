import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:xl_flutter/study_library/flutter_downloader/base_download.dart';
import 'package:xl_flutter/study_library/flutter_downloader/download_task_repertory.dart';
import 'package:get/get.dart';

enum DownloadSate { Downloading, Downloaded, DownloadFail, DownloadPause }

class DownloadStateController extends BaseDownload with DownloadTaskRepertory {
  var tasks = <DownloadTask>[].obs;
}
