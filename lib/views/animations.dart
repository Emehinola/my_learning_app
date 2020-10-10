import 'package:flutter/material.dart';
import 'package:learning_app/views/display_animation.dart';

// creating an animations screen here...

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Display(imgSource: './assets/adamu.jpg');
  }
}
