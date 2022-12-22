// To parse this JSON data, do
//
//     final semesterModel = semesterModelFromJson(jsonString);

import 'dart:convert';

List<SemesterModel> semesterModelFromJson(String str) =>
    List<SemesterModel>.from(
        json.decode(str).map((x) => SemesterModel.fromJson(x)));

String semesterModelToJson(List<SemesterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SemesterModel {
  SemesterModel({
    this.albumId = 0,
    this.id = 0,
    this.title = "",
    this.url = "",
    this.thumbnailUrl = "",
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
