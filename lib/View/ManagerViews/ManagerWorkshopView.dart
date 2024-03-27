// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/View/ManagerViews/ManagerAlterItemViews/AddNewWorkshop.dart';
import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerWorkshopViewModel.dart';
import 'package:white_lotus/repo/KConstantsUI.dart';
// managaer view of workshop list
class ManagerWorkshopView extends StatefulWidget {
  ManagerWorkshopView({required this.chosenStudioID, super.key});

  int chosenStudioID;

  @override
  State<ManagerWorkshopView> createState() => _ManagerWorkshopViewState();
}

class _ManagerWorkshopViewState extends State<ManagerWorkshopView> {

  @override
  void initState() {
    super.initState();
    context
        .read<ManagerWorkshopViewModel>()
        .fetchAllWorkshopList(widget.chosenStudioID);
  }

  @override
  Widget build(BuildContext context) {
    ManagerWorkshopViewModel managerWorkshopViewModel =
    context.watch<ManagerWorkshopViewModel>();
    return Scaffold(
      floatingActionButton: kFloatingActionButton(onpress: () {
        Get.to(() => AddNewWorkshop());
      }),
      body: managerWorkshopViewModel.isloading
          ? Center(child: CircularProgressIndicator())
          : managerWorkshopViewModel.listOfWorkshops != null
          ? SingleChildScrollView(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            Text("All Workshops"),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemCount:
                    managerWorkshopViewModel.listOfWorkshops!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(managerWorkshopViewModel
                            .listOfWorkshops![index].workshopName),
                        subtitle: DisplayCard(
                          body: Column(
                            children: [
                              Text(
                                "${managerWorkshopViewModel.listOfWorkshops![index].workshopName}", style: NormalText,),
                              Text(
                                  "${managerWorkshopViewModel.listOfWorkshops![index].price}", style: NormalText),
                              Text(
                                  "${managerWorkshopViewModel.listOfWorkshops![index].schedule}", style: NormalText),
                              Text(
                                  "${managerWorkshopViewModel.listOfWorkshops![index].duration}", style: NormalText),
                              Text(
                                  "${managerWorkshopViewModel.listOfWorkshops![index].theme}", style: NormalText),
                              Text(
                                  "${managerWorkshopViewModel.listOfWorkshops![index].teacherName}", style: NormalText),
                              ElevatedButton(
                                  onPressed: () {
                                    managerWorkshopViewModel
                                        .delete_pressed(index);
                                  },
                                  child: Icon(
                                      Icons.delete_outline_outlined))
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
                  managerWorkshopViewModel.addNewClassButtonPressed();
                },
                child: Text("Add New Workshop"))
                    ],
                  ),
          ),
    );
  }

}
