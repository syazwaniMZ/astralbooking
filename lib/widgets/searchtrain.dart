import 'dart:core';

import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:astralbooking/models/train_search_data.dart';
import 'package:astralbooking/ui/tapable_button.dart';
import '../models/session_data.dart';
import '../pages/select_train_page.dart';
import '/ui/roundedRectangle.dart';

class SearchTrain extends StatefulWidget {
  const SearchTrain({super.key});

  @override
  State<SearchTrain> createState() => _SearchTrainState();
}

class _SearchTrainState extends State<SearchTrain> {

  late SearchData _searchData;

  late String _origin='';
  late String _destination='';
  late int _pax =1;
  late DateTime _departure = DateTime.now();
  DateTime? _returnTime;
  
  DateTime selectedDate = DateTime.now();

  final TextEditingController _textController = TextEditingController(text: '1');

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
        if (!isReturnTrip)
        {
          _departure = picked;
        }
        else
        {
          // TO DO: Set conditions that _returnTime must be after 
          _returnTime = picked;
        }
      });
    }
  }


String? DateTimeNullChecker(DateTime? date)
{
  if (date == null) {
    return "";
  } else {
    return dateFormat.format(date);
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
                      width: 150,
                      child: Text('Departure Time: ${DateTimeNullChecker(_returnTime)}'),
                    ),
                  ),

                  MaterialButton(
                    onPressed: () {
                      setState(() {
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
                    width: 100,
                    child:Text('No. Passengers:')
                  ),
                  
                  SizedBox(
                    width: 20,
                    child: TextField(
                      controller: _textController,
                      onSubmitted:(value) {
                        setState(() {
                          _pax = int.parse(value);
                        });
                      },
                    )
                  ),

                  const Icon(Icons.edit)
                ],      
              )
            ),

            TapableButton(
              onTap: (){
                SessionData data = SessionData(_origin, _destination, _departure, _returnTime, _pax);
                print("Heading to train selection");
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectTrain(data: data,isReturnTrip: false)));
              },
              child: const Text('Search Trains'))
          ],
        ),
      )
    );
  }
}