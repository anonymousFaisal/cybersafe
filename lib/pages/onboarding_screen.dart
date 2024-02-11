import 'package:cybersafe/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cybersafe/pages/intro_pages/index.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // page track controller
  PageController _controller = PageController();

  // track if in last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //* Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //* Skip button
                  GestureDetector(
                    onTap: () {
                      _controller.animateToPage(
                        3,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOutQuad,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        "Skip",
                        style: GoogleFonts.poppins( // Change font to Poppins
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //* Dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      dotColor: Colors.black,
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),

                  //* Next or Done button
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AuthPage();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "Done",
                              style: GoogleFonts.poppins( // Change font to Poppins
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "Next",
                              style: GoogleFonts.poppins( // Change font to Poppins
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
