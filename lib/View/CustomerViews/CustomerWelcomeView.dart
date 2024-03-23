import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:white_lotus/View/CustomerViews/CustomerClassView.dart';
import 'package:white_lotus/View/CustomerViews/CustomerCourseView.dart';
import 'package:white_lotus/View/CustomerViews/CustomerWorkshopView.dart';
import 'package:white_lotus/View/CustomerViews/CustomerRetreatView.dart';
import 'package:white_lotus/View/CustomerViews/CustomerCancelView.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../ManagerViews/ManagerCoursesView.dart';


class CustomerWelcomeView extends StatelessWidget {
  CustomerWelcomeView(this.chosenStudioID,this.userID, {super.key});

  int chosenStudioID;
  String userID;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Customer $userID"),
            Column(
              children: [
                CustomerUIButton(label: "Book Courses", onpress: (){
                  Get.to(()=>CustomerCoursesView(chosenStudioID: chosenStudioID,userID: userID,));
                }),
                CustomerUIButton(label: "Book Classes", onpress: (){
                  Get.to(()=>CustomerClassesView(chosenStudioID: chosenStudioID, userID: userID,));
                }),
                CustomerUIButton(label: "Book Workshop", onpress: (){
                  Get.to(()=>CustomerWorkshopsView(chosenStudioID: chosenStudioID, userID: userID,));
                }),
                CustomerUIButton(label: "Book Retreat", onpress: (){
                  Get.to(()=>CustomerRetreatsView(chosenStudioID: chosenStudioID, userID: userID,));
                }),
                CustomerUIButton(label: "Cancel a Booking", onpress: (){
                  Get.to(()=>CustomerCancelView());
                }),
              ],
            )
          ],
        ),

      ),
    );
  }
  CustomerUIButton({required String label, required void Function() onpress})
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
