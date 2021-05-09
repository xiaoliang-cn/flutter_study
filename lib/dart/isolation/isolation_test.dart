import 'package:flutter/foundation.dart';

Future<String> fetchString() async {
  await Future.delayed(Duration(seconds: 3));
  return compute(printData, "大大说的撒的");
}

String printData(String s) {
  print(s);

  return s;
}

main(List<String> args) {
  initData();
  print("-----------");
}

void initData() async {
  await fetchString();
}
