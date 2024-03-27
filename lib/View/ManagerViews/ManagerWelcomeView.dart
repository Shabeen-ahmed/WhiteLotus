import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:white_lotus/View/ManagerViews/ManagerClassView.dart';
import 'package:white_lotus/View/ManagerViews/ManagerCoursesView.dart';

import 'ManagerRetreatView.dart';
import 'ManagerWorkshopView.dart';

class ManagerMainView extends StatelessWidget {
   ManagerMainView(this.chosenStudioID, {super.key});

  int chosenStudioID;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Manager"),
            Column(
              children: [
                ManagerUIButton(label: "Courses", onpress: (){
                  Get.to(()=>ManagerCoursesView(chosenStudioID: chosenStudioID,));

                }),
                ManagerUIButton(label: "Classes", onpress: (){
                  Get.to(()=>ManagerClassesView(chosenStudioID: chosenStudioID,));

                }),
                ManagerUIButton(label: "Workshop", onpress: (){
                  Get.to(()=>ManagerWorkshopView(chosenStudioID: chosenStudioID,));


                }),
                ManagerUIButton(label: "Retreat", onpress: (){
                  Get.to(()=>ManagerRetreatView(chosenStudioID: chosenStudioID,));
                }),
              ],
            )
          ],
        ),

      ),
    );
  }
  ManagerUIButton({required String label, required void Function() onpress})
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
