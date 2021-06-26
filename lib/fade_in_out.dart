import 'package:flutter/material.dart';

class FadeInOutScreen extends StatefulWidget {
  const FadeInOutScreen({Key? key}) : super(key: key);

  @override
  _FadeInOutScreenState createState() => _FadeInOutScreenState();
}

class _FadeInOutScreenState extends State<FadeInOutScreen>
    with SingleTickerProviderStateMixin {
  //*-----defining animation and animation controller-----*
  late AnimationController _controller;
  late Animation _fadeInAnimation;
  //*-----initializing animation and animation controller-----*

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fadeInAnimation = Tween(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: Center(
          child: AnimatedBuilder(
              animation: _fadeInAnimation,
              builder: (ctx, child) {
                return Opacity(
                  opacity: _fadeInAnimation.value,
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.red,
                  ),
                );
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          //*------Enabling the animation-----*
          _controller.status == AnimationStatus.completed
              ? _controller.reverse()
              : _controller.forward();
        },
      ),
    );
  }
  //-disposing the animation controller-

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
