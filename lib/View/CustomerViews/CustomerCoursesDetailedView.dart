import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerCourseViewModel.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../repo/KConstantsUI.dart';

class CustomerCoursesDetailedView extends StatefulWidget {
  const CustomerCoursesDetailedView({required this.index, super.key});

  final int index;

  @override
  State<CustomerCoursesDetailedView> createState() => _CustomerCoursesDetailedViewState();
}


class _CustomerCoursesDetailedViewState extends State<CustomerCoursesDetailedView> {
  // control_came_from get control_came_from_where => this.control_came_from_where;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CustomerCoursesViewModel>().fetchCourseDetailed(widget.index);
    // context.read<CustomerCoursesViewModel>().fetchCoursesList(widget.chosenStudioID);
  }
  @override
  Widget build(BuildContext context) {
    CustomerCoursesViewModel customerCoursesViewModel = context.watch<CustomerCoursesViewModel>();
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body:
        customerCoursesViewModel.courseDetails!=null?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Classes enrolled"),
              Column(
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                      itemCount: customerCoursesViewModel.courseDetails!.length,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration:  BoxDecoration(
                                color: Colors.white70,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [BoxShadow(
                                color: Colors.black45,
                                offset: Offset(1,5)
                              )]
                            ),
                            
                            child:  Column(
                              children: [
                                Text("${customerCoursesViewModel.courseDetails![index].className}"),
                                Text("${customerCoursesViewModel.courseDetails![index].capacity}"),
                                Text("${customerCoursesViewModel.courseDetails![index].duration}"),
                                Text("${customerCoursesViewModel.courseDetails![index].schedule}"),
                              ],
                            )
                          ),
                        );
      
                      },
      
                    ),
                  ),

                  // customerCoursesViewModel.bookedCourses.contains(customerCoursesViewModel.listOfCourses![widget.index])
                  customerCoursesViewModel.bookedCourses.map((e) => e.courseId).contains(customerCoursesViewModel.listOfCourses![widget.index].courseId)
                      ?
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      onPressed: ()async {
                        // customerCoursesViewModel.booking_pressed(widget.index);
                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs.setString('savedCourseBookings', '');
                      },
                      child: Text("Booked", style: GoogleFonts.montserrat(fontSize: 20),))
                      :
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent
                      ),
                      onPressed: () {
                        customerCoursesViewModel.booking_pressed(widget.index);
                      },
                      child: Text("Book Course", style: GoogleFonts.montserrat(fontSize: 20),))

                ],
              )
            ],
          ),
        ):Center(child: CircularProgressIndicator(),),
      ),
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
