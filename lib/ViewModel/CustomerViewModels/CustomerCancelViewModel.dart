import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/repo/KConstants.dart';

import '../../repo/ApiServices.dart';

class CustomerCancelViewModel extends ChangeNotifier {

  submit_pressed(String bookingID)async {
    var response = await ApiService().cancel(bookingID);
    if(response!=Status.FAILURE){
      String name = response.toString();
      Get.defaultDialog(
          title: "Cancelled Successfully",
          content: Column(
            children: [
              Text(
                  "Successfully cancelled your booking for ${name}"),
            ],
          ));
      print('added');
    }
    else{
      Get.defaultDialog(title: "Booking ID not found.",
          content: Text("Booking ID entered is not found in our database. Please make sure you have entered correct ID.")
      );
    }

  }
}