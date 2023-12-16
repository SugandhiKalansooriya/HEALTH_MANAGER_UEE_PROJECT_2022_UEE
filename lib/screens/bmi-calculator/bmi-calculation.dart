import 'dart:math';

class CalResult{
  CalResult(this.weight, this.height);
  final int height;
  final int weight;
  double result = 0.0;
  String msg = '';

  String calResult(){
    result = weight/pow(height/100, 2);
    return result.toStringAsFixed(2);
  }

  String getDescription(){

      if (result > 25) {
        msg = "Over Weight";
        return "You have a higher weight than normal, Try to lose your weight !";
      }
      else if (result > 18.5) {
        msg = "Normal";
        return "You have a normal weight keep it";
      }
      else if (result < 18.5) {
        msg = "Under Weight";
        return "Your weight is less than normal weight so please gain some weight";
      }
      else
        msg = "";
        return "";
  }

}

