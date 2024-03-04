import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                speed: const Duration(milliseconds: 150),
                "Did you know?",
                textStyle: GoogleFonts.indieFlower(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            totalRepeatCount: 1,
          ),
          const SizedBox(height: 20),
          //* Slide animation
          Text(
            'Over 200 million phishing attempts are made worldwide each year.',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).animate().slideX(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
              ),
          const SizedBox(height: 40),

          //* Animated Lottie animation
          //* Scale transition
          Container(
            child: Lottie.asset(
              'assets/animations/world_pointer.json',
              width: 300,
              height: 300,
            ),
          ).animate().scale(
                duration: const Duration(seconds: 3),
                begin: const Offset(0.3, 0.3),
                end: const Offset(1.6, 1.6),
                curve: const ElasticOutCurve(0.45),
              ),
        ],
      ),
    );
  }
}
