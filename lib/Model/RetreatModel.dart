// To parse this JSON data, do
//
//     final retreatModel = retreatModelFromJson(jsonString);

import 'dart:convert';

List<RetreatModel> retreatModelFromJson(String str) => List<RetreatModel>.from(json.decode(str).map((x) => RetreatModel.fromJson(x)));

String retreatModelToJson(List<RetreatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RetreatModel {
  String? retreatId;
  String retreatName;
  String meal;
  String activity;
  String price;
  String workshopId;
  String? teacherId;
  String? studioId;
  String? workshopName;
  String? teacherName;

  RetreatModel({
    this.retreatId,
    required this.retreatName,
    required this.meal,
    required this.activity,
    required this.price,
    required this.workshopId,
    this.teacherId,
    this.studioId,
    this.workshopName,
    this.teacherName,
  });

  factory RetreatModel.fromJson(Map<String, dynamic> json) => RetreatModel(
    retreatId: json["RetreatID"],
    retreatName: json["RetreatName"],
    meal: json["Meal"],
    activity: json["Activity"],
    price: json["Price"],
    workshopId: json["WorkshopID"],
    teacherId: json["TeacherID"],
    studioId: json["StudioID"],
    workshopName: json["WorkshopName"],
    teacherName: json["TeacherName"],
  );

  Map<String, dynamic> toJson() => {
    "RetreatID": retreatId,
    "RetreatName": retreatName,
    "Meal": meal,
    "Activity": activity,
    "Price": price,
    "WorkshopID": workshopId,
    "TeacherID": teacherId,
    "StudioID": studioId,
    "WorkshopName": workshopName,
    "TeacherName": teacherName,
  };
}
