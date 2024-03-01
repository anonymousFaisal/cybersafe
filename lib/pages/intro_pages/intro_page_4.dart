import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animate(
            effects: [
              FadeEffect(
                  begin: 0.0,
                  end: 1.0,
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
              ScaleEffect(
                  begin: Offset(0.5, 0.5),
                  end: Offset(1.0, 1.0),
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
            ],
            child: Text(
              "Let's introduce our game",
              style: GoogleFonts.indieFlower(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Animate(
            effects: [
              FadeEffect(
                  begin: 0.0,
                  end: 1.0,
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
              SlideEffect(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
            ],
            child: Image.asset(
              'lib/images/logo/logo_transparent.png',
              width: 400,
              height: 400,
            ),
          ),
          const SizedBox(height: 10),
          Animate(
            effects: [
              FadeEffect(
                  begin: 0.0,
                  end: 1.0,
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
              ScaleEffect(
                  begin: Offset(0.5, 0.5),
                  end: Offset(1.0, 1.0),
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
            ],
            child: Text(
              "Here you will learn how to identify the latest phishing trends through interactive scenarios.",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Animate(
            effects: [
              FadeEffect(
                  begin: 0.0,
                  end: 1.0,
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
              ScaleEffect(
                  begin: Offset(0.5, 0.5),
                  end: Offset(1.0, 1.0),
                  curve: Curves.easeInOut,
                  duration: 2000.milliseconds),
            ],
          ),
        ],
      ),
    );
  }
}
