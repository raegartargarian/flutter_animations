import 'package:flutter/material.dart';

class PulseScreen extends StatefulWidget {
  const PulseScreen({Key? key}) : super(key: key);

  @override
  _PulseScreenState createState() => _PulseScreenState();
}

class _PulseScreenState extends State<PulseScreen>
    with SingleTickerProviderStateMixin {
  Color color = Colors.blueAccent;
  final bevel = 10.0;
  late Offset blurOffset;
  //*-----defining animation and animation controller-----*
  late AnimationController _pulseController;
  late Animation _pulseAnimation;

  //*-----initializing animation and animation controller-----*
  @override
  void initState() {
    super.initState();
    blurOffset = Offset(bevel / 2, bevel / 2);
    _pulseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _pulseAnimation = Tween(begin: 1, end: 0.9).animate(
        CurvedAnimation(parent: _pulseController, curve: Curves.linear));
    _pulseController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: Center(
          child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (ctx, child) {
                return Container(
                  width: (250.0 * _pulseAnimation.value),
                  height: (250.0 * _pulseAnimation.value),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                );
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop_circle_outlined),
        onPressed: () {
          _pulseController.stop();
          //*------Enabling the animation-----*
        },
      ),
    );
  }

  @override
  void dispose() {
    //-disposing the animation controller-
    _pulseController.dispose();
    super.dispose();
  }
}
