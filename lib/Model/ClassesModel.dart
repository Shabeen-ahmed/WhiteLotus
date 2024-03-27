// ignore_for_file: file_names

import 'dart:convert';

List<ClassModel> classModelFromJson(String str) =>
    List<ClassModel>.from(json.decode(str).map((x) => ClassModel.fromJson(x)));

String classModelToJson(List<ClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//class model for classes
class ClassModel {
  String? classId;
  String className;
  String type;
  String level;
  String capacity;
  String price;
  String duration;
  String schedule;
  String courseId;
  String teacherId;
  String? teacherName;
  String? courseName;

  ClassModel({
    this.classId,
    required this.className,
    required this.type,
    required this.level,
    required this.capacity,
    required this.price,
    required this.duration,
    required this.schedule,
    required this.courseId,
    required this.teacherId,
    this.teacherName,
    this.courseName,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        classId: json["ClassID"],
        className: json["ClassName"],
        type: json["Type"],
        level: json["Level"],
        capacity: json["Capacity"],
        price: json["Price"],
        duration: json["Duration"],
        schedule: json["Schedule"],
        courseId: json["CourseID"],
        teacherId: json["TeacherID"],
        teacherName: json["TeacherName"],
        courseName: json["CourseName"],
      );

  Map<String, dynamic> toJson() => {
        "ClassID": classId,
        "ClassName": className,
        "Type": type,
        "Level": level,
        "Capacity": capacity,
        "Price": price,
        "Duration": duration,
        "Schedule": schedule,
        "CourseID": courseId,
        "TeacherID": teacherId,
        "TeacherName": teacherName,
        "CourseName": courseName,
      };
}
