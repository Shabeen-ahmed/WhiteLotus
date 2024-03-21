
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/CourseModel.dart';

class MemoryHandler{

  Future<String?> getSavedBooking(String key) async {

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', '${jsonResponse['token']}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString(key, '');
    String? retrievedValue = prefs.getString(key);
    return retrievedValue;
  }


  void saveClassBooking({required String key, required ClassModel classToSave})async {
    String? getString = await getSavedBooking(key);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if(getString!=null){
      List<ClassModel> bookedClass = classModelFromJson(getString);
      bookedClass.add(classToSave);
      await prefs.setString(key, jsonEncode(bookedClass));
        }
    else {
      await prefs.setString(key, classModelToJson([classToSave]));
      print("returned string null");
    }
  }

  void saveCourseBooking({required String key, required CourseModel courseToSave})async {
    String? getString = await getSavedBooking(key);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(getString!=null&&getString!=''){
      print('is error here?');
      print(getString);
      List<CourseModel> bookedCourse = courseModelFromJson(getString);
      bookedCourse.add(courseToSave);
      await prefs.setString(key, listOfCourseModelToJsonForSP(bookedCourse));
      print('is error here?');

    }
    else {
      await prefs.setString(key, '[${courseModelToJsonForSP(courseToSave)}]');
      print("returned string null");
    }
  }

}