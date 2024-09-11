import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
  // print("Hello dart");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BottomNavbar(),
        
        
        
        );
  }
}
