import 'package:flutter/material.dart';

// creating animated icons here...

class AnimatedIcon extends StatefulWidget {
  @override
  _AnimatedIconState createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<AnimatedIcon>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  bool is_forward = true; // checks if the animation is forward or not

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // function handling the animation
  _animateIcon() {
    setState(() {
      is_forward = !is_forward;

      is_forward
          ? _animationController.reverse()
          : _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.play_pause,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.home_menu,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.list_view,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.add_event,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.ellipsis_search,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
            // IconButton(
            //     icon: AnimatedIcon(
            //         icon: AnimatedIcons.arrow_menu,
            //         progress: _animationController),
            //     onPressed: () => _animateIcon()),
          ],
        ),
      ),
    );
  }
}
