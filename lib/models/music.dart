import 'package:flutter/material.dart';

class Music {
  Duration? duration;
  String trackId;
  String? artistName;
  String? songName;
  String? songImage;
  String? artistImage;
  Color? songColor;



 Music(
      {this.duration,
        required this.trackId,
        this.artistName,
        this.songName,
        this.songImage,
        this.artistImage,
        this.songColor});
}

// class MusicModel{
//   int? id;
//   String? song_name;
//   String? songURL;
//
//   MusicModel({this.id,this.song_name,this.songURL});
//   MusicModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     song_name = json['song_name'];
//     songURL = json['songURL'];
//   }
// }