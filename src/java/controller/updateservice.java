package controller;

import DAO.ServiceDAO;
import DTO.Service;
import DTO.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateservice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String serviceId = request.getParameter("serviceId");
            request.setAttribute("serviceId", serviceId);
            request.getRequestDispatcher("updateservice.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String serviceIdStr = request.getParameter("selectedServiceId");
        String serviceName = request.getParameter("serviceName");

        int serviceId = Integer.parseInt(serviceIdStr);

        ServiceDAO serviceDAO = new ServiceDAO();

        // Get the service details by ID
        Service service = serviceDAO.getServiceByServiceId(serviceId);
        if (service != null) {
            // Update the service details
            service.setServiceName(serviceName);

            // Update the service in the database
            serviceDAO.updateService(service);
            response.sendRedirect("servicemanager");
        } else {
            // Handle the case where service details are not found
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
