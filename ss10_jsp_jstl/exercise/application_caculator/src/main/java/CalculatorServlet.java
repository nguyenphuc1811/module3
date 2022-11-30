import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = {"/calculator"})
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        String operator = request.getParameter("operator");
        String operatorIcon = "";
        switch (operator) {
            case "addition":
                operatorIcon = "+";
                break;
            case "subtraction":
                operatorIcon = "-";
                break;
            case "multiplication":
                operatorIcon = "*";
                break;
            case "division":
                operatorIcon = "/";
                break;
        }
        double result = 0;
        try {
            result = Calculator.calculate(operator, number1, number2);
        } catch (Exception e) {
            e.getMessage();
        }
        request.setAttribute("result", result);
        request.setAttribute("number1", number1);
        request.setAttribute("number2", number2);
        request.setAttribute("operator", operatorIcon);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
