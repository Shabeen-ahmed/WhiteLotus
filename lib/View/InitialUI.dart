import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/InitialUIVM.dart';
import '../repo/KConstants.dart';

class InitialUI extends StatelessWidget {
  const InitialUI({super.key});

  @override
  Widget build(BuildContext context) {
    InitialUIViewModel initialUIViewModel = context.watch<InitialUIViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController ipField = TextEditingController();
          Get.defaultDialog(
              title: 'Set IP Address',
              content: Column(children: [
                TextField(
                  controller: ipField,
                ),
                ElevatedButton(
                    onPressed: () {
                      setIP(ipField.text);
                      Get.back();
                    },
                    child: const Text("Set IP Address"))
              ]));
        },
        child: const Icon(Icons.settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome"),
            Column(
              children: [
                InitialUIButton(
                    label: "General Manager",
                    onpress: () {
                      initialUIViewModel.generalManagerButton_pressed();
                    }),
                InitialUIButton(
                    label: "Managers",
                    onpress: () {
                      initialUIViewModel.managersButton_pressed();
                    }),
                InitialUIButton(
                    label: "Customers",
                    onpress: () {
                      initialUIViewModel.customerButton_pressed();
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
