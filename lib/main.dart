//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:health_tracker/screens/auth.dart';
//import 'package:health_tracker/screens/home_screen.dart';
//import 'package:health_tracker/screens/splash.dart';
import 'package:health_tracker/screens/starting_page.dart';
//import 'package:health_tracker/screens/tabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_tracker/screens/task_screen.dart';
import 'firebase_options.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
   // brightness: Brightness.light,
      //seedColor: const Color.fromARGB(255, 0, 132, 127),
    seedColor: const Color.fromARGB(255, 0, 0, 139),
  ),
  textTheme: GoogleFonts.acmeTextTheme()
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: const StartingPage()
      //const TaskScreen(),
    );
  }
}
