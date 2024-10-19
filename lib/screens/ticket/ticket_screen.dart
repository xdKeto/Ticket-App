import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40,),
          Text("Tickets", style: AppStyles.headLineStyle1,),
          SizedBox(height: 20,),
          AppTicketTabs(firstTab: "Upcoming",  secondTab: "Previous",)
        ],
      ),
    );
  }
}