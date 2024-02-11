import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double initialScale;
  final double finalScale;

  const ScaleAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.initialScale = 0.5,
    this.finalScale = 1.0,
  }) : super(key: key);

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: widget.initialScale, end: widget.finalScale).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
