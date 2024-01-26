import "package:flutter/material.dart";
import 'package:practice_flutter_project/widgets/menu_drawer.dart';
import 'package:practice_flutter_project/ui/roundedcontainer.dart';
import 'package:practice_flutter_project/widgets/searchtrain.dart';

class TrainSearchPage extends StatelessWidget {
  const TrainSearchPage({super.key});

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

      body: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child:RoundedContainer(child: SearchTrain())),
        ],
      ),
    );
  }
}