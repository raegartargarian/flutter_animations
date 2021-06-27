import 'package:flutter/material.dart';

class PressButtonScreen extends StatefulWidget {
  const PressButtonScreen({Key? key}) : super(key: key);

  @override
  _PressButtonScreenState createState() => _PressButtonScreenState();
}

class _PressButtonScreenState extends State<PressButtonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller)
      ..addListener(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (ctx, child) {
              return GestureDetector(
                onTap: () => _controller.forward(),
                child: Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: Text(
                        "Press",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
