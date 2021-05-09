// import 'dart:io';
// import 'dart:convert' show utf8;

// main(List<String> args) {
//   Stream<List<int>> fileS =
//       File('/Users/zhangxiaoliang/Documents/xl_flutter/lib/config.txt')
//           .openRead();
//   var s = fileS.transform(utf8.decoder);
//   fileS.listen((event) {
//     //转码
//     var s = utf8.decode(event);
//     print(s);
//   });
// }
