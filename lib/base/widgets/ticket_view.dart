import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text.dart';
import 'package:ticket_app/base/widgets/app_layoutBuilder.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor = null});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size.height);

    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(
          right: wholeScreen == true ? 0 : 16,
        ),
        child: Column(
          children: [
            // BLUE PART OF TICKET
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Center(
                  child: Column(
                children: [
                  // Show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilder(
                              randomDivider: 6,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.57,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : AppStyles.dotColor,
                              ),
                            ),
                          )
                        ],
                      )),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleThird(
                          text: ticket["to"]["code"], isColor: isColor),
                    ],
                  ),
                  // show departure and desitantion with time
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                            text: ticket['from']['name'],
                            isColor: isColor,
                          )),
                      Expanded(child: Container()),
                      TextStyleFourth(
                          text: ticket['flying_time'], isColor: isColor),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                            text: ticket['to']['name'],
                            isColor: isColor,
                            align: TextAlign.end,
                          )),
                    ],
                  ),
                ],
              )),
            ),
            // MIDDLE PART OF TICKET
            Container(
              height: 20,
              color: isColor == null
                  ? AppStyles.ticketOrange
                  : AppStyles.ticketColor,
              child: Row(
                children: [
                  BigCircle(isRight: true, isColor: isColor),
                  Expanded(
                      child: AppLayoutBuilder(
                          randomDivider: 16, width: 6, isColor: isColor)),
                  BigCircle(isRight: false, isColor: isColor)
                ],
              ),
            ),
            // ORANGE PART OF TICKET
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketOrange
                      : AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
              child: Center(
                  child: Column(
                children: [
                  // Show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                          topText: ticket['date'],
                          botText: "Date",
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor),
                      TextColumnLayout(
                          topText: ticket['departure_time'],
                          botText: "Departure Time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor),
                      TextColumnLayout(
                          topText: ticket['number'].toString(),
                          botText: "Number",
                          isColor: isColor,
                          alignment: CrossAxisAlignment.end)
                    ],
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
