import 'package:flutter_downloader/flutter_downloader.dart';

mixin DownloadTaskRepertory {
  // DownloaderManager _downloaderManager = DownloaderManager();

  Future<List<DownloadTask>?> fecthStatusTasks(int status) async {
    // return _downloaderManager
    //     .loadAllTasksWithRawQuery("SELECT * FROM task WHERE status=${status}");
  }

  deleteALlTasksAndContent() {}
}
