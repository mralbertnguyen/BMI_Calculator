import 'package:flutter/material.dart';

// Import screens
import 'package:bmicalculator/src/ui/splash/SplashScreen.dart';
import 'package:bmicalculator/src/ui/calculator/CalculatorScreen.dart';
import 'package:bmicalculator/src/ui/diary/DiaryScreen.dart';
Size size;
void main() => runApp(
  
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: './calculator',
    routes: {
      './splash' : (context)=> SplashScreen(),
      './calculator' : (context)=> CalculatorScreen(),
      './diary' : (context) => DiaryScreen()
    },
  )
);
