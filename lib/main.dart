import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_lotus/View/InitialUI.dart';
import 'package:provider/provider.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerClassViewModel.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerCourseViewModel.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerWorkshopViewModel.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerRetreatViewModel.dart';
import 'package:white_lotus/ViewModel/CustomerViewModels/CustomerCancelViewModel.dart';
import 'package:white_lotus/ViewModel/InitialUIVM.dart';
import 'package:white_lotus/ViewModel/ListOfStudiosVM.dart';
import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerClassVM.dart';
import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerRetreatViewModel.dart';
import 'ViewModel/CustomerViewModels/CustomerLogInRegisterViewModel.dart';
import 'ViewModel/ManagerViewModels/ManagerCoursesVM.dart';
import 'ViewModel/ManagerViewModels/ManagerWorkshopViewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InitialUIViewModel()),
        ChangeNotifierProvider(create: (_) => ListOfStudiosViewModel()),
        ChangeNotifierProvider(create: (_) => ManagerCoursesViewModel()),
        ChangeNotifierProvider(create: (_) => ManagerClassesViewModel()),
        ChangeNotifierProvider(create: (_) => ManagerWorkshopViewModel()),
        ChangeNotifierProvider(create: (_) => ManagerRetreatViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerCoursesViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerLoginRegisterViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerClassViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerWorkshopViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerRetreatViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerCancelViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InitialUI(),
      ),
    );
  }
}
