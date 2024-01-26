import 'package:flutter/material.dart';
import 'package:astralbooking/models/bus.dart';

class Booking {
  int routeID;
  int reservation_id;
  int departure_id;
  DateTime date;
  int trainNum;
  int coachID;
  int seatNo;
  double fee;

  Booking(this.routeID,this.reservation_id, this.departure_id, this.date , this.trainNum, this.coachID, this.seatNo, this.fee);
}