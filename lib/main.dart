import 'package:flutter/material.dart';
import 'package:ui_challenge_week_three/src/pages/trip_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TripPage()
    );
  }
}