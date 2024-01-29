import 'package:astralbooking/ui/trip_appbar.dart';
import 'package:astralbooking/widgets/calculate_fee.dart';
import "package:flutter/material.dart";

import '../models/session_data.dart';
import '../models/trip.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({super.key, required this.trip, required this.data});
  final Trip trip;
  final SessionData data;

  @override
  Widget build(BuildContext context){
    
    Widget returningCard = Container();

    double fee = calcFee(data.origin,data.destination);
    
    if(data.returningTime != null) {
      returningCard = TripCard(
            destA: data.destination,destB: data.origin,
            outDate: data.returningTime.toString(),
            arriveTime: data.departureArrivalTime.toString(),
            trainNo: data.returnTrainNo.toString(), coach: data.returnCoachID!,
            seat: data.returnseatNo,
            fee: fee);
    } else {
      returningCard = Container();
    }

    return TripScaffold(
      heading: "Booking Details",
      subtitle: "Name: ${data.name}",
      cornerText: "PAX ${data.pax}",//"${trip.pointA} to ${trip.pointB}",

      body: Column(
        children: [
          TripCard(
            destA: data.origin, destB: data.destination,
            outDate: data.departureTime.toString(),
            arriveTime: data.departureArrivalTime.toString(),
            trainNo: data.departTrainNo.toString(), coach: data.departCoachID!,
            seat: data.departseatNo,
            fee: fee),
          
          const SizedBox(height: 5,),

          returningCard,

          const SizedBox(height:5),

          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text("Total Fee: "),
                  Text((fee*2).toStringAsFixed(2))
                ],
              ),
              
            )
          ),
        ],
      )
    );
  }

}

class TripCard extends StatelessWidget {
  String destA, destB, outDate, arriveTime, trainNo, coach;
  List<int> seat;
  double fee;
  
  TripCard({super.key, required this.destA, required this.destB,
  required this.outDate, required this.arriveTime, required this.trainNo,
  required this.coach, required this.seat, required this.fee});

  @override
  Widget build(BuildContext context) {

  String listSeat = seat.join(', ');
    
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Text(destA),
              const Text(" to "),
              Text(destB)
              ],
            ),

          const Divider(),

          Text("Departing on: $outDate"),
          Text("Expected arrival: $arriveTime"),

          const SizedBox(height:5),

          Text("Train No. $trainNo"),
          Text("Coach $coach"),
          Text("Seat: $listSeat"),
          
          const SizedBox(height:3),
          Text("Fee: $fee"),
          ],
      )
    );
  }
}
