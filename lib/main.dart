import 'package:flutter/material.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/stydy_library.dart';
import 'package:xl_flutter/study_animate.dart';
import 'package:xl_flutter/widgets/custom_paint/custom_paint_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initData();
  runApp(MyApp());
}

void initData() async {}

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
  var listTag = ["动画相关", "框架相关", "自定义视图学习"];
  List<Widget> listWidget = [StudyAnimate(), StudyLibrary(), CustomPaintTest()];

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {}
//  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextButton(
//                   style: ButtonStyle(
//                       minimumSize: MaterialStateProperty.resolveWith(
//                           (states) => Size(double.infinity, 50)),
//                       backgroundColor: MaterialStateProperty.resolveWith(
//                           (states) => Colors.blue)),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return HomeAnimatePage();
//                     }));
//                   },
//                   child: Text(
//                     "框架相关",
//                     style: home_button_text_style,
//                   )),
//             )
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
