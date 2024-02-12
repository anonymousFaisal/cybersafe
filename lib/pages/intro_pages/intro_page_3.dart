import 'package:cybersafe/animation/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:cybersafe/animation/slide_animation.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

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
          //* Slide animation
          SlideAnimation(
            direction: SlideDirection.left,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            child: Text(
              'Recognizing Phishing Attempts',
              style: GoogleFonts.indieFlower(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          //* Slide animation
          SlideAnimation(
            direction: SlideDirection.right,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            child: Text(
              'Learning to recognize phishing attempts is crucial for protecting yourself online.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),

          //* Animated Lottie animation
          //* Scale transition
          ScaleAnimation(
            initialScale: 0.5,
            finalScale: 1.2,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInSine,
            child: Lottie.asset(
              'assets/animations/security.json',
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
