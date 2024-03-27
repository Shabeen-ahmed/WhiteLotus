// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/CustomerViewModels/CustomerCancelViewModel.dart';

//view of customer booking cancellation screen
class CustomerCancelView extends StatelessWidget {
  TextEditingController bookingID = TextEditingController();

  CustomerCancelView({super.key});

  @override
  Widget build(BuildContext context) {
    CustomerCancelViewModel customerCancelViewModel =
        context.watch<CustomerCancelViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cancel Booking"),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Enter BookingID"),
                      TextField(
                        controller: bookingID,
                      ),
                    ],
                  ),
                ),
                InitialUIButton(
                    label: "Submit",
                    onpress: () {
                      customerCancelViewModel.submit_pressed(bookingID.text);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
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
