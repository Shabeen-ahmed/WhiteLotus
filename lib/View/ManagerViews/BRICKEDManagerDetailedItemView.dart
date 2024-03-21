// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:provider/provider.dart';
// // // import 'package:white_lotus/ViewModel/ListOfStudiosVM.dart';
// // // import 'package:white_lotus/ViewModel/ManagerViewModels/ManagerCoursesVM.dart';
// // // import 'package:white_lotus/repo/ApiServices.dart';
// // // import 'package:white_lotus/repo/KConstants.dart';
// // //
// // //
// // // abstract class ManagerDetailedView extends StatelessWidget {
// // // // or
// // // // abstract class ICustomWidget extends StatelessWidget {
// // //   void myProtocal();
// // //   int a = 0;
// // //   Widget? welcome = Text("Hello world");
// // //   Widget UI = Scaffold(
// // //     body: Padding(
// // //       padding: const EdgeInsets.all(20.0),
// // //       child: Card(
// // //
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text('Edit', textAlign: TextAlign.center,),
// // //           ],
// // //         ),
// // //       ),
// // //     ),
// // //   );
// // // }
// // //
// // // // class ManagerDetailedCourseView extends StatelessWidget implements ManagerDetailedView {
// // // //
// // // //   @override
// // // //   void myProtocal() {
// // // //     // TODO: implement myProtocal
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Center(
// // // //       child: Text(
// // // //         a.toString()
// // // //       )
// // // //     );
// // // //     //Implementation
// // // //   }
// // // //
// // // //   @override
// // // //   int a=1;
// // // //
// // // //   @override
// // // //   Widget? welcome;
// // // //
// // // // }
// // //
// // // class ManagerDetailedCourseViewB extends ManagerDetailedView {
// // //
// // //   @override
// // //   void myProtocal() {
// // //     // TODO: implement myProtocal
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(
// // //         child: GestureDetector(
// // //             onTap: (){
// // //               // Get.to(()=>ManagerDetailedCourseView());
// // //             },
// // //             child: this.UI),
// // //     );
// // //     //Implementation
// // //   }
// // // }
// // //
// // // // class ManagerCoursesView extends StatefulWidget {
// // // //   ManagerCoursesView({required this.chosenStudioID, super.key});
// // // //
// // // //   int chosenStudioID;
// // // //
// // // //
// // // //   @override
// // // //   State<ManagerCoursesView> createState() => _ManagerCoursesViewState();
// // // // }
// // // //
// // // //
// // // // class _ManagerCoursesViewState extends State<ManagerCoursesView> {
// // // //   // control_came_from get control_came_from_where => this.control_came_from_where;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     // TODO: implement initState
// // // //     super.initState();
// // // //     context.read<ManagerCoursesViewModel>().fetchCoursesList(widget.chosenStudioID);
// // // //   }
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     ManagerCoursesViewModel managerCoursesViewModel = context.watch<ManagerCoursesViewModel>();
// // // //     return  Scaffold(
// // // //       floatingActionButton: FloatingActionButton(
// // // //         child: Icon(Icons.add),
// // // //         onPressed: (){},
// // // //       ),
// // // //       body:
// // // //       managerCoursesViewModel.listOfCourses!=null?
// // // //       Column(
// // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // //         children: [
// // // //           Text("Select Studio"),
// // // //           Column(
// // // //             children: [
// // // //               SizedBox(height: 10,),
// // // //               SizedBox(
// // // //                 height: 700,
// // // //                 child: ListView.builder(
// // // //                   itemCount: managerCoursesViewModel.listOfCourses!.length,
// // // //                   itemBuilder:
// // // //                       (BuildContext context, int index) {
// // // //                     return ListTile(
// // // //                       title: GestureDetector(
// // // //                           onTap: (){
// // // //                           },
// // // //                           child: Text(managerCoursesViewModel.listOfCourses![index].courseName)),
// // // //                       subtitle: GestureDetector(
// // // //                         onTap: (){
// // // //
// // // //                           // listOfStudiosViewModel.listTile_pressed(index);
// // // //                         },
// // // //                         child: Card(
// // // //                           color: Colors.deepPurpleAccent,
// // // //                           child: Column(
// // // //                             children: [
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].courseId}"),
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].discount}"),
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].price}"),
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].startDate}"),
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].endDate}"),
// // // //                               Text("${managerCoursesViewModel.listOfCourses![index].teacherName}"),
// // // //                             ],
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //
// // // //                   },
// // // //
// // // //                 ),
// // // //               )
// // // //
// // // //             ],
// // // //           )
// // // //         ],
// // // //       ):Center(child: CircularProgressIndicator(),),
// // // //     );
// // // //   }
// // // //
// // // //   InitialUIButton({required String label, required void Function() onpress})
// // // //   {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.all(8.0),
// // // //       child: ElevatedButton(onPressed: onpress,
// // // //         style: ElevatedButton.styleFrom(
// // // //           backgroundColor: Colors.deepPurpleAccent,
// // // //           elevation: 20,
// // // //           foregroundColor: Colors.orange,
// // // //
// // // //         ),
// // // //         child: Text(label, style: GoogleFonts.montserrat(color: Colors.white),),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // //
// // // // abstract class ICustomWidget {
// // // // // or
// // // // // abstract class ICustomWidget extends StatelessWidget {
// // // //   void myProtocal();
// // // // }
// // //
// // // // class A extends StatelessWidget implements ICustomWidget {
// // // //
// // // //   @override
// // // //   void myProtocal() {
// // // //     // TODO: implement myProtocal
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     //Implementation
// // // //   }
// // // // }
// // //
// // // // class B extends ICustomWidget {
// // // //   // compilation error, `myProtocal` not implemented
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     //Implementation
// // // //   }
// // // // }
// //
// //
// // // import 'package:flutter/material.dart';
// // //
// // // abstract class BasePageScreen extends StatefulWidget {
// // //   BasePageScreen({required Key key}) : super(key: key);
// // // }
// // //
// // //
// // //
// // // abstract class BasePageScreenState<Page extends BasePageScreen> extends State<Page> {
// // //
// // //   bool _isBack = true;
// // //   bool _isCart = true;
// // //
// // //   String appBarTitle();
// // //
// // //   void onClickBackButton();
// // //
// // //   void onClickCart();
// // //
// // //   void isBackButton(bool isBack) {
// // //     _isBack = isBack;
// // //   }
// // //
// // //   void isCartButton(bool isCart) {
// // //     _isCart = isCart;
// // //   }
// // //
// // // }
// // //
// // //
// // //
// // // mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           flexibleSpace: Container(
// // //             decoration: BoxDecoration(
// // //                 gradient: LinearGradient(
// // //                     colors: [Colors.blue.shade200, Colors.pink.shade300]
// // //                 )
// // //             ),
// // //           ),
// // //           title: Text(
// // //             appBarTitle(),
// // //             style: TextStyle(
// // //                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
// // //           ),
// // //           leading: _isBack ? IconButton(
// // //             icon: Icon(
// // //               Icons.arrow_back_ios,
// // //               color: Colors.black,
// // //             ),
// // //             onPressed: () {
// // //               onClickBackButton();
// // //             },
// // //           ) : Container(),
// // //           actions: [
// // //             _isCart ? IconButton(
// // //               icon: Icon(
// // //                 Icons.shopping_cart,
// // //                 color: Colors.black,
// // //               ),
// // //               onPressed: () {
// // //                 onClickCart();
// // //               },
// // //             ) : Container()
// // //           ],
// // //         ),
// // //         body: Container(
// // //           child: body(),
// // //           color: Colors.white,
// // //         ));
// // //   }
// // //
// // //   Widget body();
// // // }
// // //
// // //
// // //
// // // class HomeScreen extends BasePageScreen {
// // //   HomeScreen({required super.key});
// // //
// // //   @override
// // //   _HomeScreenState createState() => _HomeScreenState();
// // // }
// // // class _HomeScreenState extends BasePageScreenState<HomeScreen> with BaseScreen {
// // //   bool isButtonTapped = false;
// // //
// // //   @override
// // //   void initState() {
// // //     isBackButton(false);
// // //     super.initState();
// // //   }
// // //
// // //   // TO GIVE THE TITLE OF THE APP BAR
// // //   @override
// // //   String appBarTitle() {
// // //     return "Home";
// // //   }
// // //
// // //   @override
// // //   void isBackButton(bool isBack) {
// // //     super.isBackButton(isBack);
// // //   }
// // //
// // //   // THIS IS BACK BUTTON CLICK HANDLER
// // //   @override
// // //   void onClickBackButton() {
// // //     print("BACK BUTTON CLICKED FROM HOME");
// // //     Navigator.of(context).pop();
// // //   }
// // //
// // //   // THIS IS RIGHT BAR BUTTON CLICK HANDLER
// // //   @override
// // //   void onClickCart() {
// // //     print("CART BUTTON CLICKED");
// // //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartScreen()));
// // //   }
// // //
// // //   // THIS WILL RETURN THE BODY OF THE SCREEN
// // //   @override
// // //   Widget body() {
// // //     return Center(
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           Text("HOME SCREEN BODY"),
// // //           ElevatedButton(
// // //             onPressed: () {
// // //               if(!isButtonTapped) {
// // //                 setState(() {
// // //                   isButtonTapped = true;
// // //                 });
// // //               }
// // //             },
// // //             child: Text(isButtonTapped ? "BUTTON TAPPED" : "BUTTON NOT TAPPED"),
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // // }
// // //
// // //
// // // class CartScreen extends BasePageScreen {
// // //   CartScreen({Key? key}) : super(key: Key(""));
// // //
// // //
// // //
// // //
// // //   @override
// // //   _CartScreenState createState() => _CartScreenState();
// // // }
// // //
// // // class _CartScreenState extends BasePageScreenState<CartScreen> with BaseScreen {
// // //
// // //   @override
// // //   void initState() {
// // //     isCartButton(false);
// // //     super.initState();
// // //   }
// // //
// // //   @override
// // //   void isCartButton(bool isCart) {
// // //     super.isCartButton(isCart);
// // //   }
// // //
// // //   @override
// // //   String appBarTitle() {
// // //     return "Cart";
// // //   }
// // //
// // //   @override
// // //   Widget body() {
// // //     return Center(
// // //       child: Text("CART SCREEN BODY"),
// // //     );
// // //   }
// // //
// // //   @override
// // //   void onClickBackButton() {
// // //     print("BACK BUTTON CLICKED FROM CART");
// // //     Navigator.of(context).pop();
// // //   }
// // //
// // //   @override
// // //   void onClickCart() {
// // //     print("CART BUTTON CLICKED");
// // //   }
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // import '../../Model/ClassesModel.dart';
// //
// // abstract class ManagerDetailedItemBaseView extends StatefulWidget {
// //   ManagerDetailedItemBaseView({required Key key}) : super(key: key);
// // }
// //
// //
// //
// // abstract class ManagerDetailedItemBaseViewState<Page extends ManagerDetailedItemBaseView> extends State<Page> {
// //
// //   // bool _isBack = true;
// //   // bool _isCart = true;
// //
// //   String appBarTitle();
// //
// //   bool _isItemEmpty = true;
// //
// //   void setItemValue(bool isEmpty){
// //     _isItemEmpty=isEmpty;
// //     print("Set it false");
// //   }
// //
// //   // void onClickBackButton();
// //   //
// //   // void onClickCart();
// //
// //   // void isBackButton(bool isBack) {
// //   //   _isBack = isBack;
// //   // }
// //   //
// //   // void isCartButton(bool isCart) {
// //   //   _isCart = isCart;
// //   // }
// //
// // onClickAdd(Widget screen){
// //   Get.to(()=> screen);
// // }
// //
// //
// //
// // }
// //
// //
// //
// // mixin BaseScreen<Page extends ManagerDetailedItemBaseView> on ManagerDetailedItemBaseViewState<Page> {
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           flexibleSpace: Container(
// //             decoration: BoxDecoration(
// //                 gradient: LinearGradient(
// //                     colors: [Colors.blue.shade200, Colors.pink.shade300]
// //                 )
// //             ),
// //           ),
// //           title: Text(
// //             appBarTitle(),
// //             style: TextStyle(
// //                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           leading: IconButton(
// //             icon: Icon(
// //               Icons.arrow_back_ios,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {
// //               // onClickBackButton();
// //             },
// //           )
// //         ),
// //         body: Container(
// //           child: body(),
// //           color: Colors.white,
// //         ));
// //   }
// //   Widget body();
// // }
// //
// //
// //
// // class ManagerDetailedCourseView extends ManagerDetailedItemBaseView {
// //   ManagerDetailedCourseView({required super.key});
// //
// //   @override
// //   _ManagerDetailedCourseViewState createState() => _ManagerDetailedCourseViewState();
// // }
// // class _ManagerDetailedCourseViewState extends ManagerDetailedItemBaseViewState<ManagerDetailedCourseView> with BaseScreen {
// //   bool isButtonTapped = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   // TO GIVE THE TITLE OF THE APP BAR
// //   @override
// //   String appBarTitle() {
// //     return "Courses";
// //   }
// //
// //   // THIS WILL RETURN THE BODY OF THE SCREEN
// //   @override
// //   Widget body() {
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text("Course"),
// //           ElevatedButton(
// //             onPressed: () {
// //               if(!isButtonTapped) {
// //                 setState(() {
// //                   isButtonTapped = true;
// //                 });
// //               }
// //             },
// //             child: Text(isButtonTapped ? "BUTTON TAPPED" : "BUTTON NOT TAPPED"),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //
// // }
// //
// //
// // class ManagerDetailedClassView extends ManagerDetailedItemBaseView {
// //   ManagerDetailedClassView({Key? key, isEmptyPassed=true, classes}) : super(key: Key(""));
// //
// //   bool? isEmptyPassed;
// //   List<ClassModel>? classes;
// //
// //
// //   @override
// //   _ManagerDetailedClassViewState createState() => _ManagerDetailedClassViewState();
// // }
// //
// // class _ManagerDetailedClassViewState extends ManagerDetailedItemBaseViewState<ManagerDetailedClassView> with BaseScreen {
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     setItemValue(widget.isEmptyPassed!);
// //       print('in init');
// //     print(widget.isEmptyPassed);
// //
// //   }
// //
// //
// //   @override
// //   String appBarTitle() {
// //     return "Classes";
// //   }
// //
// //   @override
// //   Widget body() {
// //     return _isItemEmpty?Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //
// //         Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: Text("There are no classes created for this studio. Please create new class to see them here.",
// //           style: GoogleFonts.montserrat(fontSize: 18),
// //               textAlign: TextAlign.center,
// //           ),
// //
// //         ),
// //
// //         ElevatedButton(onPressed: (){},
// //             child: Text("Add new class"))
// //       ],
// //     ):
// //     Column(
// //       children: [
// //         Container(
// //           height: 700,
// //           child: ListView.builder(
// //             itemCount: widget.classes!.length,
// //             itemBuilder: (BuildContext context, int index) {
// //             return ListTile(
// //               title: Column(
// //                 children: [
// //                   Text(widget.classes![index].className),
// //                   Text(widget.classes![index].teacherName),
// //                   Text(widget.classes![index].price),
// //                   Text(widget.classes![index].type),
// //                   Text(widget.classes![index].level),
// //                   Text(widget.classes![index].duration),
// //                 ],
// //               ),
// //             );
// //           },),
// //         )
// //       ],
// //     )
// //     ;
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:white_lotus/Model/ClassesModel.dart';
//
// abstract class ManagerDetailedView extends StatelessWidget {
//   String title = 'Welcome';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Card(
//             color: Colors.deepPurpleAccent,
//             child: Column(
//               children: [
//                 Text("Displaying $title"),
//                 body ?? SizedBox(), // Use body if it's not null, otherwise use an empty SizedBox
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget? body;
// }
//
// class ManagerDetailedClassView extends ManagerDetailedView {
//   ManagerDetailedClassView(ClassModel classModel) // Use constructor parameter to initialize classModel
//       : classModel = classModel, // Initialize classModel in the constructor initializer list
//         super(); // Call the superclass constructor
//
//   final ClassModel classModel;
//
//   @override
//   Widget? body = SizedBox(height: 600,
//     child: ListView.builder(
//       itemCount: 1, // Assuming there is only one item in the list for detailed view
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Column(
//             children: [
//               Text("${super.classModel.teacherName}"),
//               // Add other Text widgets here for other attributes
//             ],
//           ),
//         );
//       },
//     ),
//   );
//
//   @override
//   String title = "Classes";
// }
//
