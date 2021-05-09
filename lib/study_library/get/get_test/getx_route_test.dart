import 'package:flutter/material.dart';
import 'package:get/get.dart';

///test getx route function
// ignore: must_be_immutable
class GetXRouteTest extends StatelessWidget {
  var listTag = [
    'ToGetxRoute1',
    '嵌套导航',
  ];
  List<Widget> listWidget = [GexRoute1(), GetxRoute3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          for (int i = 0; i < listTag.length; i++)
            TextButton(
                onPressed: () async {
                  //导航到新的页面
                  Get.to(() => listWidget[i]);
                  // 进入页面，取消之前所有路由
                  // Get.offAll(listWidget[i]);
                  // var data = await Get.to(() => listWidget[i]);

                  // if (data != null) {
                  //   showSnackBar(data);
                  // }
                  //-----------别名导航
                  // Get.toNamed("/gexRouteTo11");
                  //浏览并删除前一个导航
                  // Get.offNamed("/NextScreen");
                  // 浏览并删除所有以前的页面。
                  // Get.offAllNamed("/NextScreen");
                  // 发送数据到别名路由
                  //只要发送你想要的参数即可。
                  //Get在这里接受任何东西，
                  //无论是一个字符串，一个Map，一个List，甚至一个类的实例。
                  // Get.toNamed("/gexRouteTo");

                  //动态网页链接
                },
                child: Text(listTag[i]))
        ],
      ),
    );
  }
}

///getx function impl
void showSnackBar(String message) {
  Get.showSnackbar(GetBar(
    title: "路由管理",
    message: message,
    duration: 1.seconds,
  ));
}

///getx open dialog
void openDialog() {
  //open default get dialog
  Get.defaultDialog(title: "title", middleText: "middleText");
}

void openBottomDialog() {
  Get.bottomSheet(Container(
    child: Container(
      color: Colors.white,
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Music'),
              onTap: () {}),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video'),
            onTap: () {},
          ),
        ],
      ),
    ),
  ));
}

//one page
// ignore: must_be_immutable
class GexRoute1 extends StatelessWidget {
  bool _change = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GexRoute1'),
        elevation: 0.0,
      ),
      body: Center(
        // child: Text("GexRoute1"),
        // Get.arguments 获取上一页发送的数据
        child: TextButton(
            onPressed: () {
              // openDialog();
              openBottomDialog();
            },
            child: Text('hello'.tr)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //返回上一页
          // Get.back();
          // 返回数据给上一页
          // Get.back(result: "返回数据给你");
          // 国际化更改
          if (_change) {
            var locale = Locale('zh', 'CN');
            Get.changeTheme(ThemeData.light());
            Get.updateLocale(locale);
          } else {
            var locale = Locale('en', 'US');
            // Get.changeThemeMode(ThemeMode.dark);
            Get.changeTheme(ThemeData.dark());
            Get.updateLocale(locale);
          }
          _change = !_change;
        },
      ),
    );
  }
}

//two page
class GexRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GexRoute2'),
        elevation: 0.0,
      ),
      body: Center(
        // child: Text("GexRoute1"),
        // Get.arguments 获取上一页发送的数据
        child: Text(Get.parameters['arg'].toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //返回上一页
          // Get.back();
          // 返回数据给上一页
          Get.back(result: "返回数据给你");
        },
      ),
    );
  }
}

//切套导航
class GetxRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: Get.nestedKey(1), // create a key by index
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return GetPageRoute(
              page: () => Scaffold(
                appBar: AppBar(
                  title: Text("Main"),
                ),
                body: Center(
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/second',
                          id: 1); // navigate by your nested route by index
                    },
                    child: Text("Go to second"),
                  ),
                ),
              ),
            );
          } else if (settings.name == '/second') {
            return GetPageRoute(
              page: () => Center(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Main"),
                  ),
                  body: Center(child: Text("second")),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
            );
          }
        });
  }
}
