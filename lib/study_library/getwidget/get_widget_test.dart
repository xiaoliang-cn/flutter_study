// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:xl_flutter/widgets/animates/animations/loading_widget.dart';

// class GetWidgetTest extends StatefulWidget {
//   GetWidgetTest({Key? key}) : super(key: key);

//   @override
//   _GetWidgetTestState createState() => _GetWidgetTestState();
// }

// class _GetWidgetTestState extends State<GetWidgetTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GetWidget'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 //  GFSearchBar(
//                 //   searchList: [1, 2, 3, 4],
//                 //   overlaySearchListItemBuilder: (a) {
//                 //     return Text('aaa');
//                 //   },
//                 //   searchQueryBuilder: (a, b) {
//                 //     return [1,2,3,4,5];
//                 //   }),
//                 Text("按键"),
//                 GFButton(
//                   size: GFSize.LARGE,
//                   onPressed: () {},
//                   child: Text("GFButton"),
//                   color: Colors.blue,
//                   elevation: 3,
//                   blockButton: true,
//                   disabledColor: Colors.red,
//                   splashColor: Colors.red,
//                 ),
//                 GFButtonBar(children: [Text("1"), Text("1")]),
//                 GFCard(color: Colors.grey),
//                 GFCarousel(items: [Text("-aaaa--")]),
//                 // GFAppBar(
//                 //     title: GFAppBarTitleBar(
//                 //   child: Text("aaaaaa"),
//                 // )),
//                 GFShimmer(child: Text("GFShimmer")),
//                 GFBorder(
//                   child: Text("aaadasdda"),
//                   type: GFBorderType.rRect,
//                 ),
//                 GFIconButton(icon: Icon(Icons.add), onPressed: () {}),
//                 GFSocialButton(
//                   onPressed: () {},
//                   child: Text('GFSocialButton'),
//                 ),
//                 GFToggle(onChanged: (value) {}, value: true),
//                 GFTypography(
//                   text: 'AAAAAAAA=GFTypography',
//                   child: Text('ABC'),
//                 ),
//                 GFAccordion(
//                   title: 'GFAccordion',
//                   titleChild: Text('BBBBBBBB'),
//                   content: "aaa",
//                 ),
//                 GFItemsCarousel(rowCount: 3, children: [
//                   Text('GFItemsCarousel'),
//                   Text('GFItemsCarousel'),
//                   Text('GFItemsCarousel')
//                 ]),
//                 GFLoader(
//                   child: Text("GFLoader"),
//                 ),
//                 GFRating(onChanged: (a) {}, value: 5),
//                 GFAvatar(
//                   child: Text("GFAvatar"),
//                 ),
//                 GFBadge(
//                   child: Text("GFBadge"),
//                 ),
//                 GFCheckboxListTile(value: false, onChanged: (a) {}),
//                 GFProgressBar(
//                   child: Text("aaaaaaa"),
//                 ),
//                 GFMultiSelect<String>(items: [
//                   "GFMultiSelect1",
//                   "GFMultiSelect2",
//                   "GFMultiSelect3"
//                 ], onSelect: (a) {}),
//                 GFShimmer(child: Text("GFShimmer")),
//                 GFToast(
//                   text: 'aaabbbccc',
//                 ),
//                 GFTypography(text: "GFTypography"),
//                 // GFAnimation(child: Text("GFAnimation"),type: GFAnimationType.container,height: 99,),
//                 // GFFloatingWidget(child: Text("GFFloatingWidget"),body: Text('abbbbaa'),),
//                 GFRadio(value: 1, groupValue: [0, 1, 2, 3], onChanged: (a) {}),
//                 Shimmer(
//                   linearGradient: LinearGradient(colors: Colors.accents),
//                   child: Column(
//                     children: [
//                       Text("aaaaaa"),
//                       Text("aadadsdaaa"),
//                       Text("aaaaa"),
//                       Text("aaaaa"),
//                       GFMultiSelect<String>(items: [
//                         "GFMultiSelect1",
//                         "GFMultiSelect2",
//                         "GFMultiSelect3"
//                       ], onSelect: (a) {}),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
