// ignore_for_file: file_names

import 'dart:convert';

List<DetailedCourseModel> detailedCourseModelFromJson(String str) =>
    List<DetailedCourseModel>.from(
        json.decode(str).map((x) => DetailedCourseModel.fromJson(x)));

String detailedCourseModelToJson(List<DetailedCourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//detailed course model for handling number of classes inside a course
class DetailedCourseModel {
  String courseId;
  String courseName;
  DateTime startDate;
  DateTime endDate;
  String price;
  String discount;
  String studioId;
  String teacherId;
  String classId;
  String className;
  String type;
  String level;
  String capacity;
  String duration;
  String schedule;

  DetailedCourseModel({
    required this.courseId,
    required this.courseName,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.discount,
    required this.studioId,
    required this.teacherId,
    required this.classId,
    required this.className,
    required this.type,
    required this.level,
    required this.capacity,
    required this.duration,
    required this.schedule,
  });

  factory DetailedCourseModel.fromJson(Map<String, dynamic> json) =>
      DetailedCourseModel(
        courseId: json["CourseID"],
        courseName: json["CourseName"],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        price: json["Price"],
        discount: json["Discount"],
        studioId: json["StudioID"],
        teacherId: json["TeacherID"],
        classId: json["ClassID"],
        className: json["ClassName"],
        type: json["Type"],
        level: json["Level"],
        capacity: json["Capacity"],
        duration: json["Duration"],
        schedule: json["Schedule"],
      );

  Map<String, dynamic> toJson() => {
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
        "ClassID": classId,
        "ClassName": className,
        "Type": type,
        "Level": level,
        "Capacity": capacity,
        "Duration": duration,
        "Schedule": schedule,
      };
}
