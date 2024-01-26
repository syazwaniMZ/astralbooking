// THIS FILE IS NO LONGER USED

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
    );
  }

  AppBar HomeAppBar() {
    return AppBar(title: const Text(
      'Breakfast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
          height: 20,
          width: 20,
          ),
      ),

      actions: [
        GestureDetector(
          onTap:(){
            
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
              ),
            child: SvgPicture.asset('assets/icons/dots.svg',
            height: 5,
            width: 5,
            ),
          )
        )
      ],
    );
  }
}