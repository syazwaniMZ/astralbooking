// This class is not used
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
   CustomCalendar({super.key, required this.isReturning, this.onSelected});

   bool isReturning;
   final void Function()? onSelected;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime selectedDate = DateTime.now();
  late DateFormat dateFormat = DateFormat("yMMMd");
  
  String? DateTimeNullChecker(DateTime? date)
  {
    if (date == null) {
      return "";
    } else {
      return dateFormat.format(date);
    }
  }

  Future<DateTime> _selectDate(BuildContext context, bool isReturnTrip) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        helpText: 'Departure Time',
        );
    if (picked != null && picked != selectedDate && !picked.isBefore(DateTime.now())) {
      setState(() {
        selectedDate = picked;
      });
      return selectedDate;
    }
    else if (picked != null && picked.isBefore(DateTime.now()))
    {
      //TO DO: Warning message
    }
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _selectDate(context, true);
        },
      child: SizedBox(
        width: 200,
        child: Text('Departure Time: ${DateTimeNullChecker(selectedDate)}'),
      ),
    );
  }
}
