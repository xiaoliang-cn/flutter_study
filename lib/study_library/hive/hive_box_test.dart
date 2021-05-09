import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xl_flutter/my_text_button.dart';
import 'package:xl_flutter/study_library/hive/hive_color_paint.dart';
import 'hive_user.dart';

///this is a no sql database frame
///need learn it
///it address url [https://docs.hivedb.dev/#/tutorials/dark_mode_switch]
///api :
///obx?.watch() listener this stream data
class HiveTest extends StatefulWidget {
  @override
  _HiveTestState createState() => _HiveTestState();
}

class _HiveTestState extends State<HiveTest> {
  var listTag = [
    "使用hive储存点赞信息",
    "使用hive储存画板信息",
  ];
  List<Widget> listWidget = [LikeInfo(), DrawApp()];
  @override
  void initState() {
    super.initState();
    Hive.registerAdapter(ColoredPathAdapter());
    initBox();
  }

  void initBox() async {
    await Hive.openBox<ColoredPath>(sketchBox);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HiveTest'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          for (int i = 0; i < listTag.length; i++)
            MyTextButton(tag: listTag[i], child: listWidget[i])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
  }
}

class LikeInfo extends StatefulWidget {
  @override
  _LikeInfoState createState() => _LikeInfoState();
}

class _LikeInfoState extends State<LikeInfo> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  List<String> books = [
    // book name, index
    'Harry Potter', // 0
    'To Kill a Mockingbird', // 1
    'The Hunger Games', // 2
    'The Giver', // 3
    'Brave New World', // 4
    'Unwind', // 5
    'World War Z', // 6
    'The Lord of the Rings', // etc...
    'The Hobbit',
    'Moby Dick',
    'War and Peace',
    'Crime and Punishment',
    'The Adventures of Huckleberry Finn',
    'Catch-22',
    'The Sound and the Fury',
    'The Grapes of Wrath',
    'Heart of Darkness',
  ];
  Box<User?>? obx;
  String favoritesBox = 'favorite_books';

  Box<String>? favoriteBooksBox;
  void initData() async {
    // Register Adapter
    Hive.registerAdapter(UserAdapter());
    favoriteBooksBox = await Hive.openBox(favoritesBox);
    setState(() {});
    obx = await Hive.openBox<User>('testBox13');
    var a = User();
    a.name = "小111亮";
    a.age = "101110";
    // var s = obx?.get("xiaoliang", defaultValue: a);
    // print(s);

    // obx?.keys.forEach((element) {
    //   print(element);
    // });
    // obx?.values.forEach((element) {
    //   print(element.toString());
    // });

    // obx?.watch().forEach((element) {
    //   print('-----');
    //   print(element.value);
    //   print(element.key);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    obx?.close();
  }

  Widget getIcon(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      favoriteBooksBox!.delete(index);
      return;
    }
    favoriteBooksBox!.put(index, books[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HiveTest'),
        elevation: 0.0,
      ),
      body: favoriteBooksBox == null
          ? Center()
          : ValueListenableBuilder(
              valueListenable: favoriteBooksBox!.listenable(),
              builder: (context, Box<String> box, _) {
                return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, listIndex) {
                    return ListTile(
                      title: Text(books[listIndex]),
                      trailing: IconButton(
                        icon: getIcon(listIndex),
                        onPressed: () => onFavoritePress(listIndex),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
  }
}
