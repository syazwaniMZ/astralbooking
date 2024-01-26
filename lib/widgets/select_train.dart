import 'package:flutter/material.dart';

class DisplayTrainOption extends StatefulWidget {
  const DisplayTrainOption({super.key});

  @override
  State<DisplayTrainOption> createState() => _DisplayTrainOptionState();
}

class _DisplayTrainOptionState extends State<DisplayTrainOption> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return SingleChildScrollView(
          child: Placeholder(),
        )
      }
    );
  }
}