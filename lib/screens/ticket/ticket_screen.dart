import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text.dart';
import 'package:ticket_app/base/widgets/app_layoutBuilder.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;

      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 0),
            children: [
              // Text(
              //   "Tickets",
              //   style: AppStyles.headLineStyle1,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              AppTicketTabs(
                firstTab: "Upcoming",
                secondTab: "Previous",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                    isColor: true,
                  )),
              SizedBox(
                height: 1,
              ),
              Container(
                color: AppStyles.ticketColor,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextColumnLayout(
                            topText: "Flutter DB",
                            botText: "Passenger",
                            alignment: CrossAxisAlignment.start,
                            isColor: true),
                        TextColumnLayout(
                            topText: "5221 36869",
                            botText: "Passport",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLayoutBuilder(
                      randomDivider: 15,
                      isColor: true,
                      width: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextColumnLayout(
                            topText: "2465 651721432",
                            botText: "Number of E-ticket",
                            alignment: CrossAxisAlignment.start,
                            isColor: true),
                        TextColumnLayout(
                            topText: "B19231",
                            botText: "Booking Code",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLayoutBuilder(
                      randomDivider: 15,
                      isColor: true,
                      width: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visa,
                                  scale: 11,
                                ),
                                Text(
                                  "*** 2492",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment Method",
                              style: AppStyles.headLineStyle4
                                  .copyWith(color: Colors.grey.shade500),
                            )
                          ],
                        ),
                        TextColumnLayout(
                            topText: "\$249.9",
                            botText: "Ticket Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                child: Container(
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      data: 'https://www.youtube.com',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                  )),
            ],
          ),
          TicketPositionedCircle(
            pos: true,
          ),
          TicketPositionedCircle(
            pos: null,
          ),
        ],
      ),
    );
  }
}
