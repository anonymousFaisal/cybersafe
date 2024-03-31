import 'package:cybersafe/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroLevel5 extends StatefulWidget {
  const IntroLevel5({Key? key});

  @override
  State<IntroLevel5> createState() => _IntroLevel3State();
}

class _IntroLevel3State extends State<IntroLevel5> {
  String _longPressed = "";
  bool _paymentFound = false;

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
            GestureDetector(
              onLongPress: () {
                setState(() {
                  _longPressed = "payment";
                  _paymentFound = true;
                });
              },
              child: Animate(
                effects: _paymentFound
                    ? [
                        ScaleEffect(
                          curve: ElasticOutCurve(),
                          duration: Duration(seconds: 1),
                        ),
                        ShimmerEffect(
                          duration: Duration(seconds: 10),
                          color: Colors.white60,
                        ),
                      ]
                    : null,
                child: Text(
                  'Payment Option',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
                onPressed: () {},
                onLongPress: () {
                  setState(() {
                    _longPressed = "payment";
                    _paymentFound = true;
                  });
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
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                padding: const EdgeInsets.all(10),
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
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    // Text column
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _longPressed == "payment" && _paymentFound
                                ? AnimatedTextKit(
                                    key: ValueKey<String>(_longPressed),
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        "That's right. There shouldn't be any payment option for Surokkha",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        speed: Duration(milliseconds: 50),
                                      ),
                                      TypewriterAnimatedText(
                                        "It's a government site. So regestrations are free.",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        speed: Duration(milliseconds: 50),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    onFinished: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginOrRegisterPage(),
                                        ),
                                      );
                                    },
                                  )
                                : AnimatedTextKit(
                                    key: ValueKey<String>(_longPressed),
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        "Lastly, can u guess what's wrong with this page?",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        speed: Duration(milliseconds: 50),
                                      ),
                                      TypewriterAnimatedText(
                                        "Again you can long press the section that seems suspicious.",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        speed: Duration(milliseconds: 50),
                                      ),
                                    ],
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
