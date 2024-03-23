import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:white_lotus/Model/ClassesModel.dart';
import 'package:white_lotus/Model/CourseModel.dart';
import 'package:white_lotus/Model/DetailedCourseModel.dart';
import 'package:white_lotus/Model/WorkshopModel.dart';
import 'package:white_lotus/Model/StudiosModel.dart';
import 'package:white_lotus/View/InitialUI.dart';
import 'package:flutter/material.dart';

import '../Model/RetreatModel.dart';
import 'KConstants.dart';


class ApiService {

  fetchAllStudios() async {
    try {
      var url = Uri.parse("$ip/$databaseName/fetchAllStudios.php");
      final response = await http.post(url);

      // var uri = Uri.https('$ip/$databaseName/fetchAllStudios.php');
      // var response = await client.get(uri);
      // final response = await http.get(Uri.http('$ip/$databaseName/fetchAllStudios.php'));

      print("response");
      print(response);
      print(response.body);

      if (response.statusCode == 200)  {
        // var data = jsonDecode(response.body);
        // return response.body;
        print("GOT RESPONSEEEEEEE");
        print(response.body);
        List<StudioModel> studioClasses = studioClassFromJson(response.body);
        return studioClasses;
      } else {
        Get.back();
        Get.defaultDialog(
          title: "Something went wrong",
          content: Text('Request failed with status: ${response.statusCode}.')
        );
        print(response);
        print(response.body);
        print('Request failed with status: ${response.statusCode}.');
        print(response.headers);
        print(response.reasonPhrase);
      }
      print("responseresponseresponse");
      print(response);
      print(response.body);
    } catch (e) {
      // log(e.toString());
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());

    }
  }

  fetchCourses(int studioID) async {
    print("in the new FUNction");

    try {
      var url = Uri.parse("$ip/$databaseName/fetchCourses.php");

      final response = await http.post(
        url,
        body: {
          "studioID": studioID.toString(),
        },
      );
      print("===============response");
      print(response);
      print(response.body);
      if (response.statusCode == 200)  {
        List<CourseModel> courses = courseModelFromJson(response.body);
        return courses;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        // print(response);
        // print(response.body);
        print('Request failed with status: ${response.statusCode}.');
        // print(response.headers);
        // print(response.reasonPhrase);
      }
      print("responseresponseresponse");
      // print(response);
      // print(response.body);
    } catch (e) {
      // log(e.toString());
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());

    }
  }

  fetchAllClasses(int studioID) async {
    print("in the new FUNction");

    try {
      var url = Uri.parse("$ip/$databaseName/fetchAllClasses.php");

      final response = await http.post(
        url,
        body: {
          "studioID": studioID.toString(),
        },
      );
      print("===============response");
      print(response);
      print(response.body);
      if (response.statusCode == 200)  {
        List<ClassModel> classes = classModelFromJson(response.body);
        return classes;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        // print(response);
        // print(response.body);
        print('Request failed with status: ${response.statusCode}.');
        // print(response.headers);
        // print(response.reasonPhrase);
      }
      print("responseresponseresponse");
      // print(response);
      // print(response.body);
    } catch (e) {
      // log(e.toString());
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());

    }

  }

  fetchWorkshops(int studioID) async {
    try {
      var url = Uri.parse("$ip/$databaseName/fetchWorkshop.php");

      final response = await http.post(
        url,
        body: {
          "studioID": studioID.toString(),
        },
      );
      print("===============response");
      print(response);
      print(response.body);
      if (response.statusCode == 200)  {
        List<WorkshopModel> workshops = workshopModelFromJson(response.body);
        return workshops;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        print('Request failed with status: ${response.statusCode}.');
      }
      print("responseresponseresponse");
    } catch (e) {
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());

    }

  }


  fetchRetreats(int studioID) async {
    try {
      var url = Uri.parse("$ip/$databaseName/fetchRetreat.php");

      final response = await http.post(
        url,
        body: {
          "studioID": studioID.toString(),
        },
      );
      print("===============response");
      print(response);
      print(response.body);
      if (response.statusCode == 200)  {
        List<RetreatModel> retreats = retreatModelFromJson(response.body);
        return retreats;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        print('Request failed with status: ${response.statusCode}.');
      }
      print("responseresponseresponse");
    } catch (e) {
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());

    }

  }

  addNewClass(ClassModel classToAdd) async {
      try {
        var url = Uri.parse("$ip/$databaseName/addNewClass.php");

        final response = await http.post(
          url,
          body: {
            "ClassName": classToAdd.className,
            "Type" : classToAdd.type,
            "Level" : classToAdd.level,
            "Capacity" : classToAdd.capacity,
            "Price" : classToAdd.price,
            "Duration" : classToAdd.duration,
            "Schedule" : classToAdd.schedule,
            "CourseID" : classToAdd.courseId,
            "TeacherID" : classToAdd.teacherId,

          },
        );

        print("response");
        print(response);
        print(response.body);
        if (response.statusCode == 200) {
          if(response.body=="SUCCESS"){
            return Status.SUCCESS;
          }
          else {
            return Status.FAILURE;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content: Text('Request failed with status: ${response.statusCode}.')
          );
          return Status.FAILURE;
        }
      } catch (e) {
        log(e.toString());
      }


  }

  addNewCourse(CourseModel courseToAdd) async {
    try {
      print('inADDNEW');
      var url = Uri.parse("$ip/$databaseName/addNewCourse.php");
      // String toPost = courseToAdd.toJson();
      String encodedData = courseModelToJson(courseToAdd);
      print('encoded data');
      print(encodedData);
      final response = await http.post(
        url,
        body: {
          "CourseName": courseToAdd.courseName.toString(),
          "StartDate":courseToAdd.startDate.toString(),
          "EndDate":courseToAdd.endDate.toString(),
          "Price":courseToAdd.price.toString(),
          "Discount":courseToAdd.discount.toString(),
          "StudioID":courseToAdd.studioId.toString(),
          "TeacherID":courseToAdd.teacherId.toString()}
        );

      print("response");
      print(response);
      print(response.body);
      print(response.statusCode);
      print(response.headers);
      print(response.reasonPhrase);
      if (response.statusCode == 200) {
        print('status code 200');
        if(response.body=="SUCCESS"){
          print('response body success');
          return Status.SUCCESS;
        }
        else {
          print('response body failure');
          return Status.FAILURE;
        }
        // var data = jsonDecode(response.body);
        // return response.body;
      } else {
        // Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  addNewWorkshop(WorkshopModel workshopToAdd) async {
    try {
      var url = Uri.parse("$ip/$databaseName/addNewWorkshop.php");

      final response = await http.post(
        url,
        body: {
          "WorkshopName": workshopToAdd.workshopName,
          "Theme" : workshopToAdd.theme,
          "Duration" : workshopToAdd.duration,
          "Schedule" : workshopToAdd.schedule,
          "Price" : workshopToAdd.price,
          "StudioID" : workshopToAdd.studioId,
          "TeacherID" : workshopToAdd.teacherId,
        },
      );

      if (response.statusCode == 200) {
        if(response.body.removeAllWhitespace=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
        // var data = jsonDecode(response.body);
        // return response.body;
      } else {
        // Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }


  }

  addNewRetreat(RetreatModel retreatToAdd) async {
    try {
      var url = Uri.parse("$ip/$databaseName/addNewRetreat.php");

      final response = await http.post(
        url,
        body: {
          "RetreatName": retreatToAdd.retreatName,
          "Meal" : retreatToAdd.meal,
          "Activity" : retreatToAdd.activity,
          "Price" : retreatToAdd.price,
          "WorkshopID" : retreatToAdd.workshopId,
        },
      );
      print(response);
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if(response.body.removeAllWhitespace=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
        // var data = jsonDecode(response.body);
        // return response.body;
      } else {
        // Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }


  }

  deleteAClass(String? classId) async {
    try {
      var url = Uri.parse("$ip/$databaseName/deleteAClass.php");

      final response = await http.post(
        url,
        body: {
          "ClassID" : classId.toString(),

        },
      );

      print("response");
      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        if(response.body=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
        // var data = jsonDecode(response.body);
        // return response.body;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  deleteACourse(String? courseID) async {
    try {
      var url = Uri.parse("$ip/$databaseName/deleteACourse.php");

      final response = await http.post(
        url,
        body: {
          "CourseID" : courseID.toString(),
        },
      );

      print("response");
      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        if(response.body=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
        // var data = jsonDecode(response.body);
        // return response.body;
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  bookASession(
      {String? bookingItemID, required bookingType BookingType, String? userID}) async {
    try {
      var url = Uri.parse("$ip/$databaseName/bookASession.php");

      String bookingtype = bookingTypeToString(BookingType);


      if(bookingtype!=''){
        final response = await http.post(
          url,
          body: {
            "ClientID": userID.toString(),
            "bookingType": bookingtype.toString(),
            "bookingItemID": bookingItemID.toString(),
          },
        );

        print("response");
        print(response);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Map<String,dynamic> decodedResponse = jsonDecode(response.body);
          if (decodedResponse['status'] == "SUCCESS") {
            print('yep success');
            return decodedResponse['price'];
          } else if(response.body == "Full") {
            return Availibility.Full;
          }
          else
          {
            return Status.FAILURE;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content: Text('Request failed with status: ${response.statusCode}.')
          );
          return Status.FAILURE;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  waitingList(
      {String? waitingItemID, required bookingType waitingType, String? userID}) async {
    try {
      var url = Uri.parse("$ip/$databaseName/addToWaitingList.php");

      String waitingtype = bookingTypeToString(waitingType);
      print("Info");
      print(userID.toString());
      print(waitingtype.toString());
      print(waitingItemID.toString());

      if(waitingtype!=''){
        final response = await http.post(
          url,
          body: {
            "ClientID": userID.toString(),
            "waitingType": waitingtype.toString(),
            "waitingItemID": waitingItemID.toString(),
          },
        );

        print("response");
        print(response);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Map<String,dynamic> decodedResponse = jsonDecode(response.body);
          if (decodedResponse['status'] == "SUCCESS") {
            print('yep success');
            return decodedResponse['price'];
          }
          else
          {
            return Status.FAILURE;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content: Text('Request failed with status: ${response.statusCode}.')
          );
          return Status.FAILURE;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  bookACourse(
      {String? CourseID, String? userID}) async {
    try {
      var url = Uri.parse("$ip/$databaseName/bookACourse.php");

        final response = await http.post(
          url,
          body: {
            "ClientID": userID.toString(),
            "CourseID": CourseID.toString(),
          },
        );

        print("response");
        print(response);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          if(response.body!='Full'){
            Map<String,dynamic> decodedResponse = jsonDecode(response.body);
            if (decodedResponse['status'] == "SUCCESS") {
              print('yep success');
              return decodedResponse['price'];
            }
            else{
              return Status.FAILURE;
            }
          }
          else if(response.body=="Full") {
            return Availibility.Full;
          } else
         {
            return Status.FAILURE;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content:
              Text('Request failed with status: ${response.statusCode}.'));
          return Status.FAILURE;
        }

    } catch (e) {
      log(e.toString());
    }
  }



  checkAvailibilityClass(
      {String? bookingItemID, required bookingType BookingType})
  async {
    try {
      var url = Uri.parse("$ip/$databaseName/checkAvailibilityClass.php");

      String bookingtype = bookingTypeToString(BookingType);


      if(bookingtype!=''){
        final response = await http.post(
          url,
          body: {
            "bookingType": bookingtype.toString(),
            "bookingItemID": bookingItemID.toString(),
          },
        );

        print("response");
        print(response);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          if (response.body == "true") {
            return Availibility.Free;
          } else {
            return Availibility.Full;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content:
              Text('Request failed with status: ${response.statusCode}.'));
          return Status.FAILURE;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  checkAvailibilityWorkshop(
      {String? bookingItemID, required bookingType BookingType})
  async {
    try {
      var url = Uri.parse("$ip/$databaseName/checkAvailibilityWorkshop.php");

      String bookingtype = bookingTypeToString(BookingType);


      if(bookingtype!=''){
        final response = await http.post(
          url,
          body: {
            "bookingType": bookingtype.toString(),
            "bookingItemID": bookingItemID.toString(),
          },
        );

        print("response");
        print(response);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          if (response.body == "true") {
            return Availibility.Free;
          } else {
            return Availibility.Full;
          }
          // var data = jsonDecode(response.body);
          // return response.body;
        } else {
          Get.back();
          Get.defaultDialog(
              title: "Something went wrong",
              content:
              Text('Request failed with status: ${response.statusCode}.'));
          return Status.FAILURE;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }


  // checkAvailibilityClass(String? courseID) async {
  //   try {
  //     var url = Uri.parse("$ip/$databaseName/checkAvailibilityClass.php");
  //
  //     final response = await http.post(
  //       url,
  //       body: {
  //         "CourseID" : courseID.toString(),
  //         "ClientID" : userID.toString(),
  //       },
  //     );
  //
  //     print("response");
  //     print(response);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       if(response.body=="SUCCESS"){
  //         return Status.SUCCESS;
  //       }
  //       else {
  //         return Status.FAILURE;
  //       }
  //       // var data = jsonDecode(response.body);
  //       // return response.body;
  //     } else {
  //       Get.back();
  //       Get.defaultDialog(
  //           title: "Something went wrong",
  //           content: Text('Request failed with status: ${response.statusCode}.')
  //       );
  //       return Status.FAILURE;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }



  deleteAWorkshop(String? workshopID) async {
    try {
      var url = Uri.parse("$ip/$databaseName/deleteAWorkshop.php");

      final response = await http.post(
        url,
        body: {
          "WorkshopID" : workshopID.toString(),
        },
      );

      print("response");
      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        if(response.body=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  deleteARetreat(String? RetreatID) async {
    try {
      var url = Uri.parse("$ip/$databaseName/deleteARetreat.php");

      final response = await http.post(
        url,
        body: {
          "RetreatID" : RetreatID.toString(),
        },
      );

      print("response");
      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        if(response.body=="SUCCESS"){
          return Status.SUCCESS;
        }
        else {
          return Status.FAILURE;
        }
      } else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        return Status.FAILURE;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  fetchCourseDetailed({String? courseID})async {
    try {
      print('sending request for $courseID');
      var url = Uri.parse("$ip/$databaseName/fetchCourseDetailed.php");

      final response = await http.post(
        url,
        body: {
          "CourseID": courseID.toString(),
        },
      );
      print("===============response");
      print(response);
      print(response.body);
      if (response.statusCode == 200 && response.body!='empty') {
        List<DetailedCourseModel> detailedCourses = detailedCourseModelFromJson(response.body);
        return detailedCourses;
      }
      else if (response.body=='empty'){
        return false;
      }
      else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        print('Request failed with status: ${response.statusCode}.');
      }
      print("responseresponseresponse");
    } catch (e) {
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());
    }
  }

  login(String emailID)async {
    try {
      var url = Uri.parse("$ip/$databaseName/tryLogin.php");

      final response = await http.post(
        url,
        body: {
          "emailID": emailID.toString(),
        },
      );
      print('repsonse got');
      print(response.body);

      if (response.statusCode == 200) {
        if(response.body!="FAILURE"){
            Map<String,dynamic> decodedResponse = jsonDecode(response.body);
            if (decodedResponse['status'] == "SUCCESS") {
              print('yep success');
              return decodedResponse['userID'];
            }
            else{
              return Status.FAILURE;
            }
        }
        else{
          return Status.FAILURE;
        }
      }
      else {
        Get.back();
        Get.defaultDialog(
            title: "Something went wrong",
            content: Text('Request failed with status: ${response.statusCode}.')
        );
        print('Request failed with status: ${response.statusCode}.');
      }
      print("responseresponseresponse");
    } catch (e) {
      print("EXCEPTION CAUGHTTTT");
      print(e.toString());
    }
  }


}
