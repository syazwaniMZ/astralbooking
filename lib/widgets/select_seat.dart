import 'package:astralbooking/models/session_data.dart';
import 'package:flutter/material.dart';

import 'trip.dart';

class SeatWidget extends StatefulWidget {
  SeatWidget({super.key, required this.data, required this.trip});
  
  SessionData data;
  Trip trip;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}