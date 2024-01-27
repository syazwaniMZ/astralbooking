import 'package:astralbooking/const.dart';
import 'package:astralbooking/models/session_data.dart';
import 'package:flutter/material.dart';

import 'trip.dart';

Color getColor(bool isUnavailable){
  if (isUnavailable) {
    return Colors.redAccent.shade400;
  } else {
    return Colors.lightBlue;
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
  Map <int, bool> seatAvailability = { 1 : true} ;

  @override
  Widget build(BuildContext context) {

    //If index reach the skipIndex, no seat number will be assigned
    
    

    for (int i=1; i<seatMAX+1;i++)
    {
      setState(() {
      seatAvailability[i] = true;  
      });
    }

    seatAvailability[21] = false;
    
    int seatCounter = 1;

    List<Widget> seat = List<Widget>.generate(seatMAX+5, (index) {
      if (skipIndex.contains(index))
      return SizedBox(
        width: 20,
        height: 30,
      );
      
      else {
        print("Displaying chair: $seatCounter is seatAvailability[seatCounter]");
        GestureDetector chairWidget = GestureDetector(
          onTap: (){
            print("Current seat Number: $seatCounter is ${seatAvailability[seatCounter]}");
          },
          child : Container(
          child: Icon(
            Icons.chair,
            color: getColor(seatAvailability[seatCounter]!),
            size: 60),
          )
        );

        print(seatCounter++);
        
        return chairWidget;
      }
    });

    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisCount: 5,
      children: seat,
      );
  }
}



