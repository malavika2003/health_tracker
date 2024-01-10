import 'package:flutter/material.dart';
class QuotesSection extends StatelessWidget {
  const QuotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(

        margin: EdgeInsets.all(20),
        shadowColor: Colors.black38,
        elevation: 4,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
        clipBehavior: Clip.hardEdge,

            child: Stack(
                children :[
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/images/meditate1.jpg',
                      width: double.infinity,

                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                        child:Text(
                          "\"He who has health has hope, and he who has hope has everything.\"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                    ),


            ]

        )


    );


  }
}
