import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/main_drawer.dart';
class MeditateScreen extends StatelessWidget {
  const MeditateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(title:  Text("Meditate",
       style: Theme.of(context).textTheme.headlineLarge!.copyWith(
           color: Theme.of(context).colorScheme.onBackground
       ),
     ),
       centerTitle: true,
     ),
    drawer:const MainDrawer(),
      // body:  Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Expanded(
      //     child: ListView(
      //      padding: EdgeInsets.all(8.0),
      //      // crossAxisCount: 1,
      //       //childAspectRatio: 3/2,
      //       children: [
      //         SizedBox(
      //         child:  Card(
      //             child: Text('Music'),
      //           ),),
      //         SizedBox(
      //
      //           child: Card(
      //             child: Text('yoga'),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 200,
      //           child: Card(
      //
      //             child: Text('blog'),
      //           ),
      //         )
      //
      //       ],
      //
      //     ),
      //   ),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(24.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
              crossAxisCount: 1 ,
              childAspectRatio: 1.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
     ),
          children:  [
            SizedBox(
              height: 100,
              width: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90)
                ),
                child: Center(child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.music_note_outlined,
                    size: 100,
                    ))),
              ),
            ),
            SizedBox(
              child: Card(
                child: Center(child: Text('music')),
              ),
            ),
            SizedBox(
              child: Card(
                child: Center(child: Text('music')),
              ),
            )
          ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
