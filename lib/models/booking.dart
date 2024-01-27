class Booking {
  int reservationID;
  int routeID;
  DateTime date;
  DateTime arrival;
  int trainNum;
  int coachID;
  List<String> seatNo;
  double fee;
  String email;
  Booking(this.reservationID, this.routeID, this.date , this.arrival, this.trainNum, this.coachID, this.seatNo, this.fee, this.email);
}