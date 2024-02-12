import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics', style: theme.textTheme.titleMedium),
      ),
      body: Center(
        child: Text(
          'Statistics Page',
          style: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}