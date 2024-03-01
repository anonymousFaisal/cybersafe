import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cybersafe/pages/levels/intro_level/intro_level_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroLevel extends StatefulWidget {
  const IntroLevel({super.key});

  @override
  State<IntroLevel> createState() => _IntroLevelState();
}

class _IntroLevelState extends State<IntroLevel> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        children: [
          //* Message animation
          Positioned(
            top: 250,
            left: 10,
            right: 30,
            child: Center(
              child: Lottie.asset(
                'assets/animations/message.json',
                repeat: false,
              ),
            ),
          ).animate().fadeOut(
                duration: Duration(seconds: 1),
                delay: Duration(seconds: 4),
              ),
          //* message icon
          Positioned(
            top: 300,
            left: 10,
            right: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  //* Navigate to IntroLevel1
                  context,
                  MaterialPageRoute(builder: (context) => IntroLevel1()),
                );
              },
              child: Center(
                child: Icon(
                  Icons.email,
                  color: Colors.blue,
                  size: 120,
                ),
              ),
            ),
          )
              .animate()
              .scale(
                delay: Duration(seconds: 5),
                duration: Duration(seconds: 2),
                curve: ElasticOutCurve(),
              )
              .fadeIn(
                delay: Duration(seconds: 5),
                duration: Duration(seconds: 2),
              ),
          //* Typewriter texts
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Looks like you got a new text message.",
                  textStyle: GoogleFonts.poppins(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "Looks important.",
                  textStyle: GoogleFonts.poppins(fontSize: 25),
                ),
                TypewriterAnimatedText(
                  "You should check it.",
                  textStyle: GoogleFonts.poppins(fontSize: 25),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
