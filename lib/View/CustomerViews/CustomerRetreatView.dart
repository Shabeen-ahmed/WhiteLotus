// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/CustomerViewModels/CustomerRetreatViewModel.dart';
import '../../repo/KConstantsUI.dart';

class CustomerRetreatsView extends StatefulWidget {
  const CustomerRetreatsView(
      {required this.chosenStudioID, required this.userID, super.key});

  final int chosenStudioID;
  final String userID;

  @override
  State<CustomerRetreatsView> createState() => _CustomerRetreatsViewState();
}

class _CustomerRetreatsViewState extends State<CustomerRetreatsView> {
  @override
  void initState() {
    super.initState();
    context
        .read<CustomerRetreatViewModel>()
        .setChosenStudioAndUserID(widget.chosenStudioID, widget.userID);
    context
        .read<CustomerRetreatViewModel>()
        .fetchRetreatsList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    CustomerRetreatViewModel customerRetreatsViewModel =
        context.watch<CustomerRetreatViewModel>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: kFloatingActionBack(),
      body: customerRetreatsViewModel.listOfRetreats != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Select Retreat"),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 700,
                        child: ListView.builder(
                          itemCount:
                              customerRetreatsViewModel.listOfRetreats!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(customerRetreatsViewModel
                                  .listOfRetreats![index].retreatName),
                              subtitle: DisplayCard(
                                body: customerRetreatsViewModel.bookedRetreats
                                        .map((e) => e.retreatId)
                                        .contains(customerRetreatsViewModel
                                            .listOfRetreats![index].retreatId)
                                    ? Column(
                                        children: [
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].retreatName),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].activity),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].meal),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].price),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Booked "),
                                                Icon(Icons.check_box_rounded),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].retreatName),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].activity),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].meal),
                                          Text(
                                              customerRetreatsViewModel.listOfRetreats![index].price),
                                          ElevatedButton(
                                              onPressed: () {
                                                customerRetreatsViewModel
                                                    .check_availibility(index);
                                              },
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Check Availibility "),
                                                  Icon(Icons
                                                      .chevron_right_sharp),
                                                ],
                                              ))
                                        ],
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
            )
          : const Center(
              child: CircularProgressIndicator(),
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
