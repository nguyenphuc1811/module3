public class Calculator extends CalculatorServlet {
    public static double calculate(String operator, double number1, double number2) {
        switch (operator) {
            case "addition":
                return number1 + number2;
            case "subtraction":
                return number1 - number2;
            case "multiplication":
                return number1 * number2;
            default:
                return number1 / number2;
        }
    }
}
