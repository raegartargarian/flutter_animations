import 'package:animation_playground/page-transition/data/destination_model.dart';
import 'package:flutter/material.dart';

class DetailPageTransition extends StatefulWidget {
  final DestinationModel detail;
  const DetailPageTransition({Key? key, required this.detail})
      : super(key: key);

  @override
  _DetailPageTransitionState createState() => _DetailPageTransitionState();
}

class _DetailPageTransitionState extends State<DetailPageTransition> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
