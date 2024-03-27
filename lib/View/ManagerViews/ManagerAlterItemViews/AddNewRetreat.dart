import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/Model/RetreatModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

//manager view of adding new retreat. This view also handles tapping into
// ApiService class as implementing a view model for this will be counterproductive.
class AddNewRetreat extends StatelessWidget {
  TextEditingController RetreatName = TextEditingController();
  TextEditingController Meal = TextEditingController();
  TextEditingController Activity = TextEditingController();
  TextEditingController Price = TextEditingController();
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
                              controller: RetreatName,
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
                              controller: Meal,
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
                              controller: Activity,
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
                            Text("WorkshopID"),
                            TextField(
                              controller: WorkshopID,
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
                              price: Price.text,
                              workshopId: WorkshopID.text,
                            );

                            var response =
                                await ApiService().addNewRetreat(retreatToAdd);
                            if (response == Status.SUCCESS) {
                              RetreatName.clear();
                              Meal.clear();
                              Activity.clear();
                              Price.clear();
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
