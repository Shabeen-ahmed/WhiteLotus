import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:white_lotus/repo/ApiServices.dart';

import '../../ViewModel/CustomerViewModels/CustomerCancelViewModel.dart';

class CustomerCancelView extends StatelessWidget {
  TextEditingController bookingID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CustomerCancelViewModel customerCancelViewModel = context.watch<CustomerCancelViewModel>();
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cancel Booking"),
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Enter BookingID"),
                      TextField(
                        // label: 'Enter current password',
                        controller: bookingID,
                        // validator:  (value) =>
                        // value.isEmpty ? 'Password cannot be blank' : null,
                      ),
                    ],
                  ),
                ),


                InitialUIButton(label: "Submit", onpress: (){
                  customerCancelViewModel.submit_pressed(bookingID.text);
                  // Get.to(()=>ListOfStudiosView(control_came_from_where: control_came_from.Customers,));

                }),
              ],
            )
          ],
        ),

      ),
    );
  }
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