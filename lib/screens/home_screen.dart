import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/main_drawer.dart';
import 'package:health_tracker/widgets/quotes_area.dart';
import 'package:health_tracker/widgets/emoji_card.dart';
import '../widgets/bottom_navigation_bar.dart';
//import 'package:http/http.dart' as http;




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override



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


      body: ListView(
        children: [Column(
          children: [
            const SizedBox(height: 20),
            const QuotesSection(),
            const SizedBox(height: 20),
            MoodInputScreen(),
            const SizedBox(height: 20),

          ],
        ),]
      ),


      bottomNavigationBar: const BottomNavigation(),
    );

  }

}

