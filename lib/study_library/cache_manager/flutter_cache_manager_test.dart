import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'download_page.dart';
import 'fab.dart';

///study a  to flutter_cache_manager library [https://pub.dev/packages/flutter_cache_manager]

///if [url] is not among cache do download file and write  to cache manager
const url =
    'https://iknow-pic.cdn.bcebos.com/b151f8198618367a021b7f8b2e738bd4b21ce5d2';
main(List<String> args) {
  initData("");

  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(backgroundColor: Colors.red)),
    home: CaCheManagerTEST(),
  ));
}

void initData(url) async {
  // var file = await DefaultCacheManager().getSingleFile(url);
}

class CaCheManagerTEST extends StatefulWidget {
  @override
  _CaCheManagerTESTState createState() => _CaCheManagerTESTState();
}

class _CaCheManagerTESTState extends State<CaCheManagerTEST> {
  Stream<FileResponse>? fileStream;
  void _downloadFile() {
    setState(() {
      fileStream = DefaultCacheManager().getFileStream(url, withProgress: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (fileStream == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("文件缓存"),
        ),
        body: const ListTile(
            title: Text('Tap the floating action button to download.')),
        floatingActionButton: Fab(
          downloadFile: _downloadFile,
        ),
      );
    }
    return DownloadPage(
      fileStream: fileStream!,
      downloadFile: _downloadFile,
      clearCache: _clearCache,
    );
  }

  void _clearCache() {
    DefaultCacheManager().emptyCache();
    setState(() {
      fileStream = null;
    });
  }
}
