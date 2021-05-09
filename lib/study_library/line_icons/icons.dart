import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LineIconsTest extends StatefulWidget {
  LineIconsTest({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyLineIcon {
  Widget icon;
  String text;
  MyLineIcon(this.icon, this.text);
}

class _MyHomePageState extends State<LineIconsTest> {
  List<MyLineIcon> listData = [];
  List<MyLineIcon> searchData = [];
  @override
  void initState() {
    super.initState();
    for (String icon in LineIcons.values.keys) {
      var m = MyLineIcon(
          Icon(
            LineIcons.values[icon],
          ),
          icon);
      listData.add(m);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
              hintText: "搜索",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
          onSubmitted: (data) {
            listData.forEach((element) {
              if (element.text.contains(data)) {
                searchData.add(element);
              }
            });
            setState(() {});
          },
          onChanged: (data) {
            if (data.isEmpty) {
              print(data);
              searchData.clear();
              setState(() {});
              return;
            }
            // listData.forEach((element) {
            //   if (element.text.contains(data)) {
            //     searchData.add(element);
            //   }
            // });
            // setState(() {});
          },
        ),
      ),
      body: allLineIcon,
      //  Center(
      //   child: LineIcon.fileInvoice(),
      // ),
    );
  }

  Widget get allLineIcon => GridView.count(
        crossAxisCount: 3,
        children: [
          for (var icon in searchData.isEmpty ? listData : searchData)
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 0.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon.icon,
                  SizedBox(
                    height: 5,
                  ),
                  Text(icon.text)
                ],
              ),
            )
        ],
      );
}
