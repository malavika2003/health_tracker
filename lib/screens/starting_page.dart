import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/stream-builder.dart';


class StartingPage extends StatelessWidget{
  const StartingPage({super.key});
  //final void Function() onGettingStarted;



  @override
  Widget build(BuildContext context) {
   // double screenWidth = MediaQuery.of(context).size.width;
   // print(screenWidth/2.0);
    return  Scaffold(
     body: Stack(
       children: [
         Opacity(
           opacity: 0.6,
           child: Container(
             height: double.infinity,
             width: double.infinity,
             decoration: const BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('assets/images/cyclebunny.jpg'),
                   fit: BoxFit.cover),
             ),
           ),
         ),
         const Center(
           child: Text('Personalised App to track your mental health..',
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 45,
             ),
           ),
         ),

         Positioned(
         bottom: 150,
           left: 165,
           child: OutlinedButton(
               onPressed: (){
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) =>
                const StreamBuilderWidget()
                 )
                 );
               },
             style: ElevatedButton.styleFrom(
               shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
               foregroundColor: Theme.of(context).colorScheme.onTertiary,
               side: BorderSide(
                   color: Theme.of(context).colorScheme.onSurface,
                 width: 3
               )
             ),
               child: const Text('Get Started!'),
           ),
         )
       ]
     ),

    );
  }
}