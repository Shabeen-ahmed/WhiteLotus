import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  AddNewClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new class"),
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
                            const Text("Class name"),
                            TextField(
                              controller: ClassName,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Type"),
                            TextField(
                              controller: Type,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Level"),
                            TextField(
                              controller: Level,
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
                            const Text("Capacity"),
                            TextField(
                              controller: Capacity,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Duration"),
                            TextField(
                              controller: Durationn,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Schedule"),
                            TextField(
                              controller: Schedule,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("CourseID"),
                            TextField(
                              controller: CourseID,
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
                          child: const Text("ADD CLASS"))
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
