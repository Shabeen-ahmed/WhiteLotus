import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/ListOfStudiosVM.dart';
import 'package:white_lotus/repo/ApiServices.dart';
import 'package:white_lotus/repo/KConstants.dart';

import '../repo/KConstantsUI.dart';

class ListOfStudiosView extends StatefulWidget {
   ListOfStudiosView({required this.control_came_from_where, this.userID, super.key});

   control_came_from control_came_from_where;
   String? userID;


  @override
  State<ListOfStudiosView> createState() => _ListOfStudiosViewState();
}


class _ListOfStudiosViewState extends State<ListOfStudiosView> {
  // control_came_from get control_came_from_where => this.control_came_from_where;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListOfStudiosViewModel>().setControl(widget.control_came_from_where,widget.userID);
    context.read<ListOfStudiosViewModel>().fetchStudioList();
  }
  @override
  Widget build(BuildContext context) {
    ListOfStudiosViewModel listOfStudiosViewModel = context.watch<ListOfStudiosViewModel>();
print("listOfStudiosViewModel.studioClasses");
print(listOfStudiosViewModel.studioClasses);
    return  Scaffold(
      body:
      listOfStudiosViewModel.studioClasses!=null?
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Studio"),
            Column(
              children: [
                SizedBox(height: 100,),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: listOfStudiosViewModel.studioClasses!.length,
                    itemBuilder:
                      (BuildContext context, int index) {
                      return ListTile(
                        title: GestureDetector(
                            onTap: (){
                              listOfStudiosViewModel.printer();
                            },
                            child: Text(listOfStudiosViewModel.studioClasses![index].studioName)),
                        subtitle: GestureDetector(
                          onTap: (){
                            listOfStudiosViewModel.listTile_pressed(index);
                          },
                          child: DisplayCard(
                          body: Column(
                            children: [
                              Text("${listOfStudiosViewModel.studioClasses![index].studioId}"),
                              Text("${listOfStudiosViewModel.studioClasses![index].location}"),
                              Text("${listOfStudiosViewModel.studioClasses![index].contactNumber}"),
                              Text("${listOfStudiosViewModel.studioClasses![index].email}"),
                            ],
                          ),),
                        ),
                      );
        
                      },
        
                  ),
                )
        
              ],
            )
          ],
        ),
      ):Center(child: CircularProgressIndicator(),),
    );
  }

  InitialUIButton({required String label, required void Function() onpress})
  {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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
}


