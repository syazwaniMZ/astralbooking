 class SessionData {
  final String origin;
  final String destination;

  late DateTime departureTime;
  late DateTime? departureArrivalTime;
  late String? departTrainNo = '';
  late String? departCoachID= '';
  late List<int> departseatNo = [];
  late double departFee;

  late DateTime? returningTime;
  late DateTime? returningArrivalTime;
  late String? returnTrainNo = '';
  late String? returnCoachID ='';
  late List<int> returnseatNo = [];
  late double returnFee;

  late final String name;
  final int pax;

  SessionData(this.origin, this.destination, this.departureTime, this.returningTime, this.pax);

  
 }
 