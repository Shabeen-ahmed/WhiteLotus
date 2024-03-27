// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/CustomerViewModels/CustomerLogInRegisterViewModel.dart';

class CustomerLoginView extends StatelessWidget {
  TextEditingController userID = TextEditingController();

  CustomerLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    CustomerLoginRegisterViewModel customerLoginRegisterViewModel =
        context.watch<CustomerLoginRegisterViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Log In"),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("enter userID"),
                      TextField(
                        controller: userID,
                      ),
                    ],
                  ),
                ),
                InitialUIButton(
                    label: "Log In",
                    onpress: () {
                      customerLoginRegisterViewModel.login_pressed(userID.text);
                    }),
              ],
            )
          ],
        ),
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
