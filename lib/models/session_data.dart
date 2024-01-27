 class SessionData {
  final String origin;
  final String destination;

  final DateTime departureTime;
  late final DateTime departureArrivalTime;
  late int departTrainNo;
  late int departCoachID;
  late List<String> departseatNo;

  late final DateTime? returningTime;
  late final DateTime? returningArrivalTime;
  late int returnTrainNo;
  late int returnCoachID;
  late List<String> returnseatNo;

  late final String email;
  final int pax;

  SessionData(this.origin, this.destination, this.departureTime, this.returningTime, this.pax);
  
 }