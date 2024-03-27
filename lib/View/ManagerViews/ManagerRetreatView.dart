import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/repo/KConstantsUI.dart';

import '../../ViewModel/ManagerViewModels/ManagerRetreatViewModel.dart';
import 'ManagerAlterItemViews/AddNewRetreat.dart';

// Manager view of retreats list
class ManagerRetreatView extends StatefulWidget {
  ManagerRetreatView({required this.chosenStudioID, super.key});

  int chosenStudioID;

  @override
  State<ManagerRetreatView> createState() => _ManagerRetreatViewState();
}

class _ManagerRetreatViewState extends State<ManagerRetreatView> {
  @override
  void initState() {
    super.initState();
    context
        .read<ManagerRetreatViewModel>()
        .fetchRetreatList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    ManagerRetreatViewModel managerRetreatViewModel =
        context.watch<ManagerRetreatViewModel>();
    return Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        Get.to(() => AddNewRetreat());
      }),
      body: managerRetreatViewModel.isloading
          ? Center(child: CircularProgressIndicator())
          : managerRetreatViewModel.listOfRetreats != null
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("All Retreats"),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 700,
                            child: ListView.builder(
                              itemCount: managerRetreatViewModel
                                  .listOfRetreats!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(managerRetreatViewModel
                                      .listOfRetreats![index].retreatName),
                                  subtitle: DisplayCard(
                                    body: Column(
                                      children: [
                                        Text(
                                          "${managerRetreatViewModel.listOfRetreats![index].retreatName}",
                                          style: NormalText,
                                        ),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].workshopName}",
                                            style: NormalText),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].teacherName}",
                                            style: NormalText),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].activity}",
                                            style: NormalText),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].meal}",
                                            style: NormalText),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].price}",
                                            style: NormalText),
                                        Text(
                                            "${managerRetreatViewModel.listOfRetreats![index].retreatId}",
                                            style: NormalText),
                                        ElevatedButton(
                                            onPressed: () {
                                              managerRetreatViewModel
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
                      Text("Please add a workshop to see it here."),
                      ElevatedButton(
                          onPressed: () {
                            managerRetreatViewModel.addNewClassButtonPressed();
                          },
                          child: Text("Add New Workshop"))
                    ],
                  ),
                ),
    );
  }
}
