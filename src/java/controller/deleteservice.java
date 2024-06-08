package controller;

import DAO.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteservice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("servicemanager.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

            int serviceId = Integer.parseInt(request.getParameter("serviceId"));
            ServiceDAO serviceDAO = new ServiceDAO();
            // Instead of deleting the service, you can update its status to "hidden" or similar
            serviceDAO.updateServiceStatus(serviceId, "hidden");
            response.sendRedirect("servicemanager");
            // Handle the exception as per your application's requirements
            
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
