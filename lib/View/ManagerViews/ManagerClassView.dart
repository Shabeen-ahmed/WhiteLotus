import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/View/ManagerViews/ManagerAlterItemViews/AddNewClass.dart';
import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerClassVM.dart';
import 'package:white_lotus/repo/KConstantsUI.dart';

class ManagerClassesView extends StatefulWidget {
  ManagerClassesView({required this.chosenStudioID, super.key});

  int chosenStudioID;

  @override
  State<ManagerClassesView> createState() => _ManagerClassesViewState();
}

class _ManagerClassesViewState extends State<ManagerClassesView> {
  @override
  void initState() {
    super.initState();
    context
        .read<ManagerClassesViewModel>()
        .fetchAllClassesList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    ManagerClassesViewModel managerClassesViewModel =
        context.watch<ManagerClassesViewModel>();
    return Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        Get.to(() => AddNewClass());
      }),
      body: managerClassesViewModel.isloading
          ? Center(child: CircularProgressIndicator())
          : managerClassesViewModel.listOfClasses != null
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("All Classes"),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 700,
                            child: ListView.builder(
                              itemCount:
                                  managerClassesViewModel.listOfClasses!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(managerClassesViewModel
                                      .listOfClasses![index].className),
                                  subtitle: DisplayCard(
                                    body: Column(
                                      children: [
                                        Text(
                                          "${managerClassesViewModel.listOfClasses![index].teacherName}",
                                          style: NormalText,
                                        ),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].price}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].courseName}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].capacity}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].duration}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].level}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].schedule}"),
                                        Text(
                                            "${managerClassesViewModel.listOfClasses![index].type}"),
                                        ElevatedButton(
                                            onPressed: () {
                                              managerClassesViewModel
                                                  .delete_pressed(index);
                                            },
                                            child: Icon(Icons
                                                .delete_outline_outlined))
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
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Please add a class to see it here."),
                      ElevatedButton(
                          onPressed: () {
                            managerClassesViewModel.addNewClassButtonPressed();
                          },
                          child: Text("Add New Class"))
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
