import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  const SlideScreen({Key? key}) : super(key: key);

  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _slideAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(2, 0.0)).animate(
            CurvedAnimation(parent: _slideController, curve: Curves.linear));
    _slideController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: Center(
          child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: 250,
          height: 250,
          color: Colors.red,
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          //*------Enabling the animation-----*
        },
      ),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
}
