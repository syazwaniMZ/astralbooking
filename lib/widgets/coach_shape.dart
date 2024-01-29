import 'package:flutter/material.dart';

class CoachShape extends StatelessWidget {
  const CoachShape({super.key, required this.coachID, this.onTapCoach, required this.i});

  final int i;
  final void Function()? onTapCoach;
  final String coachID;

  @override
  Widget build(BuildContext context) {
    if (i==0) {
      return CoachTemplate(border: bulletBorder, text: "Engine");
    }

    else {
      return GestureDetector(
      onTap: onTapCoach,
      child: CoachTemplate(border: coachBorder, text: coachID)
      );
    }
  }
}

class CoachTemplate extends StatelessWidget {
  const CoachTemplate({super.key, required this.border, required this.text});

  final String text;
  final BorderRadius border;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: border),
      margin: coachMargin,
      elevation: 0.5,
      child: Container(
        width: 100,
        height: 150,
        padding: coachPadding, 
        child: Container (
          alignment: Alignment.center,
          child: Text(text,
          style: bold20),
        ),
      )
    );
  }
}

EdgeInsets coachPadding = const EdgeInsets.symmetric(
  vertical: 50, horizontal: 20);

BorderRadius bulletBorder = const BorderRadius.vertical(
    top: Radius.circular(50),
    bottom: Radius.circular(10)
);

BorderRadius coachBorder = const BorderRadius.all(Radius.circular(10));

EdgeInsets coachMargin = const EdgeInsets.all(10.0);

TextStyle bold20 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold);