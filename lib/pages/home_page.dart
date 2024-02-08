import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: theme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: theme.iconTheme.color,
                  size: 30,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium!.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  signUserOut();
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
