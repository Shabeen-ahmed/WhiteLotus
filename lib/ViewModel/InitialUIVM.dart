
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/CustomerViews/CustomerLogIn.dart';
import 'package:white_lotus/View/ListOfStudiosView.dart';
import 'package:white_lotus/repo/KConstants.dart';

class InitialUIViewModel extends ChangeNotifier {

  generalManagerButton_pressed(){
    Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.GeneralManager,));
  }
  managersButton_pressed(){
    Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.Managers,));
  }

  customerButton_pressed(){
    Get.defaultDialog(title: "Are you an existing user?",
    content: Column(
      children: [
        ElevatedButton(onPressed: (){
          Get.to(()=>CustomerLoginView());
        },
            child: const Text('Log In')),
        ElevatedButton(onPressed: (){
        },
            child: const Text('Register')),

      ],
    ));
    // Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.Customers,));
  }
  // int _selectedIndex = 0;
  // List<AttendanceModel> _attendanceModel = [];
  // List<AttendanceModel> _selectedattendance = [];
  // int _activeindex=0;
  // late String _selectedDate;
  // List<String> _dates =[];

  // List<AttendanceModel>? get attendanceModel => _attendanceModel;
  // List<AttendanceModel>? get selectedattendance => _selectedattendance;
  // int get activeindex => _activeindex;
  // List<String>? get dates => _dates;

  setactiveindex(int index){
    // _activeindex=index;
    // _selectedDate = dates![index];
    // setselectedattendance();
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
