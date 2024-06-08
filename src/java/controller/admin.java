/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BookDAO;
import DTO.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class admin extends HttpServlet {

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
        // Trong phương thức processRequest
        float[] dailyIncome = new float[7]; // Mảng để lưu tổng doanh thu của mỗi ngày trong tuần
        BookDAO bookDAO = new BookDAO();
        ArrayList<Book> bookings = bookDAO.getAllBooking();
        for (Book booking : bookings) {
            if (booking.getStatus() == 3) {
                // Lấy ngày trong tuần của booking
                LocalDate localDate = booking.getDateCreated();
                Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

                // Tạo một đối tượng Calendar và thiết lập thời gian của nó
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);

                // Lấy ngày trong tuần của booking
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                // Xác định chỉ số tương ứng trong mảng dailyIncome
                // Ví dụ: 2 cho Thứ 2, 3 cho Thứ 3, và cứ như vậy
                int arrayIndex = (dayOfWeek + 5) % 7;

                // Cộng giá trị booking vào tổng doanh thu của ngày đó
                dailyIncome[arrayIndex] += booking.getPrice();
            }
        }
        request.setAttribute("dailyIncome", dailyIncome);

        setTotalIncomeAttribute(request);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setLatestBookingsAttribute(request);
        processRequest(request, response);
    }

    private void setTotalIncomeAttribute(HttpServletRequest request) {
        BookDAO bookDAO = new BookDAO();
        ArrayList<Book> bookings = bookDAO.getAllBooking();
        float totalIncome = 0;
        for (Book booking : bookings) {
            if (booking.getStatus() == 3) {
                totalIncome += booking.getPrice();
            }
        }
        request.setAttribute("totalIncome", totalIncome);
    }

    private void setLatestBookingsAttribute(HttpServletRequest request) {
        BookDAO bookDAO = new BookDAO();
        ArrayList<Book> latestBookings = bookDAO.getLatestBookings(5);
        request.setAttribute("latestBookings", latestBookings);
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        BookDAO bookDAO = new BookDAO();
//        ArrayList<Book> latestBookings = bookDAO.getLatestBookings(5); // Retrieve the latest 5 bookings
//        request.setAttribute("latestBookings", latestBookings);
//        request.getRequestDispatcher("admin.jsp").forward(request, response);
//    }
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
