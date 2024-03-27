import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/CustomerViews/CustomerLogIn.dart';
import 'package:white_lotus/View/ListOfStudiosView.dart';
import 'package:white_lotus/repo/KConstants.dart';

//viewmodel for the initial ui view
class InitialUIViewModel extends ChangeNotifier {
  //methods which pushes the ui to the next page
  //control_came_from_where is a self defined enum containing the three possibilities from where the view is coming from.
  //The same ListOfStudiosView is re-used for all of the categories of the screens(general manager, manager and customer).
  //However, because it should go to different screens after picking a studio from the list in the next screen,
  // control_came_from_where will contain the information of where to go next.
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
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () {}, child: const Text('Register')),
          ],
        ));
  }
}
