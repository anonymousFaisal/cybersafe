import 'package:flutter/material.dart';

enum SlideDirection { left, right }

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Curve curve;
  final bool useOpacity;

  SlideAnimation({
    required this.child,
    required this.direction,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
    this.useOpacity = true,
  });

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(
        widget.direction == SlideDirection.left ? 1.0 : -1.0,
        0.0,
      ),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.useOpacity
          ? FadeTransition(
              opacity: _opacityAnimation,
              child: widget.child,
            )
          : widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
