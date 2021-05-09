import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/all_flutter_widget/title_widget.dart';

import '../custom_appbar.dart';

class AllSwitchWidget extends StatefulWidget {
  @override
  _AllSwitchWidgetState createState() => _AllSwitchWidgetState();
}

class _AllSwitchWidgetState extends State<AllSwitchWidget> {
  bool _switchListTileValue = false;
  bool _switcValue = false;
  Color _switchThumbColors = Colors.blue;
  //选择之后的按钮颜色
  Color _switchAfterThumbColors = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "swtich小部件",
      ),
      body: ListView(
        children: [
          TitleWidget(
            title: "Switch",
            child: Switch(
              inactiveThumbColor: _switchThumbColors,
              activeColor: _switchAfterThumbColors,
              value: _switcValue,
              onChanged: (data) {
                print(data);
                setState(() {
                  _switcValue = data;
                });
              },
            ),
          ),
          TitleWidget(
            title: "SwitchListTile",
            child: SwitchListTile(
              tileColor: Colors.blue[200],
              title: Text("选择器"),
              value: _switchListTileValue,
              inactiveThumbColor: _switchThumbColors,
              activeColor: _switchAfterThumbColors,
              onChanged: (data) {
                setState(() {
                  _switchListTileValue = data;
                });
              },
              //滑动按钮如果选择后的图标
              // activeThumbImage: AssetImage("assets/qdy.jpg"),
            ),
          ),
          TitleWidget(
              title: "ListTile实现",
              child: ListTile(
                title: Text("title"),
                leading: Text("leading"),
                subtitle: Text("subtitle"),
                trailing: Switch(
                  inactiveThumbColor: _switchThumbColors,
                  activeColor: _switchAfterThumbColors,
                  value: _switcValue,
                  onChanged: (data) {
                    print(data);
                    setState(() {
                      _switcValue = data;
                    });
                  },
                ),
              )),
          TitleWidget(
            title: "Switch.adaptive",
            child: Switch.adaptive(
                value: _switcValue,
                onChanged: (d) {
                  _switcValue = d;
                  setState(() {});
                }),
          ),
          TitleWidget(
            title: "SwitchTheme-灵活配置主题",
            child: SwitchTheme(
                data: SwitchThemeData(),
                child: Switch(
                  inactiveThumbColor: _switchThumbColors,
                  activeColor: _switchAfterThumbColors,
                  value: _switcValue,
                  onChanged: (data) {
                    print(data);
                    setState(() {
                      _switcValue = data;
                    });
                  },
                )),
          )
        ],
      ),
    );
  }
}
