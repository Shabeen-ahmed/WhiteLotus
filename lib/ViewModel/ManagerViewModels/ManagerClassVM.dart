import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/View/ManagerViews/BRICKEDManagerDetailedItemView.dart';
import 'package:white_lotus/View/ManagerViews/ManagerWelcomeView.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../View/ManagerViews/ManagerAlterItemViews/AddNewClass.dart';
import '../../repo/KConstants.dart';



// control_came_from? _where;

class ManagerClassesViewModel extends ChangeNotifier {
  bool _isloading=true;
  List<ClassModel>? listOfClasses;
  int? _chosenStudioID;

  bool get isloading  => _isloading;
// List<StudioClass>? get studioClass => _studioClasses;

  clearMemory(){
    listOfClasses=null;
  }

  fetchAllClassesList(int StudioID) async {
    clearMemory();
    _chosenStudioID=StudioID;
    print("in fetch of vm NEWW");
    var responseBody = await ApiService().fetchAllClasses(_chosenStudioID!);
    if(responseBody is List<ClassModel>)
    {
      listOfClasses= responseBody;
      _isloading=false;
      notifyListeners();
    }
    else{

      // Get.to(()=>ManagerDetailedClassView(isEmptyPassed: true,));

      Get.defaultDialog(
          title: "Oops",
          content: const Text("It looks like there are no classes for this course. Please add a class first")
      );
      _isloading=false;
    }
    notifyListeners();
  }

  void item_pressed(int index) {
    print('item pressed');
    // Get.to(()=>ManagerDetailedClassView(listOfClasses![index]));
  }

  void addNewClassButtonPressed() {
    Get.to(()=>AddNewClass());

  }

  void delete_pressed(int index) async {
    var response = await ApiService().deleteAClass(listOfClasses![index].classId);
    if(response==Status.SUCCESS){
      if(_chosenStudioID!=null){
        fetchAllClassesList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(title: "Class Deleted Successfully");
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


}
