import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/Model/DetailedCourseModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import '../../View/CustomerViews/CustomerCoursesDetailedView.dart';
import '../../repo/KConstants.dart';
import '../../repo/MemoryHandler.dart';
//view model for handling courses data for customer
class CustomerCoursesViewModel extends ChangeNotifier {
  List<CourseModel>? listOfCourses;
  List<CourseModel> bookedCourses = [];

  List<DetailedCourseModel>? _courseDetails;

  int? _chosenStudioID;
  String? _userID;

  List<DetailedCourseModel>? get courseDetails => _courseDetails;

  initializeViewModel(int ChosenStudio, String userID) {
    setChosenStudioAndUserID(ChosenStudio, userID);
    fetchCoursesList(ChosenStudio);
  }

  setChosenStudioAndUserID(int ChosenStudio, String userID) {
    _chosenStudioID = ChosenStudio;
    _userID = userID;
  }

  fetchCoursesList(int StudioID) async {
    var responseBody = await ApiService().fetchCourses(StudioID);
    if (responseBody is List<CourseModel>) {
      listOfCourses = responseBody;
      getSavedBooking();
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later."));
    }
    notifyListeners();
  }

  void booking_pressed(int index) async {
    var response = await ApiService().bookACourse(
      userID: _userID,
      CourseID: listOfCourses![index].courseId,
    );
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else if (response == Availibility.Full) {
      Get.defaultDialog(
          title: "Sorry, chosen Course is out of capacity",
          content: Text(
              "${listOfCourses![index].courseName} has no available spaces as the classes ran out of capacity. Do you want to be added to waiting list?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("NO")),
            ElevatedButton(
                onPressed: () {
                  waiting_pressed(index);
                },
                child: Text("Yes")),
          ]);
    } else {
      if (response != null && response is double) {
        double totalPrice = response;
        saveBooking(index);
        Get.defaultDialog(
            title: "Course Booked Successfully",
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Successfully booked Course ${listOfCourses![index].courseName}"),
                Text(
                    'Since you have booked as a course, you will get a 10% discount'),
                Text("10% reduction from the total cost of $totalPrice"),
                Text(
                  'Total Price for you is ${totalPrice * 0.9}',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              ],
            ));
      }
    }
  }

  void waiting_pressed(int index) async {
    var response = await ApiService().waitingList(
        userID: _userID,
        waitingItemID: listOfCourses![index].courseId,
        waitingType: bookingType.Course);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else {
      if (response != null && response is double) {
        try {
          double price = response;
          await fetchCoursesList(_chosenStudioID!);
          saveBooking(index);

          notifyListeners();

          Get.back();
          Get.defaultDialog(
              title: "Added To Waiting List Successfully",
              content: Column(
                children: [
                  Text(
                      "Successfully added to waiting list for Course ${listOfCourses![index].courseName}"),
                  Text(
                    'Payment will be '
                    '$price Pounds',
                    style: GoogleFonts.montserrat(fontSize: 18),
                  )
                ],
              ));
        } catch (e) {
          print('error');
        }
      } else {
        print("chosen studio null");
      }
    }
  }

  void tileTapped(int index) {
    Get.to(() => CustomerCoursesDetailedView(
          index: index,
        ));
  }

  void fetchCourseDetailed(index) async {
    var response = await ApiService()
        .fetchCourseDetailed(courseID: listOfCourses![index].courseId);
    if (response is List<DetailedCourseModel>) {
      _courseDetails = response;
      notifyListeners();
    } else if (response == false) {
      Get.back();
      Get.defaultDialog(
          title: "The chosen course does not have any classes",
          content: Text(
              "${listOfCourses![index].courseName} does not have any classes."));
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later"));
    }
  }

  void saveBooking(int index) async {
    MemoryHandler().saveCourseBooking(
        key: 'savedCourseBookings', courseToSave: listOfCourses![index]);
    bookedCourses.add(listOfCourses![index]);
    notifyListeners();
  }

  getSavedBooking() async {
    bookedCourses = [];
    var response = await MemoryHandler().getSavedBooking('savedCourseBookings');

    response != null && response != ''
        ? bookedCourses = courseModelFromJson(response)
        : null;
    notifyListeners();
  }
}
