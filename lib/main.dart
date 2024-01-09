import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracker/screens/home_screen.dart';
import 'package:health_tracker/screens/tabs.dart';


final theme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 0, 132, 127),
  ),
  textTheme: GoogleFonts.acmeTextTheme()
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: HomeScreen(),
    );
  }
}
