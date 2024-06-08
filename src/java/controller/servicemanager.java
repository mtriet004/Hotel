package controller;

import DAO.HasServiceDAO;
import DAO.ServiceDAO;
import DAO.TypeDAO;
import DTO.HasService;
import DTO.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class servicemanager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("servicemanager.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> services = serviceDAO.getAllServices();
        TypeDAO typeDAO = new TypeDAO();
        HasServiceDAO hasServiceObject = new HasServiceDAO();

        // Map to hold service ID and corresponding type names
        Map<Integer, List<String>> serviceTypeNamesMap = new HashMap<>();

        for (Service service : services) {
            List<Integer> typeIds = hasServiceObject.getTypeIdsByServiceId(service.getServiceId());
            List<String> typeNames = new ArrayList<>();
            for (Integer typeId : typeIds) {
                String typeName = typeDAO.getTypeNameByTypeId(typeId);
                if (typeName != null) {
                    typeNames.add(typeName);
                }
            }
            serviceTypeNamesMap.put(service.getServiceId(), typeNames);
        }

        request.setAttribute("list_service", services);
        request.setAttribute("serviceTypeNamesMap", serviceTypeNamesMap);
        request.getRequestDispatcher("servicemanager.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
