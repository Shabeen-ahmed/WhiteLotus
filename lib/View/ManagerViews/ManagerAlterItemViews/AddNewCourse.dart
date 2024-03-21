
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/Model/ClassesModel.dart';
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
        title: Text("Add new course"),
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
                                Text("Course name"),
                                TextField(
                                  // label: 'Enter current password',
                                  controller: CourseName,
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
                                Text("StartDate"),
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
                                Text("EndDate"),
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
                                Text("Discount"),
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
                                Text("TeacherID"),
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
                                Text("StudioID"),
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
                                try{
                                  startdate=DateTime.tryParse(StartDate.text);
                                  enddate=DateTime.tryParse(EndDate.text);

                                  if(startdate!=null&&enddate!=null)
                                    {

                                      CourseModel courseToAdd = CourseModel(
                                        courseName: CourseName.text,
                                        startDate: startdate,
                                        endDate: enddate,
                                        price: Price.text,
                                        discount: Discount.text,
                                        studioId: StudioID.text,
                                        teacherId: TeacherID.text,
                                      );

                                      print(courseToAdd.courseName);
                                      print(courseToAdd.startDate);
                                      print(courseToAdd.endDate);
                                      print(courseToAdd.price);
                                      print(courseToAdd.discount);
                                      print(courseToAdd.studioId);
                                      print(courseToAdd.teacherId);


                                      var response =
                                      await ApiService().addNewCourse(courseToAdd);
                                      if (response == Status.SUCCESS) {
                                        print("got success in view");
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
                                    }
                                  else
                                    {
                                      print("got failure in view");

                                      Get.defaultDialog(
                                          title: "The Start Date or End Date is in incorrect format.",
                                        content: Text("Please enter again the date in correct format.")
                                      );
                                    }


                                }
                                catch(e){
                                  Get.defaultDialog(
                                      title: "The Start Date or End Date is in incorrect format."
                                  );
                                }


                              },
                              child: Text("ADD COURSE"))
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
