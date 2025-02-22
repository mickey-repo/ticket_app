import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

import '../../base/res/media.dart';
import '../../base/res/styles/app_styles.dart';
import '../../base/utils/all_json.dart';
import '../../base/widgets/heading_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      //scrollable
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning", style: AppStyles.headLineStyle3),
                        const SizedBox(
                          height: 5,
                        ),
                        const HeadingText(text: "Book Tickets", isColor: false,),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.logo))),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)),
                  child: const Row(
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text("Search")
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: 'Upcoming flights',
                  smallText: "View all",
                  func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList.map((singleTicket) =>
                          GestureDetector(
                              onTap: (){
                                var ticketIndex = ticketList.indexOf(singleTicket);
                                Navigator.pushNamed(context,
                                    AppRoutes.ticketScreen,
                                    arguments: {
                                      "index":ticketIndex
                                    });
                              },
                              child: TicketView(ticket: singleTicket))).toList(),
                    )
                ),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: 'Hotels',
                  smallText: "View all",
                  func: () => Navigator.pushNamed(context, AppRoutes.allHotels),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList.map((singleHotel) => GestureDetector(
                          onTap: (){
                            var hotelIndex = hotelList.indexOf(singleHotel);
                            Navigator.pushNamed(context, AppRoutes.hotelDetail,arguments: {
                              "index":hotelIndex
                            });
                          },
                          child: Hotel(hotel: singleHotel))).toList(),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
