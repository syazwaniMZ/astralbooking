import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripScaffold extends StatelessWidget {
  TripScaffold({super.key, required this.heading, required this.subtitle, required this.cornerText, required this.body});
  String heading;
  String subtitle;
  String? cornerText;

  Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  child: Text(heading,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight:FontWeight.w600,
                      fontSize: 20),
                    )
                  ),
    
                SizedBox(
                  width: 220,
                  child: Text(subtitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                    fontWeight:FontWeight.w600,
                    fontSize: 16)
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 80,
              child: Text(
                cornerText!,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10
                ),),
            )
          ],
        ),
      ),
      body: body,
    );
  }
}