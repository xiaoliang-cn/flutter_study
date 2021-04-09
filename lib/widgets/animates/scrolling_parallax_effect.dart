import 'package:flutter/material.dart';

class ScrollingParallaxEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滑动视觉效果")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final location in locations)
              LocationListItem(
                imageUrl: location.imageUrl,
                name: location.name,
                country: location.place,
              )
          ],
        ),
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();
  LocationListItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.country})
      : super(key: key);
  final String imageUrl;
  final String name;
  final String country;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubtitle()
              ],
            ),
          ),
        ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        backgroundImageKey: _globalKey,
        listItemContext: context,
        scrollableState: Scrollable.of(context)!,
      ),
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          key: _globalKey,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.95])),
    ));
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
        left: 20,
        bottom: 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              country,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ));
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollableState,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollableState.position);
  final ScrollableState scrollableState;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;
  @override
  void paintChildren(FlowPaintingContext context) {
    print("paintChildren");
    final scrollableBox =
        scrollableState.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);
    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollableState.position.viewportDimension;
    print("viewportDimension=" + viewportDimension.toString());
    print("listItemOffset.dy=" + listItemOffset.dy.toString());
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
    // Calculate the vertical alignment of the background
    // based on the scroll percentage.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    print("paintChildren=" + scrollFraction.toString());

    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    print("backgroundSize" + backgroundSize.toString());
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    context.paintChild(0,
        transform:
            Transform.translate(offset: Offset(0.0, childRect.top)).transform);
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollableState != oldDelegate.scrollableState ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix =
    'https://flutter.dev/docs/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG21gic19777941.jpg',
  ),
  Location(
    name: 'Singapore',
    place: 'China',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG211126508078.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG211126508078.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG21gic19777941.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG211126508078.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG211126508078.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: 'https://goss2.cfp.cn/creative/vcg/800/new/VCG211126508078.jpg',
  ),
];
