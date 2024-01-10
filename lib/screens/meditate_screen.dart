import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
class MeditateScreen extends StatelessWidget {
  const MeditateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Meditate screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
