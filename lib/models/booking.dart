import 'package:flutter/material.dart';
import 'package:practice_flutter_project/models/bus.dart';

class Booking {
  Route route;
  int reservation_id;
  int departure_id;
  DateTime date;
  Bus busID;
  int coachID;
  int seatNo;

  Booking(this.route,this.reservation_id, this.date, this.departure_id, this.busID, this.coachID, this.seatNo);
}