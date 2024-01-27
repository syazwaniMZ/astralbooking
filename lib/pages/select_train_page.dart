import 'package:astralbooking/models/session_data.dart';
import 'package:astralbooking/widgets/trip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:astralbooking/widgets/generate_time_interval.dart';

import '../const.dart';
import '../ui/tapable_button.dart';
import 'select_coach_page.dart';

class SelectTrain extends StatelessWidget {
  const SelectTrain({super.key, required this.data, required this.isReturnTrip});

  final bool isReturnTrip; //To check whether this widget is to book for returning trip
  final SessionData data;
  

  @override
  Widget build(BuildContext context) {

    Trip trip = Trip(isReturnTrip, data);
  

    final List<DateTime> departureTimes = generateTimeIntervals(
    dateFormat.format(trip.bookingDate),"10:00", "17:00");

    //Function to generate train number
    final List<Widget> widget = List.generate(departureTimes.length,(index) {
      String trainNo;
      IconData icon;
      

      DateTime arrivalTime = departureTimes[index].add(const Duration(hours: 3, minutes: 20));

      switch (index % 3) {
        case  0 :
          trainNo = "0420";
          icon = Icons.train_outlined;
          break;
        case  1 :
          trainNo = "3033";
          icon = Icons.train;
          break;
        default :
          trainNo = "9898";
          icon = Icons.directions_train;
          break;
      }
      
      return Card(
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Icon(icon, color: Colors.black,),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Departure Time: ${hourminutesFormat.format(departureTimes[index])}'),
                        Text('Expected Arrival Time: ${hourminutesFormat.format(arrivalTime)}'),
                        Text('Train No. $trainNo')
                      ],
                  ),
                ),
              ),
              
              Container(
                padding: const EdgeInsets.all(20),
                child: TapableButton(
                  onTap: (){
                    String tempDate = dateFormat.format(trip.bookingDate) + hourminutesFormat.format(departureTimes[index]);
                    trip.bookingDate = DateTime.parse(tempDate);
                    if (isReturnTrip) {
                      data.returningTime = trip.bookingDate;
                    } else {
                      data.departureTime = trip.bookingDate;
                    }


                    print('Booking date: ${trip.bookingDate}');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCoachPage(data: data,)));
                  },
                  child: const Icon(Icons.navigate_next_rounded)
                )
              )
            ] 
          ),
        )
      );
    });

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

              SizedBox(
                width: 70,
                child: Text(
                  barDateFormat.format(trip.bookingDate),
                  ),
              )
            ],
          ),
        ),

      body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget
                )
            )
          );
        }
      )
    );
  }
}

