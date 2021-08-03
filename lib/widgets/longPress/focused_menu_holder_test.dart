import 'package:flutter/material.dart';
import 'package:xl_flutter/widgets/longPress/focused_menu_holder.dart';

import 'focused_menu_item.dart';

class FocusedMenuHolderTest extends StatefulWidget {
  @override
  _FocusedMenuHolderTestState createState() => _FocusedMenuHolderTestState();
}

class _FocusedMenuHolderTestState extends State<FocusedMenuHolderTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Music Albums",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Center()),
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
                  CircleAvatar(
                    child: Image.asset(
                      "assets/qdy.jpg",
                      width: 200,
                      height: 200,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Look for your Interest!",
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // DropdownButton<String>(
                  //     onTap: () {},
                  //     style: TextStyle(fontSize: 15, color: Colors.black),
                  //     icon: Icon(Icons.keyboard_arrow_down),
                  //     underline: Container(
                  //       color: Colors.white,
                  //     ),
                  //     items: ["Featured", "Most Rated", "Recent", "Popular"]
                  //         .map<DropdownMenuItem<String>>(
                  //             (e) => DropdownMenuItem(child: Text(e)))
                  //         .toList(),
                  //     onChanged: (newItem) {}),
                  IconButton(icon: Icon(Icons.sort), onPressed: () {})
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                      .map((e) => FocusedMenuHolder(
                            menuWidth: MediaQuery.of(context).size.width * 0.50,
                            blurSize: 5.0,
                            menuItemExtent: 45,
                            menuBoxDecoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            duration: Duration(milliseconds: 100),
                            animateMenuItems: true,
                            blurBackgroundColor: Colors.black54,
                            openWithTap: true,
                            menuItems: <FocusedMenuItem>[
                              FocusedMenuItem(
                                  title: Text("Open"),
                                  trailingIcon: Icon(Icons.open_in_new),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                                  body: Container(
                                                    child: Center(
                                                      child:
                                                          Text("Second Screen"),
                                                    ),
                                                  ),
                                                )));
                                  }),
                              FocusedMenuItem(
                                  title: Text("Share"),
                                  trailingIcon: Icon(Icons.share),
                                  onPressed: () {}),
                              FocusedMenuItem(
                                  title: Text("Favorite"),
                                  trailingIcon: Icon(Icons.favorite_border),
                                  onPressed: () {}),
                              FocusedMenuItem(
                                  title: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                  trailingIcon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {}),
                            ],
                            onPressed: () {},
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/qdy.jpg",
                                    height: 100,
                                    width: 200,
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
