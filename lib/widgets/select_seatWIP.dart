import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({super.key, this.onTapSeat, required this.i, required this.isTaken});

  final bool isTaken;
  final int i;
  final void Function()? onTapSeat;

  @override
  Widget build(BuildContext context) {
    if (isTaken) {
      return SeatTemplate(border: bulletBorder, seatNo: i);
    }

    else {
      return GestureDetector(
      onTap: onTapSeat,
      child: SeatTemplate(border: coachBorder, seatNo: i)
      );
    }
  }
}

class SeatTemplate extends StatelessWidget {
  const SeatTemplate({super.key, required this.border, required this.seatNo});

  final int seatNo;
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
          child: Text(seatNo.toString(),
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
  fontSize: 20,
  fontWeight: FontWeight.bold);