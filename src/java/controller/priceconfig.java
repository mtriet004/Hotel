/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ExtraPriceDAO;
import DAO.TypeDAO;
import DTO.ExtraPrice;
import DTO.Type;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class priceconfig extends HttpServlet {

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
//        request.getRequestDispatcher("priceconfig.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        TypeDAO typeDAO = new TypeDAO();
        ExtraPriceDAO extraPriceDAO = new ExtraPriceDAO();

        Type typeA = typeDAO.getTypeInfo(1);
        Type typeB = typeDAO.getTypeInfo(2);
        Type typeC = typeDAO.getTypeInfo(3);
        ExtraPrice extraPrice = extraPriceDAO.getExtraPrice(1); // Assuming '1' is the id

        request.setAttribute("typeA", typeA);
        request.setAttribute("typeB", typeB);
        request.setAttribute("typeC", typeC);
        request.setAttribute("extraPrice", extraPrice);
        request.getRequestDispatcher("priceconfig.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        TypeDAO typeDAO = new TypeDAO();
        ExtraPriceDAO extraPriceDAO = new ExtraPriceDAO();
        // Room A
        int roomAId = Integer.parseInt(request.getParameter("roomAId"));
        float roomAPrice = Float.parseFloat(request.getParameter("roomA_price"));
        int roomAPeople = Integer.parseInt(request.getParameter("roomA_people"));
        typeDAO.updateRoomPrice(roomAId, roomAPrice);
        typeDAO.updateRoomPeople(roomAId, roomAPeople);

        // Room B
        int roomBId = Integer.parseInt(request.getParameter("roomBId"));
        float roomBPrice = Float.parseFloat(request.getParameter("roomB_price"));
        int roomBPeople = Integer.parseInt(request.getParameter("roomB_people"));
        typeDAO.updateRoomPrice(roomBId, roomBPrice);
        typeDAO.updateRoomPeople(roomBId, roomBPeople);

        // Room C
        int roomCId = Integer.parseInt(request.getParameter("roomCId"));
        float roomCPrice = Float.parseFloat(request.getParameter("roomC_price"));
        int roomCPeople = Integer.parseInt(request.getParameter("roomC_people"));
        typeDAO.updateRoomPrice(roomCId, roomCPrice);
        typeDAO.updateRoomPeople(roomCId, roomCPeople);

        // Extra Prices
        String extraPriceIdString = request.getParameter("extraPriceId");

// Parse the string to an integer
        int extraPriceId = Integer.parseInt(extraPriceIdString);
        float foreignPercent = Float.parseFloat(request.getParameter("foreignPercent"));
        float threePeoplePercent = Float.parseFloat(request.getParameter("threePeoplePercent"));

        extraPriceDAO.updateExtraPrice(extraPriceId, foreignPercent, threePeoplePercent);

        response.sendRedirect("priceconfig");
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
