import 'package:flutter/material.dart';

class ChairItem {
  final String name;
  final String image;
  final String price;

  ChairItem(this.name, this.image, this.price);
}

List<ChairItem> chairList = [
  ChairItem('Padded Chair', 'assets/images/trichair.png', '\$122.99'),
  ChairItem('Sofa', 'assets/images/Sofa.png', '\$82.99'),
  ChairItem('Chair', 'assets/images/Chair.png', '\$22.99')
];

class Chair extends StatefulWidget {
  @override
  _ChairState createState() => _ChairState();
}

class _ChairState extends State<Chair> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);
    super.initState();
  }

  double chair1Opacity = 1;
  double chair2Opacity = 1;
  double chair3Opacity = 1;

  double getChair1Opacity() {
    if (controller.value <= 0.66)
      return 0;
    else if (controller.value >= 0.66 && controller.value <= 1) {
      double op = (controller.value - 0.66) * 3;
      if (op > 1)
        return 1;
      else
        return op;
    } else
      return 1;
  }

  double getChair2Opacity() {
    if (controller.value <= 0.33)
      return 0;
    else if (controller.value >= 0.33 && controller.value <= 0.66)
      return (controller.value - 0.33) * 3;
    else
      return 1;
  }

  double getChair3Opacity() {
    if (controller.value <= 0.33)
      return controller.value * 3;
    else
      return 1;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;
    return Container(
        height: _width * 0.28,
        width: _width * 0.28,
        child: Stack(
          children: [
            Image.asset('assets/images/chairblack.png'),
            AnimatedChair(
                assetName: 'assets/images/chairred.png',
                controller: controller,
                getChairOpacity: getChair3Opacity),
            AnimatedChair(
                assetName: 'assets/images/chairyellow.png',
                controller: controller,
                getChairOpacity: getChair2Opacity),
            AnimatedChair(
                assetName: 'assets/images/chairgreen.png',
                controller: controller,
                getChairOpacity: getChair1Opacity),
          ],
        ));
  }
}

class AnimatedChair extends StatelessWidget {
  final String assetName;
  final AnimationController controller;
  final Function getChairOpacity;

  const AnimatedChair(
      {Key key, this.assetName, this.controller, this.getChairOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: getChairOpacity(),
            child: child,
          );
        },
        child: Image.asset(assetName));
  }
}
