import 'package:animation_playground/page-transition/data/destination_model.dart';
import 'package:flutter/material.dart';

class MainPageTransition extends StatefulWidget {
  // read https://uxdesign.cc/level-up-flutter-page-transition-choreographing-animations-across-screens-efb5ea105fca
  const MainPageTransition({Key? key}) : super(key: key);

  @override
  _MainPageTransitionState createState() => _MainPageTransitionState();
}

class _MainPageTransitionState extends State<MainPageTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 1,
                width: 15,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Malaysia",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: travelDestinations
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              e.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 350,
                                  child: Image.asset(
                                    e.imgAssetsPath[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      color: Colors.black,
                                      width: 100,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
