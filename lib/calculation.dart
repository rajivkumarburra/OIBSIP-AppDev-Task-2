import 'package:math_expressions/math_expressions.dart';

class Calculation {
  static String calculateResult(String exp) {
    String result = "";
    try {
      exp = exp.replaceAll("X", "*");
      exp = exp.replaceAll("÷", "/");
      Parser p = Parser();
      Expression exp1 = p.parse(exp);
      ContextModel cm = ContextModel();
      double eval = exp1.evaluate(EvaluationType.REAL, cm);
      if (eval == eval.toInt()) {
        result = eval.toInt().toString();
      } else {
        result = eval.toStringAsFixed(3);
      }
    } catch (e) {
      result = "Error";
    }
    return result;
  }
}
