import "package:flutter/material.dart";
import 'package:astralbooking/widgets/menu_drawer.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Search Train"),
        ),
      drawer: const MenuDrawer()
    );
  }
}