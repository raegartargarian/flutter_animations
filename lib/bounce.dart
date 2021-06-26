import 'package:flutter/material.dart';

class BounceScreen extends StatefulWidget {
  const BounceScreen({Key? key}) : super(key: key);

  @override
  _BounceScreenState createState() => _BounceScreenState();
}

class _BounceScreenState extends State<BounceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween(begin: 200.0, end: 120.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: AnimatedBuilder(
          animation: _slideAnimation,
          builder: (ctx, ch) => Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: _slideAnimation.value, left: 125),
                color: Colors.cyan,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          //*------Enabling the animation-----*
          _controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
