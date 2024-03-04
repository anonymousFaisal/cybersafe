import 'dart:async';
import 'package:flutter/material.dart';

class OverlayText extends StatefulWidget {
  final String text;

  const OverlayText({Key? key, required this.text}) : super(key: key);

  @override
  _OverlayTextState createState() => _OverlayTextState();
}

class _OverlayTextState extends State<OverlayText> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.of(context).pop(); // Remove the overlay after 5 seconds
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Remove the overlay if tapped
              },
              child: Container(
                color: Colors.black.withOpacity(0.5), // Semi-transparent background
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: 1.0, // Fully visible
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
