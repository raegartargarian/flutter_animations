import 'package:animation_playground/3d_flip.dart';
import 'package:animation_playground/bounce.dart';
import 'package:animation_playground/fade_in_out.dart';
import 'package:animation_playground/flip_card.dart';
import 'package:animation_playground/pulse.dart';
import 'package:animation_playground/slide.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => FadeInOutScreen(),
                    ),
                  );
                },
                color: Colors.red,
                child: Center(
                    child: Text(
                  "Fade in / out",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => PulseScreen(),
                    ),
                  );
                },
                color: Colors.blueAccent,
                child: Center(
                    child: Text(
                  "Pulse",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SlideScreen(),
                    ),
                  );
                },
                color: Colors.green,
                child: Center(
                    child: Text(
                  "slide",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => BounceScreen(),
                    ),
                  );
                },
                color: Colors.brown,
                child: Center(
                    child: Text(
                  "bounce",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ThreeDFlip(),
                    ),
                  );
                },
                color: Colors.cyan,
                child: Center(
                    child: Text(
                  "3d flip",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => FlipCardScreen(),
                    ),
                  );
                },
                color: Colors.orange,
                child: Center(
                    child: Text(
                  "card flip",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
