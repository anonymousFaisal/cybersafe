import 'package:flutter/material.dart';

class PulsatingAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool pulsateContinuously;
  final int pulsateCount;

  const PulsatingAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
    this.pulsateContinuously = true,
    this.pulsateCount = 0,
  }) : super(key: key);

  @override
  _PulsatingAnimationState createState() => _PulsatingAnimationState();
}

class _PulsatingAnimationState extends State<PulsatingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
    if (widget.pulsateContinuously) {
      _controller.repeat(reverse: true);
    } else {
      _controller.repeat(reverse: true, max: widget.pulsateCount.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
