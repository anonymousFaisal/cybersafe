import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cybersafe/pages/levels/intro_level/intro_level_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroLevel1 extends StatefulWidget {
  const IntroLevel1({Key? key});

  @override
  State<IntroLevel1> createState() => _IntroLevel1State();
}

class _IntroLevel1State extends State<IntroLevel1> {
  Future<void>? _startAnimationFuture;

  @override
  void initState() {
    super.initState();
    _startAnimationFuture = Future.delayed(Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.phone_android),
            SizedBox(width: 10),
            Text(
              '+123456789',
              style: TextStyle(fontSize: 16),
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IntroLevel2()),
                                  );
                                },
                                child: Text(
                                  "https://surokkha-gov-bd[.]quest/verify-online/",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
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
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            padding: const EdgeInsets.all(20),
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
            child: FutureBuilder(
              future: _startAnimationFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AnimatedTextKit(
                    onTap: () {
                      
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Hey there!!!",
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: Duration(milliseconds: 40),
                      ),
                      TypewriterAnimatedText(
                        "I'm the narrator.",
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: Duration(milliseconds: 40),
                      ),
                      TypewriterAnimatedText(
                        "I will be guiding you through this journey",
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        "Ready to take on the cyber world? 💻",
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        "Did you register for your COVID-19 vaccine yet? 🦠💉",
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        "Don't worry, I think you already got a message for it. Click the link above and let's get you vaccinated!",
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 50),
                      ),
                      TyperAnimatedText(
                        "Wait... does that link look a bit sketchy to you? 🤔",
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 40),
                      ),
                      TypewriterAnimatedText(
                        "Hmm... but hey, who needs trust when you've got curiosity, right? 😉",
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 40),
                      ),
                    ],
                    totalRepeatCount: 1,
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
              .animate()
              .show(
                duration: Duration(seconds: 3),
              )
              .fadeIn(
                delay: Duration(seconds: 3),
                duration: Duration(seconds: 1),
              )
              .slideX(
                  delay: Duration(seconds: 3),
                  duration: Duration(seconds: 1),
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
                    decoration: InputDecoration(
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
