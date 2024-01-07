import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home_screen.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
     @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
  }

  class _TabsScreenState extends State<TabsScreen>{
  Widget activePage = HomeScreen();
  var activePageTitle = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
     // drawer: ,
    );
  }

  }