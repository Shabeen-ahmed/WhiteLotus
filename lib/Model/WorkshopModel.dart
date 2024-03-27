// ignore_for_file: file_names

import 'dart:convert';

List<WorkshopModel> workshopModelFromJson(String str) =>
    List<WorkshopModel>.from(
        json.decode(str).map((x) => WorkshopModel.fromJson(x)));

String workshopModelToJson(List<WorkshopModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//workshop model
class WorkshopModel {
  String? workshopId;
  String workshopName;
  String theme;
  String duration;
  String schedule;
  String price;
  String capacity;
  String studioId;
  String teacherId;
  String? teacherName;

  WorkshopModel({
    this.workshopId,
    required this.workshopName,
    required this.theme,
    required this.duration,
    required this.schedule,
    required this.price,
    required this.capacity,
    required this.studioId,
    required this.teacherId,
    this.teacherName,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) => WorkshopModel(
        workshopId: json["WorkshopID"],
        workshopName: json["WorkshopName"],
        theme: json["Theme"],
        duration: json["Duration"],
        schedule: json["Schedule"],
        price: json["Price"],
        capacity: json["Capacity"],
        studioId: json["StudioID"],
        teacherId: json["TeacherID"],
        teacherName: json["TeacherName"],
      );

  Map<String, dynamic> toJson() => {
        "WorkshopID": workshopId,
        "WorkshopName": workshopName,
        "Theme": theme,
        "Duration": duration,
        "Schedule": schedule,
        "Price": price,
        "Capacity": capacity,
        "StudioID": studioId,
        "TeacherID": teacherId,
        "TeacherName": teacherName,
      };
}
