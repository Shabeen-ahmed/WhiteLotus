import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/View/CustomerViews/CustomerWelcomeView.dart';
import 'package:white_lotus/View/ManagerViews/ManagerWelcomeView.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../repo/KConstants.dart';


// control_came_from? _where;

class ListOfStudiosViewModel extends ChangeNotifier {
control_came_from? _where;
List<StudioModel>? studioClasses;
int? _chosenStudioID;
String? _userID;

// List<StudioClass>? get studioClass => _studioClasses;

setControl(control_came_from where, String? userID){
  _where = where;
  userID!=null?_userID=userID:null;
}

fetchStudioList() async {
    print("in fetch of vm");
  var responseBody = await ApiService().fetchAllStudios();
  if(responseBody is List<StudioModel>)
    {
      studioClasses = responseBody;
    }
  else{
    Get.back();
    Get.defaultDialog(
      title: "Something went wrong",
      content: Text("Something went wrong. Please try again later.")
    );
  }
  print("STUDIOO");
  print(studioClasses);
  notifyListeners();
}

 printer() {
  print("PRINTINGGG");
  print(_where);
  }

  void listTile_pressed(int i) {
  _chosenStudioID = studioClasses![i].studioId;
    switch (_where) {
      case control_came_from.GeneralManager:
      // do something
      print("GeneralManager in switch");
        break;
      case control_came_from.Managers:
        if(_chosenStudioID!=null){
          Get.to(()=>ManagerMainView(_chosenStudioID!));
          print("Manager in switch");
        }
        else {
          print("Manager in switch but null chosenId");
        }
        break;
      case control_came_from.Customers:
        print("customer in switch");
        if(_chosenStudioID!=null&&_userID!=null){
          Get.to(()=>CustomerWelcomeView(_chosenStudioID!,_userID!));
        }
        else {
          print("customer in switch but null chosenId");
        }
        break;
      default:
        print("Its null");
        Get.back();
        Get.defaultDialog(title: "Something went wrong",
        content: const Text("Something went wrong. Please try again later."));
        break;
    }
  }


// Future<int> getData(int selectedMonth) async {
//   // var data = await ApiService().getAttendanceList(selectedMonth);
//   // if(data.toString()!="{dates: [], attendance: []}"){
//   //   List<String> dates = List<String>.from(data!['dates']);
//   //   String jsonattendance = jsonEncode(data['attendance']);
//   //   List<AttendanceModel> model = attendanceFromJson(jsonattendance);
//   //
//   //   _attendanceModel = model;
//   //   _dates = dates.toSet().toList();
//   //   _activeindex=0;
//   //   _selectedDate=_dates[_activeindex];
//   //   setselectedattendance();
//   //   notifyListeners();
//   //   return 1;
//   // }
//   // else {
//   //   // return 0;
//   // }
//
// }
}
