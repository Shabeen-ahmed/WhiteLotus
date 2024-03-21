// we generated thiswith the help of quicktype.
//
// To parse this JSON data, do
//
//     final studioClass = studioClassFromJson(jsonString);

import 'dart:convert';

List<StudioModel> studioClassFromJson(String str) => List<StudioModel>.from(json.decode(str).map((x) => StudioModel.fromJson(x)));

String studioClassToJson(List<StudioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudioModel {
  int studioId;
  String studioName;
  String location;
  String contactNumber;
  String email;

  StudioModel({
    required this.studioId,
    required this.studioName,
    required this.location,
    required this.contactNumber,
    required this.email,
  });

  factory StudioModel.fromJson(Map<String, dynamic> json) => StudioModel(
    studioId: json["StudioID"],
    studioName: json["StudioName"],
    location: json["Location"],
    contactNumber: json["ContactNumber"],
    email: json["Email"],
  );

  Map<String, dynamic> toJson() => {
    "StudioID": studioId,
    "StudioName": studioName,
    "Location": location,
    "ContactNumber": contactNumber,
    "Email": email,
  };
}
