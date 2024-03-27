// ignore_for_file: file_names

import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(
    json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());
String courseModelToJsonForSP(CourseModel data) =>
    json.encode(data.toJsonForSP());
String listOfCourseModelToJsonForSP(List<CourseModel> data) => json.encode(
    List<dynamic>.from(data.map((x) => x.toJsonForSP()))); //shared preference

class CourseModel {
  String? courseId;
  String courseName;
  DateTime startDate;
  DateTime endDate;
  String price;
  String discount;
  String studioId;
  String teacherId;
  String? teacherName;

  CourseModel({
    this.courseId,
    required this.courseName,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.discount,
    required this.studioId,
    required this.teacherId,
    this.teacherName,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseId: json["CourseID"],
        courseName: json["CourseName"],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        price: json["Price"],
        discount: json["Discount"],
        studioId: json["StudioID"],
        teacherId: json["TeacherID"],
        teacherName: json["TeacherName"],
      );

  Map<String, dynamic> toJson() => {
        "CourseName": courseName,
        "StartDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "EndDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "Price": price,
        "Discount": discount,
        "StudioID": studioId,
        "TeacherID": teacherId,
      };

  Map<String, dynamic> toJsonForSP() => {
        "CourseID": courseId,
        "CourseName": courseName,
        "StartDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "EndDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "Price": price,
        "Discount": discount,
        "StudioID": studioId,
        "TeacherID": teacherId,
        "TeacherName": teacherName
      };
}
