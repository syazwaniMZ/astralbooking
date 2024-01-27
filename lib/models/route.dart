import 'location.dart';

class Route{
  late String origin;
  late String destination;
  late double fee;
  late int routeID;
  late DateTime arrivalTime;

  Route(this.origin, this.destination, this.fee, this.routeID, this.arrivalTime);
}