import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget{
  const StartingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Health App',
        style: TextStyle(
          fontSize: 30,
            fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}