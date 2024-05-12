import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelCard extends StatelessWidget {
  final int levelNumber;
  final String levelName;
  final int starRating;
  final double progress;
  final IconData iconData;
  final Route? route;

  const LevelCard({
    super.key,
    required this.levelNumber,
    required this.levelName,
    required this.starRating,
    required this.progress,
    required this.iconData,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.9;

    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.of(context).push(route!);
        } else {
          // Optionally, show a message or handle the case when route is null
          debugPrint("Route is null");
        }
      },
      child: Card(
        child: Container(
          width: cardWidth,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(iconData, size: 38),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level $levelNumber',
                          style: GoogleFonts.poppins(fontSize: 12.0),
                        ),
                        const Gap(5),
                        Text(
                          levelName,
                          style: GoogleFonts.poppins(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List<Widget>.generate(starRating, (index) {
                      return Icon(Icons.star, color: theme.iconTheme.color);
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 20,
                      child: AnimatedBuilder(
                        animation: ValueNotifier<double>(progress / 100),
                        builder: (BuildContext context, Widget? child) {
                          return LinearProgressIndicator(
                            value: ValueNotifier<double>(progress / 100).value,
                            backgroundColor: theme.colorScheme.background,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.purple),
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${(progress / 100 * 100).round()}%',
                      style: GoogleFonts.poppins(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
