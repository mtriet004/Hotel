/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BookDAO;
import DAO.RoomsDAO;
import DTO.Account;
import DTO.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class proceedbooking extends HttpServlet {

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
        try {
            // Parse booking ID and status from request parameters
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            int status = Integer.parseInt(request.getParameter("status"));

            // Create instances of DAO
            BookDAO bookDAO = new BookDAO();
            RoomsDAO roomsDAO = new RoomsDAO();

            // Check if the status is "cancelled" (assuming 4) or "finished" (assuming 3)
            if (status == 3) {
                // Retrieve the booking details by booking ID
                Book booking = bookDAO.getBookingById(bookingId);
                int roomId = booking.getRoomId();

                // Update the room status to "available"
                roomsDAO.updateRoomStatus(roomId, "available");
            }

            // Update the booking status
            bookDAO.toggleBookingStatus(bookingId, status);

            // Redirect to the manage booking page
            response.sendRedirect("managebooking");
        } catch (Exception e) {
            // Log the error
            e.printStackTrace(); // or use a logger like Log4j

            // Send an error message to the client
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
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
