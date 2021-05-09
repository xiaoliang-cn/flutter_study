import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class DownloaderManager {
  //ios must NSDocumentDirectory path
  //android
  //
  DownloaderManager._();
  static DownloaderManager _instance = DownloaderManager._();
  factory DownloaderManager() => _instance;

  String savaFolder = "/files/";

  Future<String?> createSinkDownload() async {
    var path = await getNSDocumentDirectoryPath();
    print(path);
    return await FlutterDownloader.enqueue(
      url:
          'https://webfs.yun.kugou.com/202104191008/647c23d8569015a485f2581fd026a8c9/KGTX/CLTX001/5cb5f976a49ce13b04192bd374f49ba1.mp3',
      savedDir: path,
      fileName: "xx.mp3",
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  Future<String> getNSDocumentDirectoryPath() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    return path;
  }

  Future<List<DownloadTask>?> loadAllDownloadTask() async {
    return await FlutterDownloader.loadTasks();
  }

  Future<List<DownloadTask>?> loadAllTasksWithRawQuery(String query) async {
    return await FlutterDownloader.loadTasksWithRawQuery(query: query);
  }

  void openFile(taskId) {
    FlutterDownloader.open(taskId: taskId);
  }

  Future<String?> resumetask(taskId) async {
    return await FlutterDownloader.resume(taskId: taskId);
  }

  Future<void> deleteAllTaskAndContent() async {
    FlutterDownloader.loadTasks().then((value) => value?.forEach((element) {
          FlutterDownloader.remove(
              taskId: element.taskId, shouldDeleteContent: true);
        }));
  }
}
