import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/RetreatModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import '../../View/ManagerViews/ManagerAlterItemViews/AddNewWorkshop.dart';
import '../../repo/KConstants.dart';

class ManagerRetreatViewModel extends ChangeNotifier {
  bool _isloading = true;
  List<RetreatModel>? listOfRetreats;
  int? _chosenStudioID;

  bool get isloading => _isloading;

  clearMemory() {
    listOfRetreats = null;
  }

  fetchRetreatList(int StudioID) async {
    clearMemory();
    _chosenStudioID = StudioID;
    var responseBody = await ApiService().fetchRetreats(_chosenStudioID!);
    if (responseBody is List<RetreatModel>) {
      listOfRetreats = responseBody;
      _isloading = false;
      notifyListeners();
    } else {
      Get.defaultDialog(
          title: "Oops",
          content: const Text(
              "It looks like there are no workshops available. Please add a workshop first"));
      _isloading = false;
    }
    notifyListeners();
  }

  void addNewClassButtonPressed() {
    Get.to(() => AddNewWorkshop());
  }

  void delete_pressed(int index) async {
    var response =
        await ApiService().deleteARetreat(listOfRetreats![index].retreatId);
    if (response == Status.SUCCESS) {
      if (_chosenStudioID != null) {
        fetchRetreatList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(
            title: "Deleted Retreat Successfully",
            content: Text("Retreat was deleted successfully"));
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
