import 'package:astralbooking/models/session_data.dart';

class Trip {
  late bool isReturnTrip;
  late DateTime bookingDate;
  String pointA = 'A', pointB = 'B';
  
  Trip(bool isReturning, SessionData data)
  {
    if(isReturning){
      bookingDate = data.returningTime!;
      pointA = data.destination;
      pointB = data.origin;
    }
    else{
      bookingDate = data.departureTime;
      pointA = data.origin;
      pointB = data.destination;
    }
    isReturnTrip = isReturning;
  }
}