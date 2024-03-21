import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/MemoryHandler.dart';
import '../../repo/KConstants.dart';



class CustomerClassViewModel extends ChangeNotifier {
  List<ClassModel>? listOfClasses;
  List<ClassModel> _bookedClasses =[];

  int? _chosenStudioID;
  String? _userID;

  List<ClassModel> get bookedClasses => _bookedClasses;
  

  setChosenStudioAndUserID(int ChosenStudio,String userID){
    _chosenStudioID=ChosenStudio;
    _userID=userID;
  }

  fetchClassesList(int StudioID) async {
    var responseBody = await ApiService().fetchAllClasses(StudioID);
    if(responseBody is List<ClassModel>)
    {
      listOfClasses = responseBody;
    }
    else{
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later.")
      );
    }

    await getSavedBooking();

    notifyListeners();
  }

  void booking_pressed(int index) async {           //TODO: fix book saving by implementing shared preferences later
    var response = await ApiService().bookASession(userID: _userID, bookingItemID: listOfClasses![index].courseId,BookingType: bookingType.Class);
    if(response==Status.FAILURE){
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later")
      );

      }
    else if(response==Availibility.Full){
      Get.defaultDialog(title: "Class is unavailable",
          content: Text("Class ${listOfClasses![index].className} appears to be booked out."));
    }
    else{
        if(response!=null) {
          try {
            double price = double.parse(response);
            await fetchClassesList(_chosenStudioID!);
            saveBooking(index);

            notifyListeners();

            Get.back();
            Get.defaultDialog(title: "Class Booked Successfully",
                content: Column(
                  children: [
                    Text("Successfully booked Class ${listOfClasses![index]
                        .className}"),
                    Text('Payment will be '
                        '$price Pounds', style: GoogleFonts.montserrat(fontSize: 18),)
                  ],
                ));
            print('boooked');
            print(_bookedClasses);
          }
          catch(e){
            print('error');
          }
        }
      else {
        print("chosen studio null");
      }

    }

  }

  void check_availibility(int index)    async
  {
  var response = await ApiService().checkAvailibilityClass(bookingItemID: listOfClasses![index].classId,BookingType: bookingType.Class);
  if(response==Status.FAILURE) {
    Get.back();
    Get.defaultDialog(
        title: "Something went wrong",
        content: Text("Something went wrong. Please try again later")
    );
  }
  // await fetchClassesList(_chosenStudioID!);
  // saveBooking(index);
    else if(response==Availibility.Free){

      Get.defaultDialog(title: "Class is Available",
          content: Text("Do you want to book ${listOfClasses![index].className}?"),
      actions: [

        ElevatedButton(onPressed: (){
          Get.back();
        }, child: Text("NO")),
        ElevatedButton(onPressed: (){
          booking_pressed(index);
        }, child: Text("Yes")),
      ]
      );

      print('boooked');
      print(_bookedClasses);
    }
    else if(response==Availibility.Full){
    Get.defaultDialog(title: "Sorry, Class is Full",
        content: Text("${listOfClasses![index].className} has booked out. Please try another class."),
    );

    print('boooked');
    print(_bookedClasses);
  }
  else{
    Get.back();
    Get.defaultDialog(
        title: "Something went wrong",
        content: Text("Something went wrong. Please try again later")
    );
  }

}


  getSavedBooking() async {
    _bookedClasses=[];
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('savedBookings', '');
    var response = await MemoryHandler().getSavedBooking('savedBookings');
    print("_bookedClasses");
    print(_bookedClasses);
    print(response);
    print(response.runtimeType);
    response!=null&&response!=''?_bookedClasses=classModelFromJson(response):null;
    notifyListeners();

  }

  void saveBooking(int index)async {
    MemoryHandler().saveClassBooking(key: 'savedBookings', classToSave: listOfClasses![index]);
    _bookedClasses.add(listOfClasses![index]);
  }


}
