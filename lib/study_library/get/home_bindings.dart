import 'package:get/get.dart';
import 'package:xl_flutter/study_library/flutter_downloader/download_state_controller.dart';

class HomeBinDings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadStateController());
  }
}
