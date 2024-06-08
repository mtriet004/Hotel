/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DiscountDAO;
import DAO.RoomsDAO;
import DTO.Account;
import DTO.Discount;
import DTO.Rooms;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class roommate extends HttpServlet {

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
//            Do nothing
//            request.getRequestDispatcher("roommate.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("hostName").trim();
        String identityCard = request.getParameter("hostIdentity");
        String phone = request.getParameter("hostPhone");
        String email = request.getParameter("hostEmail");
        String sex = request.getParameter("hostSex");
//        switch (sex) {
//            case "male":
//                sex = "Nam";
//                break;
//            case "female":
//                sex = "Nữ";
//                break;
//            default:
//                sex = "Khác";
//                break;
//        }
        String type = request.getParameter("hostType");

        Account bookingAccount = new Account();
        bookingAccount.setFullName(fullName);
        bookingAccount.setIdentityCard(identityCard);
        bookingAccount.setSex(sex);
        bookingAccount.setType(type);
        bookingAccount.setPhone(phone);
        bookingAccount.setEmail(email);

        request.setAttribute("bookingAccount", bookingAccount);
//        String selectedRoomId = request.getParameter("selectedRoomId");
//        request.setAttribute("selectedRoomId", selectedRoomId);
        int selectedRoomId = Integer.parseInt(request.getParameter("selectedRoomId"));
        RoomsDAO rDAO = new RoomsDAO();
        Rooms selectedRoom = rDAO.getRoomById(selectedRoomId);
        request.setAttribute("selectedRoom", selectedRoom);
        request.setAttribute("selectedRoomId", selectedRoomId);
        int maxPeople= selectedRoom.getType().getNumPeople();
        // Get the maxPeople attribute from the room type
        request.setAttribute("maxPeople", maxPeople);

        String dateStartStr = request.getParameter("dateStartStr");
        String dateEndStr = request.getParameter("dateEndStr");
        request.setAttribute("dateStartStr", dateStartStr);
        request.setAttribute("dateEndStr", dateEndStr);

        request.getRequestDispatcher("roommate.jsp").forward(request, response);

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
