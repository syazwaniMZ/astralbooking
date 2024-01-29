import 'package:astralbooking/widgets/seats.dart';
import 'package:flutter/material.dart';

import '../models/session_data.dart';
import '../ui/trip_appbar.dart';
import '../models/trip.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({super.key, required this.data, required this.trip});
  final Trip trip;
  final SessionData data;

  

  @override
  Widget build(BuildContext context) {

    String coachID;
    if(trip.isReturnTrip)
    {
      coachID = data.returnCoachID as String ;
    }  else {
      coachID = data.departCoachID as String;
    }

    return TripScaffold(
        heading: "Coach: $coachID",
        subtitle: "${trip.currently()} - Select seat",
        body: SeatWidget(data: data,trip: trip,),
        cornerText: "Pax ${data.pax}",
        );

  }
}