import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Componentes/IconContent.dart';
import 'package:untitled/Componentes/ReusableCardWidget.dart';
import '../Constants.dart';
import '../Componentes/bottom_button.dart';
import '../Componentes/round_icon.dart';
import '../BMI.dart';
import 'results_page.dart';
enum Gender { male, female }
int height = 180;
int weight = 60;
int age =20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender? selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCardWidget(
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCardWidget(
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCardWidget(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      thumbColor: kBottomContainarColor,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x1fEB1555),
                      //  inactiveTickMarkColor: Color(0xFF8D8E98),
                      activeTickMarkColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCardWidget(
                  color: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kLabelTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIConButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              weight--;
                            });
                          }),
                         SizedBox(width: 10,),
                          RoundIConButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCardWidget(
                  color: kActiveCardColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kLabelTextStyle),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIConButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(width: 10,),
                                RoundIConButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            )
                          ],
                        )
                )),
              ],
            )),
            BottomButton(title: 'CALCULATE',onTap: (){
              BMI bmi = BMI(height: height , weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: bmi.calculaterBMI(),
                  textResult: bmi.getResultText(),
                  textInerpertation: bmi.getInerpertation(),
                )),
              );
           //   Navigator.pushNamed(context, 'result' ,arguments:) ;
            },)
          ],
        ));
  }
}







