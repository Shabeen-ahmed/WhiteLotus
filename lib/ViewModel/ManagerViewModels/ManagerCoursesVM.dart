import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/View/ManagerViews/ManagerWelcomeView.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../repo/KConstants.dart';



// control_came_from? _where;

class ManagerCoursesViewModel extends ChangeNotifier {
  List<CourseModel>? listOfCourses;
  int? _chosenStudioID;

// List<StudioClass>? get studioClass => _studioClasses;

  setChosenStudio(int ChosenStudio){
    _chosenStudioID=ChosenStudio;
  }

  fetchCoursesList(int StudioID) async {
    print("in fetch of vm NEWW");
    var responseBody = await ApiService().fetchCourses(StudioID);
    if(responseBody is List<CourseModel>)
    {
      listOfCourses = responseBody;
    }
    else{
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later.")
      );
    }
    notifyListeners();
  }


  void delete_pressed(int index) async {
    var response = await ApiService().deleteACourse(listOfCourses![index].courseId);
    if(response==Status.SUCCESS){
      if(_chosenStudioID!=null){
        fetchCoursesList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(title: "Class Deleted Successfully",
        content: Text("Successfully deleted Course ${listOfCourses![index].courseName}"));
      }

      print("chosen studio null");
    }
    else{
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later")
      );
    }

  }


  // printer() {
  //   print("PRINTINGGG");
  //   print(_where);
  // }
  //
  // void listTile_pressed(int i) {
  //   _chosenStudioID = studioClasses![i].studioId;
  //   switch (_where) {
  //     case control_came_from.GeneralManager:
  //     // do something
  //       print("GeneralManager in switch");
  //       break;
  //     case control_came_from.Managers:
  //       if(_chosenStudioID!=null){
  //         Get.to(()=>ManagerMainView(_chosenStudioID!));
  //         print("Manager in switch");
  //       }
  //       print("Manager in switch but null chosenId");
  //       break;
  //     case control_came_from.Customers:
  //       print("customer in switch");
  //       break;
  //     default:
  //       print("Its null bro");
  //       Get.back();
  //       Get.defaultDialog(title: "Something went wrong",
  //           content: const Text("Something went wrong. Please try again later."));
  //       break;
  //   }
  // }


}
