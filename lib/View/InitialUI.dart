import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/InitialUIVM.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import 'ListOfStudiosView.dart';

class InitialUI extends StatelessWidget {
  const InitialUI({super.key});

  @override
  Widget build(BuildContext context) {
    InitialUIViewModel initialUIViewModel = context.watch<InitialUIViewModel>();
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            Column(
              children: [
                InitialUIButton(label: "General Manager", onpress: (){
                  initialUIViewModel.generalManagerButton_pressed();
                  // ApiService().fetchAllStudios();
                  // Get.to(()=> ListOfStudiosView());
                }),
                InitialUIButton(label: "Managers", onpress: (){
                  initialUIViewModel.managersButton_pressed();

                }),
                InitialUIButton(label: "Customers", onpress: (){
                  initialUIViewModel.customerButton_pressed();

                }),
              ],
            )
          ],
        ),
      
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
