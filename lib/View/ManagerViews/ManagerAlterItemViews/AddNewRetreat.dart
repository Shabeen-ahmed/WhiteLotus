
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/RetreatModel.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

class AddNewRetreat extends StatelessWidget {
  TextEditingController RetreatName = TextEditingController();
  TextEditingController Meal = TextEditingController();
  TextEditingController Activity = TextEditingController();
  TextEditingController WorkshopID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new retreat"),
      ),
      body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Retreat name"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: RetreatName,
                                  // validator:  (value) =>
                                  // value.isEmpty ? 'Password cannot be blank' : null,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Meal"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Meal,
                                  // validator:  (value) =>
                                  // value.isEmpty ? 'Password cannot be blank' : null,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Activity"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Activity,
                                  // validator:  (value) =>
                                  // value.isEmpty ? 'Password cannot be blank' : null,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("WorkshopID"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: WorkshopID,
                                  // validator:  (value) =>
                                  // value.isEmpty ? 'Password cannot be blank' : null,
                                ),
                              ],
                            ),
                          ),

                          ElevatedButton(
                              onPressed: () async {
                                RetreatModel retreatToAdd = RetreatModel(
                                  retreatName: RetreatName.text,
                                  meal: Meal.text,
                                  activity: Activity.text,
                                  workshopId: WorkshopID.text,
                                );

                                var response =
                                await ApiService().addNewRetreat(retreatToAdd);
                                if (response == Status.SUCCESS) {
                                  RetreatName.clear();
                                  Meal.clear();
                                  Activity.clear();
                                  WorkshopID.clear();
                                  Get.back();
                                  Get.back();
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Successfully Added Class",
                                    message: "Class was added successfully",
                                    duration: Duration(seconds: 5),
                                  ));
                                }
                              },
                              child: Text("ADD CLASS"))
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
