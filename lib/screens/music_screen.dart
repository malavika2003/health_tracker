
import 'package:flutter/material.dart';
//import 'package:health_tracker/views/music_player.dart';
import 'package:health_tracker/widgets/bottom_navigation_bar.dart';

import '../views/music_player.dart';

class MusicList extends StatelessWidget {
  final List<String> cardTitles = [
    'Not Afraid',
    "Destiny",
    "Never Back Down",
    'Heart of a Warrior',
    'Unstopable',
    'pink venom'
  ];
  final List<String> cardImages = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Ftitle%2Ftt6715294%2F&psig=AOvVaw2ev0eGRNUYTm0kdPnmDdYQ&ust=1705321654377000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCKibzK_w3IMDFQAAAAAdAAAAABAD',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DDcSHUkAqmQ4&psig=AOvVaw0Ln0QGMvQves7eXeik6uWP&ust=1705321761000000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMDx6uDw3IMDFQAAAAAdAAAAABAD',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D6V2SwbVi_O0&psig=AOvVaw1IzoKzPYR5UwhuFHlVyKdB&ust=1705321827820000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCOiPv4Hx3IMDFQAAAAAdAAAAABAD',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D7zLJ-12cyGg&psig=AOvVaw2NuVmGeK_xw4eiJxqgf1Ah&ust=1705321910588000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCKi9o6jx3IMDFQAAAAAdAAAAABAD',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Femorywheel.com%2Fsias-this-is-acting-is-unstoppable%2F&psig=AOvVaw3U9DHYnPlEcL1-RfBDeXHz&ust=1705321941750000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCLDB0rjx3IMDFQAAAAAdAAAAABAH',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("PlayList",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF30314D),
      ),
      body: ListView.builder(
        itemCount: cardTitles.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0XFF899CCF),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              height: 100,
              margin: EdgeInsets.only(top: 13, right: 12, left: 5),
              decoration: BoxDecoration(

              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,// Center text vertically
                children: [
                  ListTile(
                    title: Center(
                      child: Row(
                        children: [
                          Text(
                            cardTitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7)
                            ),

                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Color(0xFF30314D),


      //bottomNavigationBar: const BottomNavigation(),
    );
  }
}
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Music List"),
//         centerTitle: true,
//
//       ),
//       body: GridView(
//            padding: const EdgeInsets.all(24.0),
//            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 1,
//           childAspectRatio: 1.8,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//     ),
//         children: [
//           SizedBox(
//             height: 100,
//
//           )
//         ],
//       )
//
//     );
//
//   }
// }
