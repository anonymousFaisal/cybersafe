import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.black87],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  accountName: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(user.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        // Assuming userData contains a 'username' field
                        return Text(
                          'Hey, ${userData['username'] ?? 'User'}',
                          style: GoogleFonts.poppins(fontSize: 30),
                        )
                            .animate(
                              onComplete: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .shimmer(
                                duration: Duration(seconds: 4),
                                color: Colors.purple);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  accountEmail: null,
                  currentAccountPicture: null,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: theme.iconTheme.color,
                  ),
                  title: Text('Home', style: GoogleFonts.poppins(fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: theme.iconTheme.color,
                  ),
                  title: Text('Help', style: GoogleFonts.poppins(fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: theme.iconTheme.color,
                  ),
                  title: Text('Settings',
                      style: GoogleFonts.poppins(fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 30,
              color: theme.iconTheme.color,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            onTap: () async {
              signUserOut();
            },
          ),
        ],
      ),
    );
  }
}
