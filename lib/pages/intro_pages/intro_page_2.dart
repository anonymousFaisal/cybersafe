import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
          Text(
            'What is phishing?',
            style: GoogleFonts.indieFlower(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
              .animate()
              .slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                begin: -1.0,
              )
              .fadeIn(
                duration: const Duration(milliseconds: 800),
              ),
          const SizedBox(height: 20),
          Text(
            'Phishing is like a sneaky fisherman trying to trick you into biting their hook with fake emails or websites!',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                begin: 1.0,
              )
              .fadeIn(duration: const Duration(milliseconds: 800)),
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
