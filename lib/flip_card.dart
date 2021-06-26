import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardScreen extends StatefulWidget {
  const FlipCardScreen({Key? key}) : super(key: key);

  @override
  _FlipCardScreenState createState() => _FlipCardScreenState();
}

class _FlipCardScreenState extends State<FlipCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFront = true;
  double verticalDrag = 0;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        _controller.reset();
        setState(() {
          verticalDrag = 0;
          isFront = true;
        });
      },
      onVerticalDragEnd: (details) {
        final double end = 360 - verticalDrag >= 180 ? 0 : 360;
        _animation =
            Tween<double>(begin: verticalDrag, end: end).animate(_controller)
              ..addListener(() {
                setState(() {
                  verticalDrag = _animation.value;
                  _setImageSide();
                });
              });
        _controller.forward();
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          verticalDrag += details.delta.dy;
          verticalDrag %= 360;
          _setImageSide();
        });
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(verticalDrag / 180 * pi),
        child: isFront
            ? _imageWidget("assets/1_front.png")
            : _imageWidget("assets/1_back.png"),
      ),
    );
  }

  Container _imageWidget(img) => Container(
        height: 110,
        child: Center(
          child: Image.asset(
            img,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
  _setImageSide() {
    if (verticalDrag <= 90 || verticalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
