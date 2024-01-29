import 'package:astralbooking/models/session_data.dart';
import 'package:astralbooking/models/trip.dart';
import 'package:astralbooking/ui/trip_appbar.dart';
import 'package:flutter/material.dart';
import 'package:astralbooking/widgets/generate_time_interval.dart';

import '../const.dart';
import '../ui/tapable_button.dart';
import 'select_coach_page.dart';

// ignore: must_be_immutable
class SelectTrain extends StatelessWidget {
  SelectTrain({super.key, required this.data, required bool isReturnTrip, required this.trip}) : _isReturnTrip = isReturnTrip;
  final bool _isReturnTrip; //To check whether this widget is to book for returning trip
  SessionData data;
  Trip trip;
  

  @override
  Widget build(BuildContext context) {
    
    DateTime arrivalTime;
  
    //Hard coded the train schedule
    final List<DateTime> departureTimes = generateTimeIntervals(
    dateFormat.format(trip.bookingDate),"10:00", "17:00");

    List<String> trainList = List<String>.generate(departureTimes.length, (index) => "");

    //TO DO: REFACTOR THIS LARGE LIST GENERATE (IT'S TOO BIG)
    final List<Widget> widget = List.generate(departureTimes.length,(index) {
      IconData icon;
      
      arrivalTime = departureTimes[index].add(const Duration(hours: 3, minutes: 20));

      switch (index % 3) {
        case  0 :
          trainList[index] = "0420";
          icon = Icons.train_outlined;
          break;
        case  1 :
          trainList[index] = "3033";
          icon = Icons.train;
          break;
        default :
          trainList[index] = "9898";
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
                        Text('Train No. ${trainList[index]}')
                      ],
                  ),
                ),
              ),
              
              Container(
                padding: const EdgeInsets.all(20),
                child: TapableButton(
                  onTap: (){
                    String tempDate = '${dateFormat.format(trip.bookingDate)} ${hourminutesFormat.format(departureTimes[index])}';
                    trip.bookingDate = DateTime.parse(tempDate);
                    

                    assignTripInfo(trip, arrivalTime, trainList[index]);
                    
                    print('Booking date: ${trip.bookingDate} and ${trainList[index]}');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCoachPage(data: data, trip: trip,)));
                  },
                  child: const Icon(Icons.navigate_next_rounded)
                )
              )
            ] 
          ),
        )
      );
    });

    return TripScaffold(
      heading: "${trip.currently()} - Select time",
      subtitle: "${trip.pointA} to ${trip.pointB}",
      cornerText: "",

      body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget
            )
          )
        );
      })
    );
  }

  void assignTripInfo(Trip trip, DateTime arrivalTime, String trainNo) {
    if (_isReturnTrip) {
      data.returningTime = trip.bookingDate;
      data.returningArrivalTime = data.returningTime;
      data.returnTrainNo = trainNo;
    } else {
      data.departureTime = trip.bookingDate;
      data.departureArrivalTime = arrivalTime;
      data.departTrainNo = trainNo;
    }
  }
}

