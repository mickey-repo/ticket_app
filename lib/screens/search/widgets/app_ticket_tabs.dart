import 'package:flutter/material.dart';

class AppTicketTabs extends StatelessWidget {
  const AppTicketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFF4F6FD)
      ),
      child: const Row(
        children: [
          AppTabs(tabText: "Airline Tickets",
              tabBorder: true,
              tabColor: true),
          AppTabs(tabText: "Hotels",
          tabBorder: false,
          tabColor: false)
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  const AppTabs({super.key, this.tabText = "", this.tabBorder = false, this.tabColor = false});
  final String tabText;
  final bool tabBorder;
  final bool tabColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.44,
      decoration: BoxDecoration(
          color: tabColor?Colors.white:Colors.transparent,
          borderRadius: tabColor? BorderRadius.horizontal(left: Radius.circular(50)):BorderRadius.horizontal(right: Radius.circular(50))
      ),
      child: Center(child: Text(tabText)),
    );
  }
}

