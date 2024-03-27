import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/RetreatModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/MemoryHandler.dart';
import '../../repo/KConstants.dart';

class CustomerRetreatViewModel extends ChangeNotifier {
  List<RetreatModel>? listOfRetreats;
  List<RetreatModel> _bookedRetreats = [];

  int? _chosenStudioID;
  String? _userID;

  List<RetreatModel> get bookedRetreats => _bookedRetreats;

  setChosenStudioAndUserID(int ChosenStudio, String userID) {
    _chosenStudioID = ChosenStudio;
    _userID = userID;
  }

  fetchRetreatsList(int StudioID) async {
    var responseBody = await ApiService().fetchRetreats(StudioID);
    if (responseBody is List<RetreatModel>) {
      listOfRetreats = responseBody;
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
        bookingItemID: listOfRetreats![index].retreatId,
        BookingType: bookingType.Retreat);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else if (response == Availibility.Full) {
      Get.defaultDialog(
          title: "Retreat is unavailable",
          content: Text(
              "Retreat ${listOfRetreats![index].retreatName} appears to be booked out."));
    } else {
      if (response != null && response is double) {
        try {
          double price = response;
          await fetchRetreatsList(_chosenStudioID!);
          saveBooking(index);

          notifyListeners();

          Get.back();
          Get.defaultDialog(
              title: "Retreat Booked Successfully",
              content: Column(
                children: [
                  Text(
                      "Successfully booked Retreat ${listOfRetreats![index].retreatName}"),
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
    var response = await ApiService().waitingList(
        userID: _userID,
        waitingItemID: listOfRetreats![index].retreatId,
        waitingType: bookingType.Retreat);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else {
      if (response != null && response is double) {
        try {
          double price = response;
          await fetchRetreatsList(_chosenStudioID!);
          saveBooking(index);

          notifyListeners();

          Get.back();
          Get.defaultDialog(
              title: "Added To Waiting List Successfully",
              content: Column(
                children: [
                  Text(
                      "Successfully added to waiting list for Retreat ${listOfRetreats![index].retreatName}"),
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
        bookingItemID: listOfRetreats![index].workshopId,
        BookingType: bookingType.Workshop);
    if (response == Status.FAILURE) {
      Get.back();
      Get.defaultDialog(
          title: "Something went wrong",
          content: Text("Something went wrong. Please try again later"));
    } else if (response == Availibility.Free) {
      Get.defaultDialog(
          title: "Retreat is Available",
          content: Text(
              "Do you want to book ${listOfRetreats![index].retreatName}?"),
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
          title: "Sorry, Retreat is Full",
          content: Text(
              "${listOfRetreats![index].retreatName} has booked out. Please try another Retreat."),
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
    _bookedRetreats = [];
    var response = await MemoryHandler().getSavedBooking('savedBookings');
    response != null && response != ''
        ? _bookedRetreats = retreatModelFromJson(response)
        : null;
    notifyListeners();
  }

  void saveBooking(int index) async {
    MemoryHandler().saveRetreatBooking(
        key: 'savedBookings', retreatToSave: listOfRetreats![index]);
    _bookedRetreats.add(listOfRetreats![index]);
  }
}
