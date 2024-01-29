import 'package:astralbooking/pages/select_seat_page.dart';
import 'package:astralbooking/ui/trip_appbar.dart';
import 'package:astralbooking/widgets/coach_shape.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../models/session_data.dart';
import '../models/trip.dart';

// ignore: must_be_immutable
class SelectCoachPage extends StatelessWidget {
  SelectCoachPage({super.key, required this.data, required this.trip});
  Trip trip;
  SessionData data;
  @override
  Widget build(BuildContext context) {

    List<String> alphabets = GenerateAlphabets();

    final List<Widget> coachWidget = List.generate(coachMAX, (index){
      return CoachShape(
        coachID: alphabets[index],
        i: index,

        onTapCoach: (){
          
          if (trip.isReturnTrip){
            data.returnCoachID = alphabets[index];
          }
          else {
            data.departCoachID = alphabets[index];
          }

          //print("Departing Coach ID: ${alphabets[index]}");
          
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectSeatPage(data: data, trip: trip)));

          },
        );
    });
    
    return TripScaffold(
      heading: "${trip.pointA} to ${trip.pointB}",
      subtitle: "${trip.currently()} - Select Coach",
      cornerText: "",

      body: LayoutBuilder(builder: (context, constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints( minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: coachWidget
              )
            )
            
          );
        })

    );

  }
}