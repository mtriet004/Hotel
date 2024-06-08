/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DiscountDAO;
import DAO.ExtraPriceDAO;
import java.text.NumberFormat;
import java.util.Locale;
import DAO.RoomsDAO;
import DTO.Account;
import DTO.Discount;
import DTO.ExtraPrice;
import DTO.PersonInDetail;
import DTO.Rooms;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class book extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            String[] pidName = request.getParameterValues("bfname");
            String[] pidCard = request.getParameterValues("bicard");
            String[] pidSex = request.getParameterValues("bsex");
            String[] pidType = request.getParameterValues("btype");
            int numOfpids = pidName.length;
            ArrayList<PersonInDetail> listRoommate = new ArrayList<>();
            for (int i = 0; i < numOfpids; i++) {
                PersonInDetail pID = new PersonInDetail();
                pID.setName(pidName[i]);
                pID.setIdentityNumber(pidCard[i]);
                pID.setSex(pidSex[i]);
                pID.setType(pidType[i]);
                listRoommate.add(pID);
            }
            request.setAttribute("listroommate", listRoommate);
            int selectedRoomId = Integer.parseInt(request.getParameter("selectedRoomId"));

            RoomsDAO rDAO = new RoomsDAO();
            Rooms selectedRoom = rDAO.getRoomById(selectedRoomId);
            request.setAttribute("selectedRoom", selectedRoom);
            double roomPrice = selectedRoom.getType().getPrice();
            ExtraPriceDAO extraPriceDAO = new ExtraPriceDAO();
            ExtraPrice extraPrice = extraPriceDAO.getExtraPrice(1);
            float foreignPercent = extraPrice.getForeignPercent();
            float threePeoplePercent = extraPrice.getThreePeoplePercent();
            if (listRoommate.size() >= 3) {
                roomPrice *= (threePeoplePercent+100)/100;
            }
            for (PersonInDetail pid : listRoommate) {
                if (pid.getType().equals("Nước Ngoài")) {
                    roomPrice *= foreignPercent;
                    break;
                }
            }
            Locale locale = new Locale("vi", "VN");

            // Get currency formatter for the specified locale
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);

            // Format the amount using Vietnamese currency format
            String dateStartStr = request.getParameter("dateStartStr");
            String dateEndStr = request.getParameter("dateEndStr");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

// Parse the strings into LocalDate objects
            LocalDate checkin = LocalDate.parse(dateStartStr, formatter);
            LocalDate checkout = LocalDate.parse(dateEndStr, formatter);

// Calculate the number of days between the two dates
            long daysBetween = ChronoUnit.DAYS.between(checkin, checkout);
            request.setAttribute("days", daysBetween);
            request.setAttribute("dateStartStr", dateStartStr);
            request.setAttribute("dateEndStr", dateEndStr);

            roomPrice = roomPrice * daysBetween;

            String formattedroomPrice = currencyFormatter.format(roomPrice);
            request.setAttribute("roomprice", formattedroomPrice);
            request.setAttribute("roompriceorigin", roomPrice);

            String hname = request.getParameter("hostName");
            String hId = request.getParameter("hostId");
            String hPhone = request.getParameter("hostPhone");
            String hSex = request.getParameter("hostSex");
            String hType = request.getParameter("hostType");
            String hEmail = request.getParameter("hostEmail");

            Account bookingAccount = new Account();
            bookingAccount.setFullName(hname);
            bookingAccount.setIdentityCard(hId);
            bookingAccount.setSex(hSex);
            bookingAccount.setType(hType);
            bookingAccount.setPhone(hPhone);
            bookingAccount.setEmail(hEmail);
            request.setAttribute("bookingAccount", bookingAccount);
            DiscountDAO discountDAO = new DiscountDAO();
            ArrayList<Discount> allDiscounts = discountDAO.getAllCodes();
            request.setAttribute("allDiscounts", allDiscounts);
            request.getRequestDispatcher("book.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String dateStartStr = request.getParameter("datestart");
        String dateEndStr = request.getParameter("dateend");
        request.setAttribute("dateStartStr", dateStartStr);
        request.setAttribute("dateEndStr", dateEndStr);
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
