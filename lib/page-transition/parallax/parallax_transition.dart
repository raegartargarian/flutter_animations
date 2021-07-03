import 'package:flutter/material.dart';

class SlideBottomUpRoute extends PageRouteBuilder {
  SlideBottomUpRoute(
      {required this.enterWidget,
      required this.oldWidget,
      RouteSettings? settings})
      : super(
          maintainState: true,
          transitionDuration: const Duration(milliseconds: 350),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0, -1),
                  ).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn),
                  ),
                  child: oldWidget),
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn),
                  ),
                  child: enterWidget),
            ],
          ),
        );

  final Widget enterWidget;
  final Widget oldWidget;
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              SlideBottomUpRoute(enterWidget: SecondRoute(), oldWidget: this),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
