import 'package:flutter/material.dart';
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child:  IconTheme(
        data: const IconThemeData(color: Colors.black54),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.music_note),
            Transform.translate(
              offset: Offset(0,-15),
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary

                    ]
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3,3),
                        blurRadius: 3
                    )
                  ]
                ),
                  child: const Icon(
                      Icons.home,
                    color: Colors.white,
                  )),
            ),
            const Icon(Icons.credit_score),


          ],
        ),
      ),


    );
  }
}
