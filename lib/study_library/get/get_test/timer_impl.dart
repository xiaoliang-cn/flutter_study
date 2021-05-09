import 'package:get/get.dart';

//实现getx 实现的计时器
import 'package:flutter/material.dart';

class GetToTimerImpl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountController controller = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetToTimerImpl'),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () =>
            Get.to(() => ToOther(), opaque: true, fullscreenDialog: true),
        child: Center(
          child: Obx(() => Text('count:${controller.count}')),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.increment()),
    );
  }
}

class CountController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  @override
  get onStart => super.onStart;

  @override
  void onInit() {
    super.onInit();
  }
}

// ignore: must_be_immutable
class ToOther extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  CountController controller = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToOther'),
      ),
      body: // 访问更新后的计数变量
          Center(child: Text("${controller.count}")),
    );
  }
}
