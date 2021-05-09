import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/expand_widget/gradient_fab.dart';

class ExpansionPanelTest extends StatefulWidget {
  @override
  _ExpansionPanelState createState() => _ExpansionPanelState();
}

class _ExpansionPanelState extends State<ExpansionPanelTest> {
  List<bool> _isOpen = [false, false, false, false, false];
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel小部件'),
        elevation: 0.0,
      ),
      floatingActionButton: GradientFab(children: [
        FabChild(
            iconData: Icons.settings,
            onPress: () {
              // log("Button pressed");
            }),
        FabChild(
            iconData: Icons.accessibility,
            onPress: () {
              // log("Button pressed");
            }),
        FabChild(
            iconData: Icons.account_tree,
            onPress: () {
              // log("Button pressed");
            }),
        FabChild(
            iconData: Icons.camera,
            onPress: () {
              // log("Button pressed");
            }),
      ], controller: _scrollController),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: ExpansionPanelList(
          animationDuration: Duration(seconds: 1),
          expandedHeaderPadding: EdgeInsets.all(0.0),
          dividerColor: Colors.pink,
          elevation: 1,
          expansionCallback: (index, isOpen) {
            _isOpen[index] = !isOpen;
            setState(() {});
          },
          children: [
            for (var b in _isOpen)
              ExpansionPanel(
                  //头部是否可以点击
                  canTapOnHeader: true,
                  backgroundColor: Colors.grey[100],
                  isExpanded: b,
                  headerBuilder: (context, isOpen) {
                    return Center(child: Text('点击展开内容'));
                  },
                  body: Center(
                      child: Text(
                          "这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容这是展开要展示的内容")))
          ],
        ),
      ),
    );
  }
}
