import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'fab.dart';
import 'file_info_widget.dart';
import 'progress_indicator.dart' as p_i;

class DownloadPage extends StatelessWidget {
  final Stream<FileResponse> fileStream;
  final VoidCallback downloadFile;
  final VoidCallback clearCache;

  const DownloadPage(
      {Key? key,
      required this.fileStream,
      required this.downloadFile,
      required this.clearCache})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FileResponse>(
      stream: fileStream,
      builder: (context, snapshot) {
        Widget body;
        var loading = !snapshot.hasData || snapshot.data is DownloadProgress;
        if (snapshot.hasError) {
          body = ListTile(
            title: const Text('Error'),
            subtitle: Text(snapshot.error.toString()),
          );
        } else if (loading) {
          body = p_i.ProgressIndicator(
              progress: snapshot.data as DownloadProgress);
        } else {
          body = FileInfoWidget(
            fileInfo: snapshot.data as FileInfo,
            clearCache: clearCache,
          );
        }

        return Scaffold(
          appBar: null,
          body: body,
          floatingActionButton: !loading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Fab(
                      downloadFile: downloadFile,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: '返回上一页',
                      child: Icon(Icons.chevron_left_rounded),
                    )
                  ],
                )
              : null,
        );
      },
    );
  }
}
