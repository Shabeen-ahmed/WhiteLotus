import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../repo/KConstants.dart';

//view model for handling courses data for manager
class ManagerCoursesViewModel extends ChangeNotifier {
  List<CourseModel>? listOfCourses;
  int? _chosenStudioID;

  setChosenStudio(int ChosenStudio) {
    _chosenStudioID = ChosenStudio;
  }

  fetchCoursesList(int StudioID) async {
    var responseBody = await ApiService().fetchCourses(StudioID);
    if (responseBody is List<CourseModel>) {
      listOfCourses = responseBody;
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later."));
    }
    notifyListeners();
  }

  void delete_pressed(int index) async {
    var response =
        await ApiService().deleteACourse(listOfCourses![index].courseId);
    if (response == Status.SUCCESS) {
      if (_chosenStudioID != null) {
        fetchCoursesList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(
            title: "Class Deleted Successfully",
            content: Text(
                "Successfully deleted Course ${listOfCourses![index].courseName}"));
      }

      print("chosen studio null");
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    }
  }
}
