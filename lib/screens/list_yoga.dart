
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_tracker/screens/yoga_screen_new.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../models/video_model.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/main_drawer.dart';

class ListYoga extends StatelessWidget {
  const ListYoga({super.key});
  Future<List<VideoModel>> readJsonData() async{
    final jsonData = await rootBundle.loadString('jsonFile/videoList.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => VideoModel.fromJson(e)).toList();
  }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Yoga',
//           //${FirebaseAuth.instance.currentUser!.username}
//           style:  TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         toolbarHeight: 120,
//       ),
//
//       body: FutureBuilder(
//           future: readJsonData(),
//           builder: (context,data){
//             if(data.hasError){
//               return Center(
//                 child: Text('${data.error}'),
//               );
//               }
//
//               else if(data.hasData){
//                 var items = data.data as List<VideoModel>;
//                 return ListView.builder(
//                   padding: EdgeInsets.all(16.0),
//
//                   itemCount: items.length,
//                     itemBuilder: (context,index){
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GestureDetector(
//                         onTap: (){
//                           //print(items[index].videoUrl.toString());
//                           Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>  YogaScreenNew(yturl: '${items[index].videoUrl.toString()}',)));
//                         },
//                         child: Card(
//                               elevation: 5,
//                               child: Container(
//                                 margin: EdgeInsets.all(20.0),
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Text(items[index].title.toString())),
//                             ),
//                       )
//
//                     );
//
//                     });
//             }
//               else{
//                 return const Center(
//                   child:  CircularProgressIndicator(),
//                 );
//             }
//           }
//       ),
//       bottomNavigationBar: const BottomNavigation(),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yoga',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        toolbarHeight: 120,
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text('${data.error}'),
            );
          } else if (data.hasData) {
            var items = data.data as List<VideoModel>;
            return ListView.builder(

              padding: EdgeInsets.all(16.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),

                  child: TimelineTile(

                    beforeLineStyle: LineStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    alignment: TimelineAlign.start,
                    lineXY: 0.1, // Adjust the vertical position of the line
                    isFirst: index == 0,
                    isLast: index == items.length - 1,

                    indicatorStyle: IndicatorStyle(
                      width: 40, // Increase the width for a larger circular indicator
                      color: Colors.deepPurple,
                      padding: const EdgeInsets.all(8.0),
                      iconStyle: IconStyle(
                        iconData: Icons.circle,
                        color: Colors.white,
                      ),
                    ),
                    endChild: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>
                              YogaScreenNew(yturl: '${items[index].videoUrl.toString()}'),
                        ));
                      },
                      child: Card(
                        elevation: 5,
                        color: Theme.of(context).colorScheme.primaryContainer,

                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(items[index].title.toString(),
                          style: const TextStyle(
                            fontSize: 18
                          ),
                          ),
                        ),

                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}