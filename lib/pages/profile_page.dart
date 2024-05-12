import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cybersafe/components/level_passed_card.dart';
import 'package:cybersafe/components/time_spent_card.dart';
import 'package:cybersafe/pages/profile_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cybersafe/components/custom_drawer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.primaryColor,
            expandedHeight: 200.0,
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
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'P R O F I L E',
                    style: GoogleFonts.poppins(fontSize: 25.0),
                  ),
                ],
              )
                  .animate(
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
                  )
                  .shimmer(
                      duration: const Duration(seconds: 4),
                      color: Colors.purple),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: theme.iconTheme.color),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileHeader(),
                Gap(20),
                AboutME(),
                Gap(10),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: theme.dividerColor,
                ),
                Gap(10),
                ProfileInfo(),
                Gap(20),
                TimeSpentCard(),
                Gap(20),
                LevelPassedCard(),
              ],
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(user!.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userData['username'] ?? 'User'}',
                        style: GoogleFonts.poppins(fontSize: 30),
                      ),
                      Text(
                        user.email ?? 'User Mail',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileSettings()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(user!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  userData['about me'] ?? 'No about information provided.',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              InfoCard(title: 'Level Completed', data: 'Level 5')
                  .animate()
                  .slideX(
                    begin: -1,
                    duration: Duration(seconds: 2),
                    curve: ElasticOutCurve(),
                  ),
              InfoCard(title: 'Stars Earned', data: '100 Stars')
                  .animate()
                  .slideX(
                    begin: 1,
                    duration: Duration(seconds: 2),
                    curve: ElasticOutCurve(),
                  ),
              InfoCard(title: 'Hidden Achievements', data: '5 Achievements')
                  .animate()
                  .slideX(
                      begin: -1,
                      duration: Duration(seconds: 2),
                      curve: ElasticOutCurve()),
              InfoCard(title: 'Completion Rate', data: '80%').animate().slideX(
                    begin: 1,
                    duration: Duration(seconds: 2),
                    curve: ElasticOutCurve(),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String data;

  const InfoCard({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        // Handle tap action
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
