import 'location.dart';

class Route{
  late Location origin;
  late Location destination;
  late double fee;
  late int routeID;

  Route(this.origin, this.destination, this.fee, this.routeID);
}