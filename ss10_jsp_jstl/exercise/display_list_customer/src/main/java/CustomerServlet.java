import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Neymar Jr",new Date("11/11/1984"),"Brazil","picture\\neymar.jpg"));
        customerList.add(new Customer("Vicinius Junior",new Date("11/11/1984"),"Brazil","picture\\vinicius.jpg"));
        customerList.add(new Customer("Critiano Ronaldo",new Date("11/11/1984"),"Poturgal","picture\\ronaldo.jpg"));
        customerList.add(new Customer("Leo Messi",new Date("11/11/1984"),"Agentina","picture\\messi.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("customer.jsp").forward(request,response);
    }
}
