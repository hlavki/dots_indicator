library dots_indicator;

import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  static const Size kDefaultSize = const Size.square(9.0);
  static const EdgeInsets kDefaultSpacing =
  const EdgeInsets.symmetric(horizontal: 6.0);
  static const ShapeBorder kDefaultShape = const CircleBorder();

  final int numberOfDot;
  final int position;
  final Color dotColor;
  final Color dotActiveColor;
  final Size dotSize;
  final Size dotActiveSize;
  final ShapeBorder dotShape;
  final ShapeBorder dotActiveShape;
  final EdgeInsets dotSpacing;

  const DotsIndicator(
      {Key key,
        @required this.numberOfDot,
        this.position = 0,
        this.dotColor = Colors.grey,
        this.dotActiveColor = Colors.lightBlue,
        this.dotSize = kDefaultSize,
        this.dotActiveSize = kDefaultSize,
        this.dotShape = kDefaultShape,
        this.dotActiveShape = kDefaultShape,
        this.dotSpacing = kDefaultSpacing})
      : super(key: key);

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDot; i++) {
      final color = (i == position) ? dotActiveColor : dotColor;
      final size = (i == position) ? dotActiveSize : dotSize;
      final shape = (i == position) ? dotActiveShape : dotShape;

      dots.add(
        Container(
          width: size.width,
          height: size.height,
          margin: dotSpacing,
          decoration: ShapeDecoration(color: color, shape: shape),
        ),
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _generateDots());
  }
}
