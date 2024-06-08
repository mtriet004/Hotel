package controller;

import DAO.ServiceDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class toggleservice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int serviceId = Integer.parseInt(request.getParameter("selectedServiceId"));
        String status = request.getParameter("serviceStatus");
        
        ServiceDAO serviceDAO = new ServiceDAO();
        if (status.equals("available")) {
            serviceDAO.toggleService(serviceId, "unavailable");
        } else if (status.equals("unavailable")) {
            serviceDAO.toggleService(serviceId, "available");
        } else {
            // Do nothing
        }
        
        response.sendRedirect("servicemanager");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
