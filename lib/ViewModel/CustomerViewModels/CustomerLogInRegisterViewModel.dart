
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/ListOfStudiosView.dart';
import 'package:white_lotus/repo/KConstants.dart';

import '../../repo/ApiServices.dart';

class CustomerLoginRegisterViewModel extends ChangeNotifier {

  login_pressed(String emailID)async {
    var response = await ApiService().login(emailID);
    if(response!=Status.FAILURE){
      String userID=response.toString();
      Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.Customers,userID: userID,));
    }
    else{
      Get.defaultDialog(title: "Email ID not found.",
          content: Text("Email entered is not found in our database. Please make sure you have registered first.")
      );
    }

  }
}
