import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroLevel5 extends StatefulWidget {
  const IntroLevel5({Key? key});

  @override
  State<IntroLevel5> createState() => _IntroLevel3State();
}

class _IntroLevel3State extends State<IntroLevel5> {
  Future<void>? _startAnimationFuture;

  @override
  void initState() {
    super.initState();
    _startAnimationFuture = Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                'lib/images/surokkha logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Payment Option',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader('Payment Details'),
              const SizedBox(height: 20),
              _buildFormTextBox('Name', 'Enter Full name',
                  textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Card no', 'Enter Card Number',
                  textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Exp date', 'MM/YY', textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Security code', 'Enter CVV',
                  textColor: Colors.black),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add payment logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Pay Now',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              //* Game dialogue
              Container(
                margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: FutureBuilder(
                  future: _startAnimationFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Phishing sites, leveraging fake messages and URLs, exploited users by stealing their data ",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "and implementing paywalls to deceive individuals with limited knowledge in such matters.",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "These fraudulent activities resulted in substantial data breaches and financial losses for unsuspecting victims.",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "This is just one of the many phishing attempts happening all over the world.",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "Are you knowledgeable enough to detect them all?",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                          TypewriterAnimatedText(
                            "Well, let's try. Welcome to CyberSafe!",
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: Duration(milliseconds: 50),
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
                    duration: Duration(seconds: 1),
                  )
                  .fadeIn(
                    delay: Duration(seconds: 1),
                    duration: Duration(seconds: 1),
                  )
                  .slideX(
                      delay: Duration(seconds: 1),
                      duration: Duration(seconds: 1),
                      curve: ElasticOutCurve()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormTextBox(String labelText, String hintText,
      {Color textColor = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange[100]!, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 30,
            color: Colors.orange,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
