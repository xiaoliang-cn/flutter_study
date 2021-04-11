// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';

// class DownloaderManager {
//   //ios must NSDocumentDirectory path
//   //android
//   //
//   DownloaderManager._();
//   static DownloaderManager instance = DownloaderManager._();
//   factory DownloaderManager() => instance;

//   String savaFolder = "/files/";

//   Future<String> createSinkDownload() async {
//     var path = await getNSDocumentDirectoryPath();
//     return await FlutterDownloader.enqueue(
//       url:
//           'https://webfs.yun.kugou.com/202104111649/5d41897233a1c5e6823a4085239f01da/G220/M07/00/00/HA4DAF8qaWyANAY4ADEy7RR9FTs191.mp3',
//       savedDir: path + 'xx.mp3',
//       showNotification:
//           true, // show download progress in status bar (for Android)
//       openFileFromNotification:
//           true, // click on notification to open downloaded file (for Android)
//     );
//   }

//   Future<String> getNSDocumentDirectoryPath() async {
//     String path = (await getApplicationDocumentsDirectory()).path;
//     return path + savaFolder;
//   }
// }
