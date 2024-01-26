import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  datePickerTheme: const DatePickerThemeData(
    confirmButtonStyle: ButtonStyle(foregroundColor:  MaterialStatePropertyAll(Colors.black))
    ),
    
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: const Color.fromARGB(255, 59, 34, 34),
    inversePrimary: Colors.grey.shade700,
  )
);