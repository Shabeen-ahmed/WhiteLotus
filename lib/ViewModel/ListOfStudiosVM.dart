import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/View/CustomerViews/CustomerWelcomeView.dart';
import 'package:white_lotus/View/ManagerViews/ManagerWelcomeView.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../repo/KConstants.dart';
//Viewmodel for list of studios views
class ListOfStudiosViewModel extends ChangeNotifier {
  control_came_from? _where;
  List<StudioModel>? studioClasses;
  int? _chosenStudioID;
  String? _userID;

  setControl(control_came_from where, String? userID) {
    _where = where;
    userID != null ? _userID = userID : null;
    fetchStudioList();
  }

  fetchStudioList() async {
    var responseBody = await ApiService().fetchAllStudios();
    if (responseBody is List<StudioModel>) {
      studioClasses = responseBody;
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later."));
    }
    notifyListeners();
  }

  void listTile_pressed(int i) {
    _chosenStudioID = studioClasses![i].studioId;
    switch (_where) {
      case control_came_from.GeneralManager:
        break;
      case control_came_from.Managers:
        if (_chosenStudioID != null) {
          Get.to(() => ManagerMainView(_chosenStudioID!));
        } else {}
        break;
      case control_came_from.Customers:
        if (_chosenStudioID != null && _userID != null) {
          Get.to(() => CustomerWelcomeView(_chosenStudioID!, _userID!));
        } else {}
        break;
      default:
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content:
                const Text("Something went wrong. Please try again later."));
        break;
    }
  }
}
