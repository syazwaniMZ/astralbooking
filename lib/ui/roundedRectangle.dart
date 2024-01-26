import 'package:flutter/material.dart';

class RoundedRect extends StatelessWidget {
  final Widget child;
  const RoundedRect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      width: 300,
      child: Align(
        child: child),
    );
  }
}