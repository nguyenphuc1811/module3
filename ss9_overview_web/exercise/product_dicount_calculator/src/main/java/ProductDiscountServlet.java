import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountServlet",urlPatterns = "/display-discount")
public class ProductDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double listPrice = Double.parseDouble(request.getParameter("price"));
        String productDescription = request.getParameter("description");
        double discountPercent = Double.parseDouble(request.getParameter("percent"));
        Double discountAmount = listPrice * discountPercent * 0.01;
        Double discountPrice = listPrice - discountAmount;
        request.setAttribute("productDescription",productDescription);
        request.setAttribute("listPrice",listPrice);
        request.setAttribute("discountPercent",discountPercent);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("discountServlet.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
