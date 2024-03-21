import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerCourseViewModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../repo/KConstantsUI.dart';

class CustomerCoursesView extends StatefulWidget {
  CustomerCoursesView({required this.chosenStudioID,required this.userID, super.key});

  int chosenStudioID;
  String userID;


  @override
  State<CustomerCoursesView> createState() => _CustomerCoursesViewState();
}


class _CustomerCoursesViewState extends State<CustomerCoursesView> {
  // control_came_from get control_came_from_where => this.control_came_from_where;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CustomerCoursesViewModel>().setChosenStudioAndUserID(widget.chosenStudioID,widget.userID);
    context.read<CustomerCoursesViewModel>().fetchCoursesList(widget.chosenStudioID);
  }
  @override
  Widget build(BuildContext context) {
    CustomerCoursesViewModel customerCoursesViewModel = context.watch<CustomerCoursesViewModel>();
    return  Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        // Get.to(() => AddNewCourse());
      }),
      body:
      customerCoursesViewModel.listOfCourses!=null?
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Course"),
            Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemCount: customerCoursesViewModel.listOfCourses!.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return ListTile(
                        title: GestureDetector(
                            onTap: (){
                            },
                            child: Text(customerCoursesViewModel.listOfCourses![index].courseName)),
                        subtitle: GestureDetector(
                          onTap: (){
                            customerCoursesViewModel.tileTapped(index);

                            // Get.to(()=>ManagerDetailedCourseViewB());
                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (BuildContext context) {
                            //   // return ManagerDetailedCourseView(key: Key(''));
                            // }));
                            // listOfStudiosViewModel.listTile_pressed(index);
                          },
                          child: DisplayCard(
                            body:
                            // customerCoursesViewModel.bookedCourses.contains(customerCoursesViewModel.listOfCourses![index])
                            Column(
                              children: [
                                Text("${customerCoursesViewModel.listOfCourses![index].courseId}"),
                                Text("${customerCoursesViewModel.listOfCourses![index].discount}"),
                                Text("${customerCoursesViewModel.listOfCourses![index].price}"),
                                Text("${customerCoursesViewModel.listOfCourses![index].startDate}"),
                                Text("${customerCoursesViewModel.listOfCourses![index].endDate}"),
                                Text("${customerCoursesViewModel.listOfCourses![index].teacherName}"),
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
      ):Center(child: CircularProgressIndicator(),),
    );
  }

  InitialUIButton({required String label, required void Function() onpress})
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 20,
          foregroundColor: Colors.orange,

        ),
        child: Text(label, style: GoogleFonts.montserrat(color: Colors.white),),
      ),
    );
  }
}
