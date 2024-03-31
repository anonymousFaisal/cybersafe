import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cybersafe/pages/levels/intro_level/intro_level_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroLevel4 extends StatefulWidget {
  const IntroLevel4({Key? key});

  @override
  State<IntroLevel4> createState() => _IntroLevel4State();
}

class _IntroLevel4State extends State<IntroLevel4> {
  String _longPressed = "";
  bool _linkFound = false;
  bool _numberFound = false;

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Can You Find Them All?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Press and hold the section that seems suspicious.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/animations/press_and_hold.gif',
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'I Got It',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.phone_android),
            SizedBox(width: 10),
            GestureDetector(
              onLongPress: _numberFound
                  ? null
                  : () {
                      setState(() {
                        _longPressed = "number";
                        _numberFound = true;
                      });
                    },
              child: Animate(
                effects: _numberFound
                    ? [
                        ScaleEffect(
                          curve: ElasticOutCurve(),
                          duration: Duration(seconds: 1),
                        ),
                        ShimmerEffect(
                          duration: Duration(seconds: 10),
                          color: theme.colorScheme.secondary,
                        ),
                      ]
                    : null,
                child: Text(
                  '+123456789',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dear user, third dose of the Covid 19 vaccine is available right now. We have identified that you are eligible to apply for your vaccine. For more information and to apply please Click the link below",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onLongPress: _linkFound
                                    ? null
                                    : () {
                                        setState(() {
                                          _longPressed = "link";
                                          _linkFound = true;
                                        });
                                      },
                                child: Animate(
                                  effects: _linkFound
                                      ? [
                                          ScaleEffect(
                                            curve: ElasticOutCurve(),
                                            duration: Duration(seconds: 1),
                                          ),
                                          ShimmerEffect(
                                            duration: Duration(seconds: 10),
                                            color: theme.colorScheme.secondary,
                                          ),
                                        ]
                                      : null,
                                  child: Text(
                                    "https://surokkha-gov-bd[.]quest/verify-online/",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: const Duration(seconds: 1),
                          )
                          .slideX(
                              duration: const Duration(seconds: 5),
                              curve: const ElasticOutCurve(0.4)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //* Game dialogue
          Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.secondary.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar column
                Column(
                  children: [
                    Image.asset(
                      'assets/animations/avatar1.gif',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _longPressed == "link" && _linkFound
                            ? AnimatedTextKit(
                                key: ValueKey<String>(_longPressed),
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "I knew that link looked suspicious.",
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: Duration(milliseconds: 40),
                                  ),
                                  TypewriterAnimatedText(
                                    "Using brackets [.] instead of a literal period is a technique used by phishers.",
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: Duration(milliseconds: 40),
                                  ),
                                  TypewriterAnimatedText(
                                    "Phishers often use subdomains like 'verify-online' that sound plausible but are misleading.",
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: Duration(milliseconds: 40),
                                  ),
                                  TypewriterAnimatedText(
                                    "Good job finding it 👏",
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: Duration(milliseconds: 40),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                onFinished: _numberFound
                                    ? () {
                                        setState(() {
                                          _longPressed = "";
                                        });
                                      }
                                    : null,
                              )
                            : _longPressed == 'number' && _numberFound
                                ? AnimatedTextKit(
                                    key: ValueKey<String>(_longPressed),
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        "Yeah the number was actually randomly selected🙄",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        speed: Duration(milliseconds: 40),
                                      ),
                                      TypewriterAnimatedText(
                                        "But hey good job finding it. Anything else?",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        speed: Duration(milliseconds: 40),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    onFinished: _linkFound
                                        ? () {
                                            setState(() {
                                              _longPressed = "";
                                            });
                                          }
                                        : null,
                                  )
                                : _linkFound && _numberFound
                                    ? AnimatedTextKit(
                                        key: ValueKey<bool>(
                                            _linkFound && _numberFound),
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "Great job! You found both suspicious elements.",
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            speed: Duration(milliseconds: 40),
                                          ),
                                        ],
                                        onFinished: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  IntroLevel5(),
                                            ),
                                          );
                                        },
                                        totalRepeatCount: 1,
                                      )
                                    : AnimatedTextKit(
                                        key: ValueKey<String>(_longPressed),
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "Let's recheck the message first.",
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            speed: Duration(milliseconds: 70),
                                          ),
                                          TypewriterAnimatedText(
                                            "Can u see anything suspicious?",
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            speed: Duration(milliseconds: 70),
                                          ),
                                        ],
                                        onFinished: () {
                                          _showAlertDialog();
                                        },
                                        totalRepeatCount: 1,
                                      ),
                      ]),
                )
              ],
            ),
          )
              .animate()
              .show(
                duration: Duration(seconds: 1),
              )
              .fadeIn(
                delay: Duration(seconds: 1),
                duration: Duration(seconds: 1),
              )
              .slideX(
                  delay: Duration(seconds: 1),
                  duration: Duration(seconds: 2),
                  curve: ElasticOutCurve()),

          //* Text Input Field and Send Button
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: theme.colorScheme.secondary,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
