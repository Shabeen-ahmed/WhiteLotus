// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/ListOfStudiosVM.dart';
import 'package:white_lotus/repo/KConstants.dart';
import '../repo/KConstantsUI.dart';

//List of Studios view which is re-used 3 types across the app with the help of control_came_from_where.
//this view shows the list of studios from the database and user have to pick one
class ListOfStudiosView extends StatefulWidget {
  ListOfStudiosView(
      {required this.control_came_from_where, this.userID, super.key});

  control_came_from control_came_from_where;
  String? userID;

  @override
  State<ListOfStudiosView> createState() => _ListOfStudiosViewState();
}

class _ListOfStudiosViewState extends State<ListOfStudiosView> {
  @override
  void initState() {
    super.initState();
    //while the state is initialized, necessary methods for loading the lists are also called by overriding the pre defined initState method
    context
        .read<ListOfStudiosViewModel>()
        .setControl(widget.control_came_from_where, widget.userID);

  }

  @override
  Widget build(BuildContext context) {
    ListOfStudiosViewModel listOfStudiosViewModel =
        context.watch<ListOfStudiosViewModel>();
    return Scaffold(
      body: listOfStudiosViewModel.studioClasses != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Select Studio"),
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount:
                              listOfStudiosViewModel.studioClasses!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(listOfStudiosViewModel
                                  .studioClasses![index].studioName),
                              subtitle: GestureDetector(
                                onTap: () {
                                  listOfStudiosViewModel
                                      .listTile_pressed(index);
                                },
                                child: DisplayCard(
                                  body: Column(
                                    children: [
                                      Text(
                                          "${listOfStudiosViewModel.studioClasses![index].studioId}"),
                                      Text(
                                          listOfStudiosViewModel.studioClasses![index].location),
                                      Text(
                                          listOfStudiosViewModel.studioClasses![index].contactNumber),
                                      Text(
                                          listOfStudiosViewModel.studioClasses![index].email),
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  InitialUIButton({required String label, required void Function() onpress}) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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
