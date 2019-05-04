import 'package:flutter/material.dart';

// Import screens
import 'package:bmicalculator/src/ui/splash/SplashScreen.dart';
Size size;
void main() => runApp(
  
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: './splash',
    routes: {
      './splash' : (context)=> SplashScreen(),
    },
  )
);
