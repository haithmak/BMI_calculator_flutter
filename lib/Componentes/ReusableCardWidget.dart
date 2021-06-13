import 'package:flutter/material.dart';

class ReusableCardWidget extends StatelessWidget {
  final Color color;
  final Widget? childCard;
//  final Function ? on{}
  ReusableCardWidget({required this.color, this.childCard});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}