import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_navbar.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';

void main() {
  runApp(const MyApp());
  // print("Hello dart");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => BottomNavbar(),
        "/home/all_tickets": (context) => AllTickets()
      },
    );
  }
}
