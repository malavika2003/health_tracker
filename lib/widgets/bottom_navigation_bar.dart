import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home_screen.dart';
import 'package:health_tracker/screens/meditate_screen.dart';
import 'package:health_tracker/screens/profile_screen.dart';
import 'package:health_tracker/screens/task_screen.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});


  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentPageIndex = 0;
  static const List<Widget> _widgetoptions = <Widget>[
     HomeScreen(),
    MeditateScreen(),
   TaskScreen(),
     ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) =>
        _widgetoptions.elementAt(_currentPageIndex))
      );
    });
  }


  @override
  Widget build(BuildContext context) {

    return
      BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,


      items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon : Icon(Icons.home,
            color: Colors.black54,),
            //icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Meditate',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Task',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',

          ),

        ],
      currentIndex: _currentPageIndex,

      backgroundColor: Colors.black54,
      onTap: _onItemTapped,




    );
  }
}
