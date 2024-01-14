import 'package:flutter/material.dart';
import 'package:health_tracker/screens/music_screen.dart';
//import 'package:health_tracker/views/music_player.dart';
//import 'package:health_tracker/views/music_player.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/main_drawer.dart';
import 'blogs_next.dart';
import 'list_yoga.dart';
class MeditateScreen extends StatelessWidget {
  const MeditateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meditate",
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge!
              .copyWith(
              color: Colors.black)
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(24.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          SizedBox(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
                side: BorderSide(color: Colors.blueGrey, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MusicList()),
                      );
                    },
                    icon: const Icon(
                      Icons.music_note_outlined,
                      size: 100,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Music',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
                side: const BorderSide(color: Colors.blueGrey, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const ListYoga()));
                    },
                    icon: const Icon(
                      Icons.self_improvement_outlined,
                      size: 100,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Yoga',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
                side: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const BlogsNextScreen()));
                    },
                    icon: const Icon(
                      Icons.book,
                      color: Colors.blueGrey,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Blogs',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}