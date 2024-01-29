import 'dart:core';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:astralbooking/ui/tapable_button.dart';
import '../models/session_data.dart';
import '../pages/select_train_page.dart';
import '/ui/roundedRectangle.dart';
import '../models/trip.dart';

class SearchTrain extends StatefulWidget {
  const SearchTrain({super.key, required this.name});
  final String name;

  @override
  State<SearchTrain> createState() => _SearchTrainState();
}

class _SearchTrainState extends State<SearchTrain> {

  late String _origin='';
  late String _destination='';
  late int _pax =1;
  late DateTime _departure = DateTime.now();
  DateTime? _returnTime;
 
  DateTime selectedDate = DateTime.now();

  final _textPaxController = TextEditingController(text: '1');

  late String _returnDateText = '';

  late DateFormat dateFormat = DateFormat("yMMMd");

  void _selectDate(BuildContext context, bool isReturnTrip) async {
    final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 130)),
    helpText: 'Select date',
    );

    if (picked != null) 
    {
      setState(() {
        //_dateController.text = picked.toString();
        if (isReturnTrip)
        {
          _returnTime = picked;
          _returnDateText = dateFormat.format(_returnTime as DateTime);
        }
        else
        {
          _departure = picked;
          // TO DO: Set conditions that _returnTime must be after 
        }
      });
    }
  }
  
  

  @override
  Widget build(BuildContext context) {
    
  

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Train Origin 
            RoundedRect(
              child: DropdownMenu(
                width: 250,
                hintText: 'Please choose a location',
                label: const Text('Origin'),
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value:'Andromeda', label: 'Andromeda'),
                  DropdownMenuEntry(value:'Milky Way', label: 'Milky Way'),
                  DropdownMenuEntry(value:'Whirpool', label: 'Whirpool'),
                ],
                onSelected: (String? newOrigin) {
                  setState(() {_origin = newOrigin!;});
                },
              )
            ),
            
            // Train Destination
            RoundedRect(
              child: DropdownMenu(
                width: 250,
                hintText: 'Please choose a location',
                label: const Text('Destination'),
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value:'Andromeda', label: 'Andromeda'),
                  DropdownMenuEntry(value:'Milky Way', label: 'Milky Way'),
                  DropdownMenuEntry(value:'Whirpool', label: 'Whirpool'),
                ],
                onSelected: (String? newDestination) {
                  setState(() {_destination = newDestination!;});
                },
              )
            ),
            
            
            // Departure Time
            RoundedRect(
              child: MaterialButton(
                onPressed: () {
                  _selectDate(context, false);
                },
                child: SizedBox(
                  width: 200,
                  child: Text('Departure Time: ${dateFormat.format(_departure)}'),
                ),
              )
            ),

            RoundedRect(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  MaterialButton(
                    onPressed: () {
                      _selectDate(context, true);
                    },
                    child: SizedBox(
                      width: 160,
                      child: Text('Returning Time: $_returnDateText'),
                      
                    ),
                  ),

                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _returnDateText = '';
                        _returnTime = null;
                      });
                    },
                    child: const Icon(Icons.close)
                  ),
                  
                ]
              )
            ),

            RoundedRect(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(
                    width: 150,
                    child:Text('No. Passengers:')
                  ),
                  
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: TextField(
                      controller: _textPaxController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly], 
                      
                      onTap: () {
                        setState(() {
                          _textPaxController.text = '';
                        });
                      },
                        // Only numbers can be entered
                      onSubmitted:(value) {
                        if (int.parse(value)>0) {
                          setState(() {
                          _pax = int.parse(value);
                        });
                        }
                      },
                    )
                  ),

                  const Icon(Icons.edit)
                ],      
              )
            ),

            TapableButton(
              onTap: (){
                if (![_origin, _destination, _departure ,_pax].contains(null)){
                  SessionData data = SessionData(_origin, _destination, _departure, _returnTime, _pax);
                  data.name = widget.name;
                  Trip trip = Trip(false, data);
                  
                  print("Heading to train selection");
                  print("${data.name} ${data.destination} ${data.departureTime} ${data.pax}");

                  //User will always first select departing train details, so isReturnTrip from searchTrain (here) is false  
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SelectTrain(
                      data: data, trip: trip, isReturnTrip: false,)
                      ));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid input. Please fill in your trip information.')));
                }
              },
              child: const Text('Search Trains'))
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
  // Clean up the controller when the widget is removed from the widget tree.
  _textPaxController.dispose();
  super.dispose();
  }

}

