import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:cybersafe/animation/slide_animation.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

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
          SlideAnimation(
            direction: SlideDirection.right,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            child: Text(
              'What is phishing?',
              style: GoogleFonts.indieFlower(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SlideAnimation(
            direction: SlideDirection.left,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            child: Text(
              'Phishing is like a sneaky fisherman trying to trick you into biting their hook with fake emails or websites!',
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
          Lottie.asset(
            'assets/animations/phishing_notification.json',
            width: 300,
            height: 300,
            repeat: false,
          ),
        ],
      ),
    );
  }
}
