import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyTipsSlider extends StatelessWidget {
  final List<String> dailyTips = [
    "Be wary of unsolicited emails.",
    "Use email filters to block suspicious emails.",
    "Check email sender addresses for discrepancies.",
    "Look for phishing signs in emails.",
    "Hover over links in emails to see the actual URL.",
    "Enable two-factor authentication (2FA).",
    "Regularly update devices and apps.",
    "Use a VPN on public Wi-Fi networks.",
    "Install and update antivirus software.",
    "Backup your data regularly.",
    "Limit the information you share online.",
    "Regularly check accounts for unauthorized activity.",
    "Use secure and private browsing modes.",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: dailyTips.map((tip) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lightbulb_outline,
                                size: 30, color: theme.iconTheme.color),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Tip of the Day",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          children: <Widget>[
                            Text(
                              tip,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: theme.textTheme.bodyMedium!.color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
