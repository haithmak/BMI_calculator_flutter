import 'package:flutter/material.dart';
import '../Constants.dart';

class BottomButton extends StatelessWidget {
 final String title ;
 final VoidCallback? onTap;
 BottomButton({required this.title , required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        color: kBottomContainarColor,
        margin: EdgeInsets.only(top: 10),
        padding:EdgeInsets.only(bottom: 20) ,
        child:Center(child: Text(title ,style: kLargeTextStyle))

        ,
      ),
    );
  }
}