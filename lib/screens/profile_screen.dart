import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
