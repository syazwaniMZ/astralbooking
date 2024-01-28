import 'package:astralbooking/const.dart';
import 'package:astralbooking/models/session_data.dart';
import 'package:flutter/material.dart';

import 'trip.dart';

Color getColor(bool isAvailable){
  if (isAvailable) {
    return Colors.lightBlue;
  } else {
    return Colors.redAccent.shade400;
  }
}

class SeatWidget extends StatefulWidget {
  SeatWidget({super.key, required this.data, required this.trip});
  
  SessionData data;
  Trip trip;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {

  final List<int> skipIndex = [2, 7, 12, 17, 22];


  @override
  Widget build(BuildContext context) {

    Map <int, bool> seatAvailability = { 1 : true} ;

    

    for (int i=1; i<seatMAX+1;i++)
    {
      seatAvailability[i] = true;
    }

    seatAvailability[21] = false;
    
    int seatCounter = 1;

    List<Widget> seat = List<Widget>.generate(seatMAX+5, (index) {

      //If index reach the skipIndex, no seat number will be assigned
      if (skipIndex.contains(index)) {
        return const SizedBox(
          width: 20,
          height: 30,
        );
      } else {

        Seat seatWidget = Seat(seatNo: seatCounter, isAvailable: seatAvailability[seatCounter]?? false);

        seatCounter++;
        return seatWidget;
      }
    });

    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisCount: 5,
      children: seat,
      );
  }
}

class Seat extends StatefulWidget {
  final int seatNo;
  final bool isAvailable;

  const Seat({super.key, required this.seatNo, required this.isAvailable});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(widget.seatNo.toString());
        print(widget.isAvailable);
      },
      child:Icon(
        Icons.chair,
        color: getColor(widget.isAvailable),
        size: 60),
    );
  }
}