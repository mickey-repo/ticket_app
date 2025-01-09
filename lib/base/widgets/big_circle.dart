import 'package:flutter/material.dart';

class BigCircle extends StatelessWidget {
  final bool isRight;
  final bool? isColor;
  const BigCircle({super.key, required this.isRight, this.isColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 10,
      child: DecoratedBox(
          decoration: isRight == true ? BoxDecoration(
              color: isColor == null ? Colors.white : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              )
          ) : BoxDecoration(
              color: isColor == null ? Colors.white : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              )
          )),
    );
  }
}
