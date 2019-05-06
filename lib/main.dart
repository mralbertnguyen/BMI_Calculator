import 'package:flutter/material.dart';

// Import screens
import 'package:bmicalculator/src/ui/splash/SplashScreen.dart';
import 'package:bmicalculator/src/ui/calculator/CalculatorScreen.dart';
Size size;
void main() => runApp(
  
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: './diary',
    routes: {
      './splash' : (context)=> SplashScreen(),
      './diary' : (context)=> CalculatorScreen(),
    },
  )
);
