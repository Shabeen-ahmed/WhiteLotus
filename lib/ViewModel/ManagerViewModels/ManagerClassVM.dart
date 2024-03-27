import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../View/ManagerViews/ManagerAlterItemViews/AddNewClass.dart';
import '../../repo/KConstants.dart';

//view model for handling classes data for manager
class ManagerClassesViewModel extends ChangeNotifier {
  bool _isloading = true;
  List<ClassModel>? listOfClasses;
  int? _chosenStudioID;

  bool get isloading => _isloading;

  clearMemory() {
    listOfClasses = null;
  }

  fetchAllClassesList(int StudioID) async {
    clearMemory();
    _chosenStudioID = StudioID;
    var responseBody = await ApiService().fetchAllClasses(_chosenStudioID!);
    if (responseBody is List<ClassModel>) {
      listOfClasses = responseBody;
      _isloading = false;
      notifyListeners();
    } else {
      Get.defaultDialog(
          title: "Oops",
          content: const Text(
              "It looks like there are no classes for this course. Please add a class first"));
      _isloading = false;
    }
    notifyListeners();
  }

  void addNewClassButtonPressed() {
    Get.to(() => AddNewClass());
  }

  void delete_pressed(int index) async {
    var response =
        await ApiService().deleteAClass(listOfClasses![index].classId);
    if (response == Status.SUCCESS) {
      if (_chosenStudioID != null) {
        fetchAllClassesList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(title: "Class Deleted Successfully");
      }
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    }
  }
}
