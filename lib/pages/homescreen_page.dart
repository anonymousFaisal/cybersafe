import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: theme.textTheme.titleMedium),
      ),
      body: Center(
        child: Text(
          'Home Screen Page',
          style: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}