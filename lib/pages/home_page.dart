import 'package:cybersafe/pages/homescreen_page.dart';
import 'package:cybersafe/pages/levels/level_page.dart';
import 'package:cybersafe/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const HomeScreenPage(),
    const LevelPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: theme.colorScheme.background,
        color: theme.primaryColor,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: theme.iconTheme.color,
          ),
          Icon(
            Icons.window_rounded,
            color: theme.iconTheme.color,
          ),
          Icon(
            Icons.person,
            color: theme.iconTheme.color,
          ),
        ],
      ),
    );
  }
}
