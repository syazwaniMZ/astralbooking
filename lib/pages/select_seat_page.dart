import 'package:flutter/material.dart';

import '../const.dart';
import '../models/session_data.dart';
import '../widgets/select_seat.dart';
import '../widgets/trip.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({super.key, required this.data, required this.trip});
  final Trip trip;
  final SessionData data;

  @override
  Widget build(BuildContext context) {

    // final List<Widget> coachWidget = List.generate(coachMAX, (index){
    //   return CoachShape(
    //     coachID: alphabets[index],
    //     i: index,
    //     onTapCoach: (){
          
    //       if (trip.isReturnTrip){
    //         data.returnCoachID = alphabets[index];
    //       }
    //       else {
    //         data.departCoachID = alphabets[index];
    //       }

    //       print("${alphabets[index]} and Departing Coach ID: ${data.departCoachID}");
    //       //Navigator.push(context, MaterialPageRoute());
    //       },
    //     );
    // });
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text("${trip.pointA} to ${trip.pointB}"),
              ),

              const SizedBox(
                width: 70,
                child: Text("Select seat"),
              )
            ],
          ),
        ),

        body: SeatWidget(data: data, trip: trip)
    );

  }
}