import 'dart:math';

import 'package:astralbooking/const.dart';
import 'package:astralbooking/models/session_data.dart';
import 'package:astralbooking/pages/confirmed_booking_page.dart';
import 'package:astralbooking/pages/select_train_page.dart';
import 'package:astralbooking/widgets/calculate_fee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



import '../models/trip.dart';

// FirebaseDatabase database = FirebaseDatabase.instance;
// DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
//var db = FirebaseFirestore.instance;

class SeatWidget extends StatefulWidget {

  SeatWidget({super.key, required this.data, required this.trip});
  
  SessionData data;
  Trip trip;
  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {

  late String routeCode;

  String seatChosen = '';
  final List<int> skipIndex = [2, 7, 12, 17, 22];

    Map <int, bool> seatAvailability = { 1 : true} ;
    late double perSeat;
    late double totalTripFee;

    
    late String _routeCode;
    late String time;

    

  late var ref;


  @override
  void initState() {
    super.initState();

    //FORMATTING THE TRIP DETAILS TO READ DATABASE
    time = widget.trip.isReturnTrip
    ? docFormat.format(widget.data.returningTime as DateTime)
    : docFormat.format(widget.data.departureTime);

    ref = db.collection("trip").doc('$routeCode.$time');

    perSeat = calcFee(widget.data.origin, widget.data.destination);
    routeCode = destToID[widget.trip.pointA] + destToID[widget.trip.pointB];

    perSeat = perSeat*widget.data.pax;
  }

  late final Stream<QuerySnapshot> _tripStream =
    FirebaseFirestore.instance.collection('users').snapshots();




  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    

    // if (widget.trip.isReturnTrip){

    //   time = docFormat.format(widget.data.returningTime as DateTime);
    // } else {
    //   time = docFormat.format(widget.data.departureTime);
    // }

    




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

        //TO DO QUERY HERE

        Seat seatWidget = Seat(seatNum: seatCounter,
          isAvailable: seatAvailability[seatCounter]?? false,
          data: widget.data,
          trip: widget.trip,);

        seatCounter++;
        return seatWidget;
      }
    });

    return Center(
      child: Column(
        children: [
          NotificationListener<ScanDataChanged>(
            onNotification: (n) {
                setState(() {
                widget.data = n.data;
                widget.trip = n.trip;
                if (widget.trip.isReturnTrip) {
                  seatChosen = widget.data.returnseatNo.join(',');
                } else {
                  seatChosen = widget.data.departseatNo.join(',');
                }
              });
              return true;
            },
            child: SizedBox(
              height:400,
              width:300,
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisCount: 5,
                children: seat,
                ),
            ),
          ),
      
          const SizedBox(height: 10),
      
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Fee per seat: $perSeat"),    
                  Text("Total Fee: ${totalTripFee.toStringAsFixed(2)}"),
                  Text("Your seat number: $seatChosen")            
                ],
              ),
              
            )
          ),
      
          GestureDetector(
            onTap: () {
              //String timecheck = widget.data.returningTime.toString() ?? "Is null";
              //print (" Time check $timecheck");
 
              if(widget.data.returningTime != null) {
                setState(() {
                  widget.trip = Trip(true, widget.data);
                });
                if(widget.data.returnseatNo.length == widget.data.pax){
                  //print ("Should be in the confirm booking");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmBooking(data: widget.data, trip: widget.trip)));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectTrain(data: widget.data, trip: widget.trip, isReturnTrip: true)));
                }
              } 
              else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmBooking(data: widget.data, trip: widget.trip)));
              }
            },
            child: const Card(
              color: Colors.deepPurple,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Confirm Booking", style: TextStyle(
                  color: Colors.white
                ),),
              )
            ),
          ),
      
        ]
      ),
    );
  }

  
}

class Seat extends StatefulWidget {
  int seatNum;
  bool isAvailable;
  SessionData data;
  Trip trip;

  Seat({super.key, required this.seatNum, required this.isAvailable, required this.data, required this.trip});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  late SeatIcon seat = SeatIcon(isOK: widget.isAvailable);
  
  @override
  Widget build(BuildContext context) {
    
    bool seatOK = widget.isAvailable;

    return GestureDetector(
      onTap: (){

        Random r = Random();// For testing only to simulate query because the Realtime Database is down
        bool randomResult = r.nextDouble() <= 0.7;
        
        //TO DO QUERY 
        seatOK = randomResult;

        if (seatOK == false)
        {
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This seat is already taken')));
          setState(() {
            widget.isAvailable = false;
          });
        }
        else if (isMaxPax() == false){
          if(widget.trip.isReturnTrip)
          {
            if (widget.data.returnseatNo.contains(widget.seatNum)) {
              setState(() {
                seatOK = true;
                widget.data.returnseatNo.remove(widget.seatNum);
              });
              //Query
            }
              setState(() {
                widget.data.returnseatNo.add(widget.seatNum);
                seatOK = false;
              });

          } else { 
            if (widget.data.departseatNo.contains(widget.seatNum))
            {
                setState(() {
                seatOK = true;
                widget.data.departseatNo.remove(widget.seatNum);
              });
              //Query
            } else {
                setState(() {
                  widget.data.departseatNo.add(widget.seatNum);
                  seatOK = false;
                });
            }
          }
        }
        
        if (isMaxPax()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have reached max limit.')));
        }

        print("Seat No: ${widget.seatNum} is ${widget.isAvailable}");

        setState(() {
          print ("$seatOK and the user seat list are: ${widget.data.departseatNo}");
        });
        //Passing new data and trip info to parent
        ScanDataChanged(widget.data, widget.trip).dispatch(context);

        setState(() {
          seat = SeatIcon(isOK: seatOK);
        });

      },
      child: seat
    );
  }

  //Check if currently hitting the maximum passenger in relation to which trip
  bool isMaxPax()
  {
    if(widget.trip.isReturnTrip) {
      return widget.data.returnseatNo.length == widget.data.pax;
    } else {
      return widget.data.departseatNo.length == widget.data.pax;
    }
  }

}

class ScanDataChanged extends Notification {
  final SessionData data;
  final Trip trip;
  ScanDataChanged(this.data, this.trip);
}

class SeatIcon extends StatelessWidget {
  const SeatIcon({super.key, required this.isOK});
  final bool isOK;
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.chair,
          color: isOK ? Colors.lightBlue : Colors.redAccent.shade400,
          size: 40);
  }
}

