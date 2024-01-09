import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your companion",
          textAlign: TextAlign.center,
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}