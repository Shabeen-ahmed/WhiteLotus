
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ViewModel/ListOfStudiosVM.dart';

kFloatingActionButton({required void Function() onpress}){
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: (){
      onpress();
    },
  );
}

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    super.key,
    required this.body
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: body,
        ),
      elevation: 30,
    );
  }
}

TextStyle NormalText = GoogleFonts.montserrat(color: Colors.white);