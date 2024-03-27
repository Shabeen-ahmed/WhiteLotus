// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

class AddNewCourse extends StatelessWidget {
  TextEditingController CourseName = TextEditingController();
  TextEditingController StartDate = TextEditingController();
  TextEditingController EndDate = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Discount = TextEditingController();
  TextEditingController StudioID = TextEditingController();
  TextEditingController TeacherID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new course"),
      ),
      body: SingleChildScrollView(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Course name"),
                            TextField(
                              controller: CourseName,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("StartDate"),
                            TextField(
                              controller: StartDate,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("EndDate"),
                            TextField(
                              controller: EndDate,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Price"),
                            TextField(
                              controller: Price,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Discount"),
                            TextField(
                              controller: Discount,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("TeacherID"),
                            TextField(
                              controller: TeacherID,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("StudioID"),
                            TextField(
                              controller: StudioID,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            DateTime? startdate;
                            DateTime? enddate;
                            try {
                              startdate = DateTime.tryParse(StartDate.text);
                              enddate = DateTime.tryParse(EndDate.text);

                              if (startdate != null && enddate != null) {
                                CourseModel courseToAdd = CourseModel(
                                  courseName: CourseName.text,
                                  startDate: startdate,
                                  endDate: enddate,
                                  price: Price.text,
                                  discount: Discount.text,
                                  studioId: StudioID.text,
                                  teacherId: TeacherID.text,
                                );

                                var response = await ApiService()
                                    .addNewCourse(courseToAdd);
                                if (response == Status.SUCCESS) {
                                  CourseName.clear();
                                  StartDate.clear();
                                  EndDate.clear();
                                  Price.clear();
                                  Discount.clear();
                                  StudioID.clear();
                                  TeacherID.clear();
                                  Get.back();
                                  Get.back();
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Successfully Added Course",
                                    message: "Class was added successfully",
                                    duration: Duration(seconds: 5),
                                  ));
                                }
                              } else {
                                Get.defaultDialog(
                                    title:
                                        "The Start Date or End Date is in incorrect format.",
                                    content: const Text(
                                        "Please enter again the date in correct format."));
                              }
                            } catch (e) {
                              Get.defaultDialog(
                                  title:
                                      "The Start Date or End Date is in incorrect format.");
                            }
                          },
                          child: const Text("ADD COURSE"))
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
