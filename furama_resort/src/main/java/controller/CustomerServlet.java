package controller;

import model.customer.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            default:
                showListCustomer(request, response);
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeCustomer = Integer.parseInt(request.getParameter("typeCustomer"));
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        boolean check = customerService.editCustomer(new Customer(id, typeCustomer, name, date, gender, idCard, phoneNumber, email, address));
        String mess = "Edit Không thành công";
        if (check) {
            mess = "Edit thành công";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        int typeCustomer = Integer.parseInt(request.getParameter("typeCustomer"));
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        boolean check = customerService.addCustomer(new Customer(typeCustomer, name, date, gender, idCard, phoneNumber, email, address));
        String mess = "Thêm mới không thành công";
        if (check) {
            mess = "Thêm mới thành công";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean rs = customerService.deleteCustomer(id);
        String mess = "Xóa không Thành công";
        if (rs) {
            mess = "Xóa Thành công";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListCustomer(request, response);
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int customerType =Integer.parseInt(request.getParameter("typeCustomer")) ;
        String address = request.getParameter("address");
        List<Customer> list =  customerService.searchCustomer(name,customerType,address);
        request.setAttribute("list", list);
        try {
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerService.selectAll();
        try {
            request.setAttribute("list", list);
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
