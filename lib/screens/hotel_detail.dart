import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int hotelIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    var args = ModalRoute.of(context)!.settings.arguments as Map;

    hotelIndex = args['index'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   hotelList[hotelIndex]["place"],
              //   style: AppStyles.headLineStyle1.copyWith(color: Colors.white),
              // ),
              background: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    "assets/images/${hotelList[hotelIndex]["image"]}",
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        hotelList[hotelIndex]["place"],
                        style: AppStyles.headLineStyle1.copyWith(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  blurRadius: 10,
                                  color: AppStyles.primaryColor,
                                  offset: Offset(2, 2))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tristique aliquam nulla, at ornare odio varius vel. Pellentesque ut cursus lacus, sed sodales diam. Sed tempor cursus justo non varius. Proin pellentesque ut dolor eu viverra. Praesent vitae augue et lacus vehicula aliquet eu quis eros. Vivamus eget neque non lacus vehicula tempor id eget velit. Donec nec consequat ante, sit amet porta nunc. Curabitur id arcu at ligula convallis hendrerit id sit amet lorem. Donec at nisl a mauris rutrum cursus nec non mi. Aliquam quis quam varius nisi ultricies volutpat ut quis sem. Ut finibus elit ac lectus sodales porttitor. Vestibulum a justo sit amet nunc fermentum ultricies non interdum risus. Etiam quam elit, fermentum in purus ut, interdum mollis dolor. Mauris congue dolor sit amet condimentum accumsan. Morbi a orci eget ipsum lobortis interdum. Duis diam dui, rutrum id neque et, eleifend imperdiet purus.")),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "More Images",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(8),
                        child: Image.network(
                            "https://via.placeholder.com/200x200"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}
