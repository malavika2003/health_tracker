// //import 'package:audioplayers/audioplayers.dart';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// //import 'package:health_tracker/data/music_list_data.dart';
// import 'package:health_tracker/models/music.dart';
// //import 'package:spotify/spotify.dart';
// //import 'package:youtube_explode_dart/youtube_explode_dart.dart';
//
// import '../constants/strings.dart';
//
//
//
//
//
// class MusicList extends StatelessWidget {
//    final List<Map<String, String>> songs;
//
//    MusicList({required this.songs});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: ListView.builder(
//         itemCount: songs?.length??0,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               //title: Text("ID: ${songs![index]['songs']}"),
//               title: Text( '${songs![index]['song name']}'),
//               onTap: () {
//
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// Future<List<Map<String, String>>> loadSongs() async {
//   String jsonString = await rootBundle.loadString('jsonFile/audio_list.json');
//   List<dynamic>? jsonResponse = json.decode(jsonString);
//
//   if (jsonResponse != null) {
//     List<Map<String, String>> songs = jsonResponse.map((item) {
//       Map<String, dynamic> typedItem = item.cast<String, dynamic>();
//
//       // Check and convert each value to a string
//       return Map<String, String>.from(typedItem.map((key, value) {
//         return MapEntry(key, value.toString());
//       }));
//     }).toList();
//
//     return songs;
//   } else {
//     return [];
//   }
// }
//
//
//
// // Future<List<Map<String, String>>> loadSongs() async {
// //   String jsonString = await rootBundle.loadString('assets/songs.json');
// //   List<dynamic> jsonResponse = json.decode(jsonString);
// //
// //   // Ensure each item is cast to Map<String, String>
// //   List<Map<String, String>> songs = jsonResponse.map((item) {
// //     return Map<String, String>.from(item);
// //   }).toList();
// //
// //   return songs;
// // }
//
// // Future<List<MusicModel>>ReadJsonData() asynv{
// //   final jsonData = await rootBundle.rootBundle.loadString('jsonFile')
// //}
