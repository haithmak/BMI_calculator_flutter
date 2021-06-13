import 'package:flutter/material.dart';

class RoundIConButton extends StatelessWidget {

  final IconData icon ;
  final VoidCallback? onPressed;
  RoundIConButton({required this.icon , required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder() ,
      constraints:BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ) ,
      fillColor: Color(0xFF8D8E98) ,
      elevation: 0,
    );
  }
}