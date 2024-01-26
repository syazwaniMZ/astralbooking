import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget{
  final Widget child;
  const RoundedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(25),
      child: child,
    );
  }


}