/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
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
public class cancelbooking extends HttpServlet {

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
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            // Create instances of DAO
            BookDAO bookDAO = new BookDAO();

            // Toggle the booking status to "cancelled"
            bookDAO.toggleBookingStatus(bookingId, 4);  // Assuming 0 represents "cancelled" status

            // Retrieve the list of bookings for the owner
            // Store the user's bookings in the session
            HttpSession session = request.getSession();

            // Redirect to the manage booking page
            Book booking = bookDAO.getBookingById(bookingId);
            int roomId = booking.getRoomId();

            // Update the room status to "available"
            RoomsDAO roomsDAO = new RoomsDAO();
            roomsDAO.updateRoomStatus(roomId, "available");
            Account loggedInAccount = (Account) session.getAttribute("loggedInAccount");

            // Check the role of the loggedInAccount and redirect accordingly
            if (loggedInAccount != null) {
                if (loggedInAccount.getRole().getRoleId() == 1) { // Admin role
                    ArrayList<Book> allBooking = bookDAO.getAllBooking();
                    session.setAttribute("allBooking", allBooking);
                    response.sendRedirect("managebooking");
                } else { // User role
                    String identityCard = (String) session.getAttribute("identityCard");
                    ArrayList<Book> userBooking = bookDAO.getBookList(identityCard);
                    session.setAttribute("userBooking", userBooking);
                    response.sendRedirect("viewbooking");
                }
            }
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
