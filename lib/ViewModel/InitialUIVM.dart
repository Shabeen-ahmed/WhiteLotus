import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/CustomerViews/CustomerLogIn.dart';
import 'package:white_lotus/View/ListOfStudiosView.dart';
import 'package:white_lotus/repo/KConstants.dart';

class InitialUIViewModel extends ChangeNotifier {
  generalManagerButton_pressed() {
    Get.to(() => ListOfStudiosView(
          control_came_from_where: control_came_from.GeneralManager,
        ));
  }

  managersButton_pressed() {
    Get.to(() => ListOfStudiosView(
          control_came_from_where: control_came_from.Managers,
        ));
  }

  customerButton_pressed() {
    Get.defaultDialog(
        title: "Are you an existing user?",
        content: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => CustomerLoginView());
                },
                child: const Text('Log In')),
            ElevatedButton(onPressed: () {}, child: const Text('Register')),
          ],
        ));
  }
}
