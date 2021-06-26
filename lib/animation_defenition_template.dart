import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //*-----defining animation and animation controller-----*
  late AnimationController _controller;
  late Animation _myAnimation;

  //*-----initializing animation and animation controller-----*
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //-disposing the animation controller-
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: Center(
          child: Container(
        width: 250,
        height: 250,
        color: Colors.red,
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
}
