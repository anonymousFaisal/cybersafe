import 'package:cybersafe/components/level_card.dart';
import 'package:cybersafe/pages/levels/intro_level/intro_level_1.dart';
import 'package:flutter/material.dart';

class LevelList {
  static List<LevelCard> getLevels() {
    return [
      LevelCard(
      levelNumber: 0,
      levelName: 'COVID-19 Message',
      starRating: 3,
      progress: 100,
      iconData: Icons.medication,
      route: MaterialPageRoute(builder: (context) => IntroLevel1()),
    ),
    LevelCard(
      levelNumber: 1,
      levelName: 'Job Recruit Mail',
      starRating: 2,
      progress: 75,
      iconData: Icons.work,
    ),
    LevelCard(
      levelNumber: 2,
      levelName: 'Clickable Movie Site',
      starRating: 1,
      progress: 25,
      iconData: Icons.movie,
    ),
    LevelCard(
      levelNumber: 3,
      levelName: 'Facebook text',
      starRating: 3,
      progress: 90,
      iconData: Icons.facebook,
    ),
    LevelCard(
      levelNumber: 4,
      levelName: 'Online shopping',
      starRating: 3,
      progress: 100,
      iconData: Icons.shopping_cart,
    ),
    LevelCard(
      levelNumber: 5,
      levelName: 'Reward mails',
      starRating: 3,
      progress: 60,
      iconData: Icons.money,
    ),
    LevelCard(
      levelNumber: 6,
      levelName: 'Change password',
      starRating: 2,
      progress: 80,
      iconData: Icons.lock,
    ),
    LevelCard(
      levelNumber: 7,
      levelName: 'Recruit Chat',
      starRating: 1,
      progress: 40,
      iconData: Icons.work,
    ),
    LevelCard(
      levelNumber: 8,
      levelName: 'Online Dating',
      starRating: 3,
      progress: 75,
      iconData: Icons.person_add,
    ),
    LevelCard(
      levelNumber: 10,
      levelName: 'Travel Agency',
      starRating: 1,
      progress: 25,
      iconData: Icons.flight,
    ),
    ];
  }
}