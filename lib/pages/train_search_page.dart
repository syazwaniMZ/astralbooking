import "package:flutter/material.dart";
import 'package:astralbooking/widgets/menu_drawer.dart';
import 'package:astralbooking/ui/roundedcontainer.dart';
import 'package:astralbooking/widgets/search_train.dart';

class TrainSearchPage extends StatelessWidget {
  const TrainSearchPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Search Train"),
        ),
      
      drawer: const MenuDrawer(),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child:RoundedContainer(
              child: SearchTrain(name: name)
            )
          ),
        ],
      ),
    );
  }
}