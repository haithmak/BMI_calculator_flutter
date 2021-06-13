import 'dart:math';
class BMI {

  BMI({this.height , this.weight}) ;

  int ? height ;
  int ? weight ;
  double ? _bmi ;

  String ? calculaterBMI(){
    _bmi   = weight! / pow(height! / 100 ,2) ;
    return _bmi!.toStringAsFixed(1) ;
  }

  String ? getResultText() {
    if (_bmi! >= 25) {
      return 'Overweight';
    }
    else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
    return "";
  }


  String ? getInerpertation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight , Try to exercise more.';
    }
    else if (_bmi! > 18.5) {
      return 'You have a normal body weight . Good job';
    } else {
      return 'You have a lower than normal body weight , You can eat a bit more.';
    }
    return "";
  }









}