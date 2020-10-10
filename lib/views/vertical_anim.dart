import 'package:flutter/material.dart';
// import 'package:learning_app/views/display_animation.dart';

class VericalAnim extends StatefulWidget {
  @override
  _VericalAnimState createState() => _VericalAnimState();
}

class _VericalAnimState extends State<VericalAnim>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    animController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    _curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceOut);

    animation = Tween<double>(begin: 0, end: 600).animate(_curvedAnimation)
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
  dispose() {
    animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Container(
            child: Transform.translate(
                offset: Offset(0, animation.value),
                child: Container(
                  child: Text('Just an animated container here...'),
                ))),
      ],
    );
  }
}
