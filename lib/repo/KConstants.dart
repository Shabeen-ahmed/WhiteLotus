enum control_came_from{
  GeneralManager,
  Managers,
  Customers
}

// String ip ="http://192.168.1.180";
// String ip ="http://172.19.38.59";
// String ip ="http://172.20.46.21";
// String ip = "http://192.168.0.34";
String ip = "http://192.168.1.180";

String databaseName = "whitelotus";

void setIP(String IP){
  print(ip);
  print(IP);
  ip="http://$IP";
  print(ip);
}

enum Status
{
  SUCCESS,
  FAILURE
}

enum Availibility
{
  Free,
  Full
}

String bookingTypeToString(bookingType BookingType){
  String bookingtype;
  switch (BookingType){
    case bookingType.Course:
      bookingtype='Course';
      break;
    case bookingType.Class:
      bookingtype='Class';
    case bookingType.Workshop:
      bookingtype='Workshop';
    case bookingType.Retreat:
      bookingtype='Retreat';
    default:
      bookingtype='';
  }
  return bookingtype;
}


enum bookingType {
  Retreat,
  Workshop,
  Course,
  Class
}
