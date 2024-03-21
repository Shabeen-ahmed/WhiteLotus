
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

class AddNewWorkshop extends StatelessWidget {
  TextEditingController WorkshopName = TextEditingController();
  TextEditingController Theme = TextEditingController();
  TextEditingController Durationn = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Schedule = TextEditingController();
  TextEditingController Capacity = TextEditingController();
  TextEditingController StudioID = TextEditingController();
  TextEditingController TeacherID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new workshop"),
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
                                Text("Workshop name"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: WorkshopName,
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
                                Text("Theme"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Theme,
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
                                Text("Duration"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Durationn,
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
                                Text("Price"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Price,
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
                                Text("Schedule"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Schedule,
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
                                Text("Capacity"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: Capacity,
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
                                Text("StudioID"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: StudioID,
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
                                Text("TeacherID"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: TeacherID,
                                  // validator:  (value) =>
                                  // value.isEmpty ? 'Password cannot be blank' : null,
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                WorkshopModel workshopToAdd = WorkshopModel(
                                  workshopName: WorkshopName.text,
                                  theme: Theme.text,
                                  duration: Durationn.text,
                                  price: Price.text,
                                  schedule: Schedule.text,
                                  capacity: Capacity.text,
                                  studioId: StudioID.text,
                                  teacherId: TeacherID.text,
                                );

                                var response =
                                await ApiService().addNewWorkshop(workshopToAdd);
                                if (response == Status.SUCCESS) {
                                  WorkshopName.clear();
                                  Theme.clear();
                                  Durationn.clear();
                                  Price.clear();
                                  Schedule.clear();
                                  StudioID.clear();
                                  TeacherID.clear();
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
