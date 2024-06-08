/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.RoomsDAO;
import DTO.Rooms;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class roomsearch extends HttpServlet {

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
            request.getRequestDispatcher("roomsearch.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        int typeId = Integer.parseInt(request.getParameter("roomtype"));
        String dateStartStr = request.getParameter("datestart");
        String dateEndStr = request.getParameter("dateend");
        request.setAttribute("dateStartStr", dateStartStr);
        request.setAttribute("dateEndStr", dateEndStr);

// Reformat the date strings from mm/dd/yyyy to dd/mm/yyyy
        String[] dateStartParts = dateStartStr.split("/");
        String[] dateEndParts = dateEndStr.split("/");

        String reformattedDateStartStr = dateStartParts[1] + "/" + dateStartParts[0] + "/" + dateStartParts[2];
        String reformattedDateEndStr = dateEndParts[1] + "/" + dateEndParts[0] + "/" + dateEndParts[2];

// Parse the reformatted date strings into LocalDate objects
        LocalDate dateStart = LocalDate.parse(reformattedDateStartStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        LocalDate dateEnd = LocalDate.parse(reformattedDateEndStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        RoomsDAO roomsDAO = new RoomsDAO();
        ArrayList<Rooms> list_room = roomsDAO.RoomCheck(typeId, dateStart, dateEnd);
        request.setAttribute("roomquery", list_room);
        request.getRequestDispatcher("roomsearch.jsp").forward(request, response);
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
