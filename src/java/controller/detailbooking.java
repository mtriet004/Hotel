package controller;

import DAO.AccountDAO;
import DAO.BookDAO;
import DAO.PersonInDetailDAO;
import DTO.Account;
import DTO.Book;
import DTO.PersonInDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class detailbooking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            BookDAO bookDAO = new BookDAO();
            PersonInDetailDAO personDAO = new PersonInDetailDAO();

            Book book = bookDAO.getBookingById(bookId);
            ArrayList<PersonInDetail> personList = personDAO.getPersonInDetail(bookId);

            out.println("<html>");
            out.println("<head><title>Booking Details</title></head>");
            out.println("<body>");
            out.println("<h1>Booking Details</h1>");
            out.println("<h2>Booking Information</h2>");
            out.println("<p>Date Created: " + book.getDateCreated() + "</p>");
            out.println("<p>Check-in Date: " + book.getCheckinDate() + "</p>");
            out.println("<p>Check-out Date: " + book.getCheckoutDate() + "</p>");
            out.println("<p>Price: " + book.getPrice() + "</p>");
            out.println("<p>Number of People: " + book.getNumberOfPeople() + "</p>");
            out.println("<p>Room ID: " + book.getRoomId() + "</p>");
            out.println("<p>Status: " + book.getStatus() + "</p>");
            out.println("<p>Code: " + book.getCode() + "</p>");
            out.println("<p>Identity Card: " + book.getIdentityCard() + "</p>");

            out.println("<h2>People in Detail</h2>");
            for (PersonInDetail person : personList) {
                out.println("<p>Name: " + person.getName() + "</p>");
                out.println("<p>Identity Number: " + person.getIdentityNumber() + "</p>");
                out.println("<p>Type: " + person.getType() + "</p>");
                out.println("<p>Sex: " + person.getSex() + "</p>");
                out.println("<p>Phone: " + person.getPhone() + "</p>");
                out.println("<p>Email: " + person.getEmail() + "</p>");
                out.println("<hr/>");
            }
            Account loggedInAccount = (Account) request.getSession().getAttribute("loggedInAccount");
            if (loggedInAccount.getRole().getRoleId() == 1) {
                out.println("<h2>Change Room</h2>");
                out.println("<form action='changeroom' method='GET'>");
                out.println("<input type='hidden' name='bookId' value='" + bookId + "'/>");
                out.println("<input type='hidden' id='date-start' name='dateStartStr' value='" + book.getCheckinDate() + "' />");
                out.println("<input type='hidden' id='date-end' name='dateEndStr' value='" + book.getCheckoutDate() + "' />");
                out.println("<label for='roomtype'>Room Type:</label>");
                out.println("<select name='roomtype' required>");
                out.println("<option value='0' selected>All types</option>");
                out.println("<option value='1'>Low-Cost Room</option>");
                out.println("<option value='2'>Medium-Cost Room</option>");
                out.println("<option value='3'>Luxury Room</option>");
                out.println("</select>");
                out.println("<input type='submit' value='Filter Rooms'/>");
                out.println("</form>");
            }

            out.println("</body>");
            out.println("</html>");

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
