import 'package:cybersafe/pages/homescreen_page.dart';
import 'package:cybersafe/pages/settings_page.dart';
import 'package:cybersafe/pages/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    HomeScreenPage(),
    StatisticsPage(),
    SettingsPage(),
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
            Icons.bar_chart,
            color: theme.iconTheme.color,
          ),
          Icon(
            Icons.settings,
            color: theme.iconTheme.color,
          ),
        ],
      ),
    );
  }
}
