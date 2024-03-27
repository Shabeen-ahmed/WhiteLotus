import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerCoursesVM.dart';

import '../../repo/KConstantsUI.dart';
import 'ManagerAlterItemViews/AddNewCourse.dart';
// Manager view of courses list

class ManagerCoursesView extends StatefulWidget {
  ManagerCoursesView({required this.chosenStudioID, super.key});

  int chosenStudioID;

  @override
  State<ManagerCoursesView> createState() => _ManagerCoursesViewState();
}

class _ManagerCoursesViewState extends State<ManagerCoursesView> {
  @override
  void initState() {
    super.initState();
    context
        .read<ManagerCoursesViewModel>()
        .setChosenStudio(widget.chosenStudioID);
    context
        .read<ManagerCoursesViewModel>()
        .fetchCoursesList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    ManagerCoursesViewModel managerCoursesViewModel =
        context.watch<ManagerCoursesViewModel>();
    return Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        Get.to(() => AddNewCourse());
      }),
      body: managerCoursesViewModel.listOfCourses != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select Course"),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 700,
                        child: ListView.builder(
                          itemCount:
                              managerCoursesViewModel.listOfCourses!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: GestureDetector(
                                  onTap: () {},
                                  child: Text(managerCoursesViewModel
                                      .listOfCourses![index].courseName)),
                              subtitle: DisplayCard(
                                body: Column(
                                  children: [
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].courseId}"),
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].discount}"),
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].price}"),
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].startDate}"),
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].endDate}"),
                                    Text(
                                        "${managerCoursesViewModel.listOfCourses![index].teacherName}"),
                                    ElevatedButton(
                                        onPressed: () {
                                          managerCoursesViewModel
                                              .delete_pressed(index);
                                        },
                                        child: const Icon(
                                            Icons.delete_outline_outlined))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  InitialUIButton({required String label, required void Function() onpress}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 20,
          foregroundColor: Colors.orange,
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
    );
  }
}
