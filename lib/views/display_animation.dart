import 'package:flutter/material.dart';
import 'dart:math' as math;

// creating an animations screen here...

class Display extends StatefulWidget {
  final String imgSource;

  Display({this.imgSource});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> with SingleTickerProviderStateMixin {
  AnimationController
      animController; // generates values within the range of 0 to 1 only
  Animation<double> animation; // for generating values from a given range
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    animController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    _curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves
            .bounceOut); // this makes the animation not to go in a non-linear manner

    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(_curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animController.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation
          .value, // animation.value gets the generated value from the animation
      child: Container(
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            child: CircleAvatar(backgroundImage: AssetImage(widget.imgSource)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(720)),
          ),
        ),
      ),
    );
  }
}
