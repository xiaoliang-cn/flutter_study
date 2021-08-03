import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/my_theme.dart';
import 'package:xl_flutter/study_library/get/my_%20Internationalization.dart';
import 'package:xl_flutter/study_library/hooks_riverpod/riverpod_provider_observer.dart';
import 'package:xl_flutter/unknown_route_page_404.dart';
import 'study_library/get/get_widgets.dart';
import 'package:xl_flutter/study_library.dart';
import 'package:xl_flutter/study_animate.dart';
import 'package:xl_flutter/widget_study.dart';
import 'package:xl_flutter/widgets/custom_paint/custom_paint_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'study_library/get/home_bindings.dart';
import 'study_library/line_icons/icons.dart';

void initData() async {
  await Hive.initFlutter();
  //初始化下载器
  await FlutterDownloader.initialize(debug: true);
}

void main() {
  initData();
  runApp(ProviderScope(
    observers: [RiverPodProviderObserver()],
    child: GetMaterialApp(
      initialBinding: HomeBinDings(),
      debugShowCheckedModeBanner: false,
      //未找到路由跳转到404
      translations: MyMessage(), // 你的翻译
      locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      unknownRoute:
          GetPage(name: '/notfound', page: () => UnKnownRoutePage404()),
      // initialRoute: Routes.SPLASH,
      theme: MyTheme.lightThemeData,
      darkTheme: MyTheme.darkThemeData,
      themeMode: ThemeMode.light,

      /// 没有使用GetMaterialApp就需要手动添加监听器
      ///navigatorObservers: [
      /// GetObserver(MiddleWare.observer), // HERE !!!
      /// ]
      ///中间件 监听导航事件
      routingCallback: (route) {
        print(route?.current.toString());
      },
      getPages: [
        //定义路由
        GetPage(name: "/gexRouteTo", page: () => GexRoute1()),
        //相同的路由参数不同将会导航到不用的页面
        GetPage(
            name: "/gexRouteTo/:arg",
            page: () => GexRoute2(),
            //指定不同的过渡效果
            transition: Transition.cupertino),
      ],
      defaultTransition: Transition.fade,
      // initialBinding: SplashBinding(),
      // getPages: AppPages.pages,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listTag = ["动画相关", "框架相关", "自定义视图学习", "Flutter-Widget大全", "LineIcons"];
  List<Widget> listWidget = [
    StudyAnimate(),
    StudyLibrary(),
    CustomPaintTest(),
    StudyFlutterWidget(),
    LineIconsTest(title: "lineIcons图标")
  ];

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < listTag.length; i++)
                MyTextButton(tag: listTag[i], child: listWidget[i])
            ]),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final logger = Logger();
