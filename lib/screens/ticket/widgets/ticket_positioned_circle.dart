import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircle({super.key, required this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: pos==true?22:null,
        right: pos==false?22:null,
        top: 250,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(width: 2,color: AppStyles.textColor)
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));

  }
}
