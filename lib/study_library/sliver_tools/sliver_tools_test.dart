import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:xl_flutter/study_library/sliver_tools/my_sliver_header.dart';
import 'package:xl_flutter/study_library/sliver_tools/sliver_section.dart';

///study a to sliver_tools library [https://pub.dev/packages/sliver_tools]

class SLiverToolsTest extends StatefulWidget {
  @override
  _SLiverToolsTestState createState() => _SLiverToolsTestState();
}

class _SLiverToolsTestState extends State<SLiverToolsTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLiverToolsTest'),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverStack(
            insetOnOverlap: true, // defaults to false
            children: <Widget>[
              SliverPositioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        color: Colors.black26,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("----------------------"),
                ),
              ),
            ],
          ),
          SliverCrossAxisConstrained(
              maxCrossAxisExtent: 700,
              child: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                    Text("------------"),
                  ],
                ),
              )),
          SliverAnimatedPaintExtent(
              duration: const Duration(milliseconds: 150),
              child: SliverList(
                delegate: SliverChildListDelegate([
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                ]),
              )),
          MultiSliver(
            pushPinnedChildren: false, // defaults to false
            children: <Widget>[
              SliverPersistentHeader(delegate: MySliverHeader()),
              SliverList(
                delegate: SliverChildListDelegate([
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                  Text("-----aaaaa-------"),
                  Text("-----bbbb-------"),
                  Text("-----aabbbbaaa-------"),
                  Text("-----aaccaaaaaccaaa-------"),
                  Text("-----ccccc-------"),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
