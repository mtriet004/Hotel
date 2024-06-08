/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BookDAO;
import DAO.PersonInDetailDAO;
import DAO.RoomsDAO;
import DTO.Account;
import DTO.Book;
import DTO.PersonInDetail;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class confirmbooking extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        Account myAccount = (Account) session.getAttribute("loggedInAccount");

        String dateStartStr = request.getParameter("dateStartStr");
        String dateEndStr = request.getParameter("dateEndStr");


        String[] pidName = request.getParameterValues("roommatename");
        String[] pidCard = request.getParameterValues("identitynumber");
        String[] pidSex = request.getParameterValues("roommatesex");
        String[] pidType = request.getParameterValues("roommatetype");
        int numOfpids = pidName.length;

        String selectedRoomId = request.getParameter("selectedRoomId");
        String accountId = myAccount.getIdentityCard();
        String roompriceStr = request.getParameter("roompriceorigin");
        String discountedPriceStr = request.getParameter("discountedPrice");
        float roomPrice = Float.parseFloat(roompriceStr);
        float discountedPrice = (discountedPriceStr != null && !discountedPriceStr.isEmpty()) ? Float.parseFloat(discountedPriceStr) : roomPrice;
        BookDAO bDao = new BookDAO();
        Book b = new Book();

        b.setIdentityCard(accountId);
        
        b.setDateCreated(LocalDate.now());
        String[] dateStartParts = dateStartStr.split("/");
        String[] dateEndParts = dateEndStr.split("/");

        String reformattedDateStartStr = dateStartParts[1] + "/" + dateStartParts[0] + "/" + dateStartParts[2];
        String reformattedDateEndStr = dateEndParts[1] + "/" + dateEndParts[0] + "/" + dateEndParts[2];

        LocalDate dateStart = LocalDate.parse(reformattedDateStartStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        LocalDate dateEnd = LocalDate.parse(reformattedDateEndStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));

        b.setCheckinDate(dateStart);
        b.setCheckoutDate(dateEnd);


        b.setRoomId(Integer.parseInt(selectedRoomId));

        b.setNumberOfPeople(numOfpids);
        b.setPrice(discountedPrice);
        b.setStatus(0);
        int bookingId = bDao.CreateBooking(b);

        RoomsDAO rDAO = new RoomsDAO();
        rDAO.updateRoomStatus(Integer.parseInt(selectedRoomId), "unavailable");

        ArrayList<PersonInDetail> listRoommate = new ArrayList<>();
        for (int i = 0; i < numOfpids; i++) {
            PersonInDetail pID = new PersonInDetail();
            pID.setBookId(bookingId);
            pID.setName(pidName[i]);
            pID.setIdentityNumber(pidCard[i]);
            pID.setSex(pidSex[i]);
            pID.setType(pidType[i]);
            if (i == 0) {
                pID.setEmail(request.getParameter("hostEmail"));
                pID.setPhone(request.getParameter("hostPhone"));
            }
            listRoommate.add(pID);
        }

        for (PersonInDetail pid : listRoommate) {
            PersonInDetailDAO pDAO = new PersonInDetailDAO();
            pDAO.insertPersonInDetail(pid);
        }



        response.sendRedirect("index.jsp");
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
