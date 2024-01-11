import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/main_drawer.dart';
import 'package:health_tracker/widgets/quotes_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Health tracker",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
        ),
        centerTitle: true,
      ),
      drawer:const MainDrawer(),


      body: const Column(
        children: [
          SizedBox(height: 20),
          QuotesSection(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions),label: 'Meditate'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

        ],
      ),
    );
  }
}

