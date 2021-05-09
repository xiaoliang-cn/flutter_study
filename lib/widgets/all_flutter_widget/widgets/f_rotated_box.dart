import 'package:flutter/material.dart';
import 'package:xl_flutter/resouce/resouce.dart';

///RotatedBox介绍
//RotatedBox是个可以旋转其子widget的窗口小部件(widget)，
//不像Transform是在控件绘制前对其进行矩阵变换，
//RotatedBox是在控件layout的时候就对其子widget进行旋转处理
//这意味着RotatedBox控件所需要的空间大小跟旋转子widget所需要的空间大小一样。
class FRotatedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotatedBox"),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("一群小孩子"),
              ),
            ),
            Expanded(child: Text(news))
          ],
        ),
      ),
    );
  }
}
