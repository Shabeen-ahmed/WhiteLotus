
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

class AddNewClass extends StatelessWidget {
  TextEditingController ClassName = TextEditingController();
  TextEditingController Type = TextEditingController();
  TextEditingController Level = TextEditingController();
  TextEditingController Capacity = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Durationn = TextEditingController();
  TextEditingController Schedule = TextEditingController();
  TextEditingController CourseID = TextEditingController();
  TextEditingController TeacherID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new class"),
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
                            Text("Class name"),
                            TextField(
                              // label: 'Enter current password',
                              controller: ClassName,
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
                            Text("Type"),
                            TextField(
                              // label: 'Enter current password',
                              controller: Type,
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
                            Text("Level"),
                            TextField(
                              // label: 'Enter current password',
                              controller: Level,
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
                            Text("CourseID"),
                            TextField(
                              // label: 'Enter current password',
                              controller: CourseID,
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
                            ClassModel classToAdd = ClassModel(
                              className: ClassName.text,
                              type: Type.text,
                              level: Level.text,
                              capacity: Capacity.text,
                              price: Price.text,
                              duration: Durationn.text,
                              schedule: Schedule.text,
                              courseId: CourseID.text,
                              teacherId: TeacherID.text,
                            );

                            var response =
                                await ApiService().addNewClass(classToAdd);
                            if (response == Status.SUCCESS) {
                              ClassName.clear();
                              Type.clear();
                              Level.clear();
                              Capacity.clear();
                              Price.clear();
                              Durationn.clear();
                              Schedule.clear();
                              CourseID.clear();
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
