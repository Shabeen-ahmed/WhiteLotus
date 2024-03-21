
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/ListOfStudiosView.dart';
import 'package:white_lotus/repo/KConstants.dart';

class CustomerLoginRegisterViewModel extends ChangeNotifier {

  login_pressed(String userID){
    Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.Customers,userID: userID,));
  }
}
