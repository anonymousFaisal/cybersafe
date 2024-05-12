import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ScenarioBasedLevels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Choose levels based on scenario",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(10),
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard(Icons.email, "Email Based", () {
                // Handle tap for Email Based card
                print("Email Based card tapped");
              }),
              _buildCard(Icons.web, "Website Based", () {
                // Handle tap for Website Based card
                print("Website Based card tapped");
              }),
            ],
          ),
        ),
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard(Icons.chat, "Chat Based", () {
                // Handle tap for Chat Based card
                print("Chat Based card tapped");
              }),
              _buildCard(Icons.ad_units, "Ad Based", () {
                // Handle tap for Ad Based card
                print("Ad Based card tapped");
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(IconData icon, String text, VoidCallback onTap) {
    return InkWell(

      onTap: onTap,
      child: Container(
        width: 180,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(icon, size: 50,),
                Text(text,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
