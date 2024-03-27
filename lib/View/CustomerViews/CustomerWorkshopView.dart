import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/CustomerViewModels/CustomerWorkshopViewModel.dart';
import '../../repo/KConstantsUI.dart';

class CustomerWorkshopsView extends StatefulWidget {
  const CustomerWorkshopsView(
      {required this.chosenStudioID, required this.userID, super.key});

  final int chosenStudioID;
  final String userID;

  @override
  State<CustomerWorkshopsView> createState() => _CustomerWorkshopsViewState();
}

class _CustomerWorkshopsViewState extends State<CustomerWorkshopsView> {
  @override
  void initState() {
    super.initState();
    context
        .read<CustomerWorkshopViewModel>()
        .setChosenStudioAndUserID(widget.chosenStudioID, widget.userID);
    context
        .read<CustomerWorkshopViewModel>()
        .fetchWorkshopsList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    CustomerWorkshopViewModel customerWorkshopsViewModel =
        context.watch<CustomerWorkshopViewModel>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: kFloatingActionBack(),
      body: customerWorkshopsViewModel.listOfWorkshops != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Select Workshop"),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 700,
                        child: ListView.builder(
                          itemCount: customerWorkshopsViewModel
                              .listOfWorkshops!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: GestureDetector(
                                  onTap: () {},
                                  child: Text(customerWorkshopsViewModel
                                      .listOfWorkshops![index].workshopName)),
                              subtitle: DisplayCard(
                                body: customerWorkshopsViewModel.bookedWorkshops
                                        .map((e) => e.workshopId)
                                        .contains(customerWorkshopsViewModel
                                            .listOfWorkshops![index].workshopId)
                                    ? Column(
                                        children: [
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].workshopName),
                                          Text(
                                              "${customerWorkshopsViewModel.listOfWorkshops![index].teacherName}"),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].price),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].duration),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].capacity),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].theme),
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
                                              customerWorkshopsViewModel.listOfWorkshops![index].workshopName),
                                          Text(
                                              "${customerWorkshopsViewModel.listOfWorkshops![index].teacherName}"),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].price),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].duration),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].capacity),
                                          Text(
                                              customerWorkshopsViewModel.listOfWorkshops![index].theme),
                                          ElevatedButton(
                                              onPressed: () {
                                                customerWorkshopsViewModel
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
