import 'package:get/route_manager.dart';

class MyMessage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "zh_CN": {'hello': '你好 世界'},
        'en_US': {'hello': 'Hello World'}
      };
}
