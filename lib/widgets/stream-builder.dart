import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_tracker/screens/auth.dart';
import 'package:health_tracker/screens/home_screen.dart';
import 'package:health_tracker/screens/splash.dart';


class StreamBuilderWidget extends StatelessWidget{

  const StreamBuilderWidget({super.key});
 // final void Function() onGettingStarted;

  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
     stream: FirebaseAuth.instance.authStateChanges() ,
     builder: (ctx, snapshot) {
       if(snapshot.connectionState == ConnectionState.waiting){
         return const SplashScreen();
       }
       if(snapshot.hasData){
         return HomeScreen();
       }
       return const AuthScreen();
     },
   );
  }
}