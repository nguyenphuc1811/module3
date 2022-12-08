package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.IFacilityService;
import service.impl.FacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet",urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {
    IFacilityService facilityService = new FacilityService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                addFacility(request,response);
                break;
            case "delete":
                deleteFacility(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = facilityService.deleteFacility(id);
        String mess = "Xoá không thành công";
        if(check){
            mess = "Xóa thành công";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){

            default:
                showList(request,response);
        }
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentType = Integer.parseInt(request.getParameter("rentType"));
        RentType rt = new RentType(rentType);
        int facilityType = Integer.parseInt(request.getParameter("facilityType"));
        FacilityType ft = new FacilityType(facilityType);
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        String facilityFree = request.getParameter("facilityFree");
        boolean check = facilityService.addFacility(new Facility(name,area,cost,maxPeople,rt,ft,standardRoom,description,poolArea,floor,facilityFree));
        String mess = "Thêm mới không thành công";
        if(check){
            mess = "Thêm mới thành công";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> list = facilityService.selectAll();
        request.setAttribute("list",list);
        List<RentType> typeList = facilityService.selectRentType();
        request.setAttribute("rentType",typeList);
        try {
            request.getRequestDispatcher("/view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
