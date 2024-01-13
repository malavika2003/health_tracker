class VideoModel{
  int? id;
  String? title;
  String? videoUrl;

  VideoModel({this.id,this.title,this.videoUrl});
  VideoModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
  }
}