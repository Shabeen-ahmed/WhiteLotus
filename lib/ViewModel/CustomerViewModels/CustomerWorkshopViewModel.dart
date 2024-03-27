import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/MemoryHandler.dart';
import '../../repo/KConstants.dart';

class CustomerWorkshopViewModel extends ChangeNotifier {
  List<WorkshopModel>? listOfWorkshops;
  List<WorkshopModel> _bookedWorkshops = [];

  int? _chosenStudioID;
  String? _userID;

  List<WorkshopModel> get bookedWorkshops => _bookedWorkshops;

  setChosenStudioAndUserID(int ChosenStudio, String userID) {
    _chosenStudioID = ChosenStudio;
    _userID = userID;
  }

  fetchWorkshopsList(int StudioID) async {
    var responseBody = await ApiService().fetchWorkshops(StudioID);
    if (responseBody is List<WorkshopModel>) {
      listOfWorkshops = responseBody;
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: const Text("Something went wrong. Please try again later."));
    }

    await getSavedBooking();

    notifyListeners();
  }

  void booking_pressed(int index) async {
    var response = await ApiService().bookASession(
        userID: _userID,
        bookingItemID: listOfWorkshops![index].workshopId,
        BookingType: bookingType.Workshop);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else if (response == Availibility.Full) {
      Get.defaultDialog(
          title: "Workshop is unavailable",
          content: Text(
              "Workshop ${listOfWorkshops![index].workshopName} appears to be booked out."));
    } else {
      if (response != null && response is double) {
        try {
          double price = response;

          await fetchWorkshopsList(_chosenStudioID!);

          saveBooking(index);

          notifyListeners();

          Get.back();
          Get.defaultDialog(
              title: "Workshop Booked Successfully",
              content: Column(
                children: [
                  Text(
                      "Successfully booked Workshop ${listOfWorkshops![index].workshopName}"),
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

  void waiting_pressed(int index) async {
    //TODO: fix book saving by implementing shared preferences later
    var response = await ApiService().waitingList(
        userID: _userID,
        waitingItemID: listOfWorkshops![index].workshopId,
        waitingType: bookingType.Workshop);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else {
      if (response != null && response is double) {
        try {
          double price = response;
          await fetchWorkshopsList(_chosenStudioID!);
          saveBooking(index);

          notifyListeners();

          Get.back();
          Get.defaultDialog(
              title: "Added To Waiting List Successfully",
              content: Column(
                children: [
                  Text(
                      "Successfully added to waiting list for Workshop ${listOfWorkshops![index].workshopName}"),
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

  void check_availibility(int index) async {
    var response = await ApiService().checkAvailibilityWorkshop(
        bookingItemID: listOfWorkshops![index].workshopId,
        BookingType: bookingType.Workshop);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    }
    // await fetchClassesList(_chosenStudioID!);
    // saveBooking(index);
    else if (response == Availibility.Free) {
      Get.defaultDialog(
          title: "Workshop is Available",
          content: Text(
              "Do you want to book ${listOfWorkshops![index].workshopName}?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("NO")),
            ElevatedButton(
                onPressed: () {
                  booking_pressed(index);
                },
                child: Text("Yes")),
          ]);
    } else if (response == Availibility.Full) {
      Get.defaultDialog(
          title: "Sorry, Workshop is Full",
          content: Text(
              "${listOfWorkshops![index].workshopName} has booked out. Please try another Workshop."),
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
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    }
  }

  getSavedBooking() async {
    _bookedWorkshops = [];
    var response = await MemoryHandler().getSavedBooking('savedWaitingList');
    response != null && response != ''
        ? _bookedWorkshops = workshopModelFromJson(response)
        : null;
    notifyListeners();
  }

  void saveBooking(int index) async {
    MemoryHandler().saveWorkshopBooking(
        key: 'savedWaitingList', workshopToSave: listOfWorkshops![index]);
    _bookedWorkshops.add(listOfWorkshops![index]);
  }
}
