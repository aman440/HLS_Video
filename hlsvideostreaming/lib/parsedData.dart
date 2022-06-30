import 'dart:collection';

class VideoData {
  late int id;
  late String title;
  late String url;
  late String coverPicture;

  VideoData({
    required this.id,
    required this.title,
    required this.url,
    required this.coverPicture
  });

  factory VideoData.fromJson(Map<String, dynamic> json){
    return VideoData(id: json["id"], title: json["title"], url: json["videoUrl"], coverPicture: json["coverPicture"]);
  }
}