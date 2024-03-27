import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

//manager view of adding new workshop. This view also handles tapping into
// ApiService class as implementing a view model for this will be counterproductive.
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
                              controller: WorkshopName,
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
                              controller: Theme,
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
                              controller: Durationn,
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
                              controller: Price,
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
                              controller: Schedule,
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
                              controller: Capacity,
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
                              controller: StudioID,
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
                              controller: TeacherID,
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

                            var response = await ApiService()
                                .addNewWorkshop(workshopToAdd);
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
