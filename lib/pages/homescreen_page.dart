import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cybersafe/components/custom_drawer.dart';
import 'package:cybersafe/components/daily_tips_slider.dart';
import 'package:cybersafe/components/scenerio_level_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final hour = now.hour;
    String greeting;

    // Determine the greeting based on the current hour
    if (hour < 12) {
      greeting = "Good Morning!";
    } else if (hour < 18) {
      greeting = "Good Afternoon!";
    } else {
      greeting = "Good Evening!";
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.primaryColor,
            expandedHeight: 200.0,
            pinned: true,
            elevation: 10.0,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: const ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                child: Image.asset(
                  "assets/images/abstract.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              titlePadding: const EdgeInsets.all(16),
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Cyber',
                    style: GoogleFonts.poppins(fontSize: 25.0),
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.poppins(
                      fontSize: 25.0,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'ALERT',
                          speed: const Duration(
                            milliseconds: 80,
                          ),
                        ),
                        TypewriterAnimatedText(
                          'SECURITY',
                          speed: const Duration(
                            milliseconds: 80,
                          ),
                        ),
                        TypewriterAnimatedText(
                          'SAFE',
                          speed: const Duration(
                            milliseconds: 80,
                          ),
                        ),
                      ],
                      repeatForever: false,
                      pause: const Duration(seconds: 2),
                    ),
                  ),
                ],
              )
                  .animate(
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
                  )
                  .shimmer(
                      duration: const Duration(seconds: 4),
                      color: Colors.purple),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: theme.iconTheme.color),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: theme.colorScheme.secondary.withOpacity(0.5),
                            offset: const Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Let's learn something new today.",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 50),
                    //* Daily Tips Slider
                    DailyTipsSlider(),
                    //* Level selection
                    ScenarioBasedLevels(),
                    const Gap(20),
                    //* Continue
                    Text(
                      "Continue your journey",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recently Completed",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: theme.textTheme.bodyLarge!.color,
                                      ),
                                    ),
                                    Text(
                                      "Covid-19 Message",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: theme.secondaryHeaderColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: theme.iconTheme.color,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
