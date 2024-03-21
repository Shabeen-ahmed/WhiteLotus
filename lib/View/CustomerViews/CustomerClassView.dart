import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/CustomerViewModels/CustomerClassViewModel.dart';
import '../../repo/KConstantsUI.dart';

class CustomerClassesView extends StatefulWidget {
  const CustomerClassesView({required this.chosenStudioID,required this.userID, super.key});

  final int chosenStudioID;
  final String userID;


  @override
  State<CustomerClassesView> createState() => _CustomerClassesViewState();
}


class _CustomerClassesViewState extends State<CustomerClassesView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CustomerClassViewModel>().setChosenStudioAndUserID(widget.chosenStudioID,widget.userID);
    context.read<CustomerClassViewModel>().fetchClassesList(widget.chosenStudioID);
  }
  @override
  Widget build(BuildContext context) {
    CustomerClassViewModel customerClassesViewModel = context.watch<CustomerClassViewModel>();
    return  Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        // Get.to(() => AddNewCourse());
      }),
      body:
      customerClassesViewModel.listOfClasses!=null?
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
                    itemCount: customerClassesViewModel.listOfClasses!.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return ListTile(
                        title: GestureDetector(
                            onTap: (){
                            },
                            child: Text(customerClassesViewModel.listOfClasses![index].className)),
                        subtitle: GestureDetector(
                          onTap: (){

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
                            customerClassesViewModel.bookedClasses.map((e) => e.classId).contains(customerClassesViewModel.listOfClasses![index].classId)
                                ?
                            Column(
                              children: [
                                Text("${customerClassesViewModel.listOfClasses![index].className}"),
                                Text("${customerClassesViewModel.listOfClasses![index].teacherName}"),
                                Text("${customerClassesViewModel.listOfClasses![index].price}"),
                                Text("${customerClassesViewModel.listOfClasses![index].duration}"),
                                Text("${customerClassesViewModel.listOfClasses![index].capacity}"),
                                Text("${customerClassesViewModel.listOfClasses![index].level}"),
                                Text("${customerClassesViewModel.listOfClasses![index].type}"),
                                ElevatedButton(
                                  onPressed: () {
                                    // customerClassesViewModel
                                    //     .booking_pressed(index);
                                    print(customerClassesViewModel.bookedClasses);
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Booked "),
                                      Icon(
                                          Icons.check_box_rounded),
                                    ],
                                  ),
                                )
                              ],
                            ): Column(
                              children: [
                                Text("${customerClassesViewModel.listOfClasses![index].className}"),
                                Text("${customerClassesViewModel.listOfClasses![index].teacherName}"),
                                Text("${customerClassesViewModel.listOfClasses![index].price}"),
                                Text("${customerClassesViewModel.listOfClasses![index].duration}"),
                                Text("${customerClassesViewModel.listOfClasses![index].capacity}"),
                                Text("${customerClassesViewModel.listOfClasses![index].level}"),
                                Text("${customerClassesViewModel.listOfClasses![index].type}"),
                                ElevatedButton(
                                    onPressed: () {
                                      customerClassesViewModel
                                          .check_availibility(index);
                                    },
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Check Availibility "),
                                        Icon(
                                            Icons.chevron_right_sharp),
                                      ],
                                    ))
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