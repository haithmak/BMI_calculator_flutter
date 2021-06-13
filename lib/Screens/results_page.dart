import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:untitled/Componentes/ReusableCardWidget.dart';
import '../Componentes/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult,this.textResult, this.textInerpertation}) ;

  final String ? bmiResult;
  final String ? textResult;
  final String ? textInerpertation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Expanded(
            
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCardWidget(
              color: kActiveCardColor,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text(
                    textResult!.toUpperCase(),
                    style: kOverweightTextStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: kResultNumberTextStyle,
                  ),
                  Text(
                    textInerpertation!,
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),


                ],
              ),
            ),
          )
            ,
            BottomButton(title: 'RE-CALCULATE', onTap: (){
              Navigator.pop(context) ;
            })
        ]));
  }
}
