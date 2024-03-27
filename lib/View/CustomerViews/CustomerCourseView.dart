// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerCourseViewModel.dart';

import '../../repo/KConstantsUI.dart';

class CustomerCoursesView extends StatefulWidget {
  CustomerCoursesView(
      {required this.chosenStudioID, required this.userID, super.key});

  int chosenStudioID;
  String userID;

  @override
  State<CustomerCoursesView> createState() => _CustomerCoursesViewState();
}

class _CustomerCoursesViewState extends State<CustomerCoursesView> {
  @override
  void initState() {
    super.initState();
    context
        .read<CustomerCoursesViewModel>()
        .initializeViewModel(widget.chosenStudioID, widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    CustomerCoursesViewModel customerCoursesViewModel =
        context.watch<CustomerCoursesViewModel>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: kFloatingActionBack(),
      body: customerCoursesViewModel.listOfCourses != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Select Course"),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 700,
                        child: ListView.builder(
                          itemCount:
                              customerCoursesViewModel.listOfCourses!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: GestureDetector(
                                  onTap: () {},
                                  child: Text(customerCoursesViewModel
                                      .listOfCourses![index].courseName)),
                              subtitle: GestureDetector(
                                onTap: () {
                                  customerCoursesViewModel.tileTapped(index);
                                },
                                child: DisplayCard(
                                  body: Column(
                                    children: [
                                      Text(
                                          "${customerCoursesViewModel.listOfCourses![index].courseId}"),
                                      Text(
                                          customerCoursesViewModel.listOfCourses![index].discount),
                                      Text(
                                          customerCoursesViewModel.listOfCourses![index].price),
                                      Text(
                                          "${customerCoursesViewModel.listOfCourses![index].startDate}"),
                                      Text(
                                          "${customerCoursesViewModel.listOfCourses![index].endDate}"),
                                      Text(
                                          "${customerCoursesViewModel.listOfCourses![index].teacherName}"),
                                    ],
                                  ),
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
          : const Center(
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
