import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import '../../View/ManagerViews/ManagerAlterItemViews/AddNewWorkshop.dart';
import '../../repo/KConstants.dart';



// control_came_from? _where;

class ManagerWorkshopViewModel extends ChangeNotifier {
  bool _isloading = true;
  List<WorkshopModel>? listOfWorkshops;
  int? _chosenStudioID;

  bool get isloading => _isloading;

// List<StudioClass>? get studioClass => _studioClasses;

  clearMemory() {
    listOfWorkshops = null;
  }

  fetchAllWorkshopList(int StudioID) async {
    clearMemory();
    _chosenStudioID = StudioID;
    var responseBody = await ApiService().fetchWorkshops(_chosenStudioID!);
    if (responseBody is List<WorkshopModel>) {
      listOfWorkshops = responseBody;
      _isloading = false;
      notifyListeners();
    }
    else {
      // Get.to(()=>ManagerDetailedClassView(isEmptyPassed: true,));

      Get.defaultDialog(
          title: "Oops",
          content: const Text(
              "It looks like there are no workshops available. Please add a workshop first")
      );
      _isloading = false;
    }
    notifyListeners();
  }

  void item_pressed(int index) {
    print('item pressed');
    // Get.to(()=>ManagerDetailedClassView(listOfClasses![index]));
  }

  void addNewClassButtonPressed() {
    Get.to(() => AddNewWorkshop());
  }

  void delete_pressed(int index) async {
    var response = await ApiService().deleteAWorkshop(
        listOfWorkshops![index].workshopId);
    if (response == Status.SUCCESS) {
      if (_chosenStudioID != null) {
        fetchAllWorkshopList(_chosenStudioID!);
        notifyListeners();
        Get.defaultDialog(title: "Class Workshop Successfully");
      }

      print("chosen studio null");
    }
    else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later")
      );
    }
  }
}

// }