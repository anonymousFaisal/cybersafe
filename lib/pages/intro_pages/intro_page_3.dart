import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
          Text(
            'Recognizing Phishing Attempts',
            style: GoogleFonts.indieFlower(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                begin: -1.0,
              ),
          const SizedBox(height: 20),
          //* Slide animation
          Text(
            'Learning to recognize phishing attempts is crucial for protecting yourself online.',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).animate().slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                begin: 1.0,
              ),
          const SizedBox(height: 40),

          //* Animated Lottie animation
          //* Scale transition
          Container(
            child: Lottie.asset(
              'assets/animations/security.json',
              width: 300,
              height: 300,
            ),
          ).animate().scale(
                duration: const Duration(seconds: 3),
                begin: const Offset(0.3, 0.3),
                end: const Offset(1.2, 1.2),
                curve: const ElasticOutCurve(0.45),
              ),
        ],
      ),
    );
  }
}
