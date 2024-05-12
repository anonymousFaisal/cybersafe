import 'package:cybersafe/components/custom_drawer.dart';
import 'package:cybersafe/components/level_card.dart';
import 'package:cybersafe/pages/levels/level_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<LevelCard> levels = LevelList.getLevels();

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.primaryColor,
            expandedHeight: 100.0,
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
              title: Text(
                "L E V E L",
                style: GoogleFonts.poppins(fontSize: 25.0),
              )
                  .animate(
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
                  )
                  .shimmer(
                      duration: const Duration(seconds: 4),
                      color: Colors.purple),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: levels,
              ),
            ]),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
