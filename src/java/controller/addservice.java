package controller;

import DAO.ServiceDAO;
import DTO.Service;
import DTO.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addservice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("addservice.jsp").forward(request, response);
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
        String serviceName = request.getParameter("serviceName");
        String[] typeIdStrs = request.getParameterValues("selectedTypes");

        // Convert typeIdStrs to List<Integer>
        List<Integer> selectedTypeIds = new ArrayList<>();
        if (typeIdStrs != null) {
            for (String typeIdStr : typeIdStrs) {
                String[] typeIds = typeIdStr.split(",");
                for (String typeId : typeIds) {
                    selectedTypeIds.add(Integer.parseInt(typeId.trim()));
                }
            }
        }

        // Assuming status is initially set to "active" for new services
        Service service = new Service();
        service.setServiceName(serviceName);
        service.setStatus("available");
        ServiceDAO serviceDAO = new ServiceDAO();
        // Add service to Service table
        int serviceId = serviceDAO.addService(service);
        // Add service to HasService table for selected types only
        serviceDAO.assignServiceToTypes(serviceId, selectedTypeIds);
        response.sendRedirect("servicemanager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
