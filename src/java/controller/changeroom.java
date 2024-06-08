package controller;

import DAO.BookDAO;
import DAO.ExtraPriceDAO;
import DAO.PersonInDetailDAO;
import DAO.RoomsDAO;
import DTO.Book;
import DTO.ExtraPrice;
import DTO.PersonInDetail;
import DTO.Rooms;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class changeroom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int typeId = Integer.parseInt(request.getParameter("roomtype"));

        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookingById(bookId);

        String dateStartStr = request.getParameter("dateStartStr");
        String dateEndStr = request.getParameter("dateEndStr");

        request.setAttribute("dateStartStr", dateStartStr);
        request.setAttribute("dateEndStr", dateEndStr);

        LocalDate dateStart = LocalDate.parse(dateStartStr);
        LocalDate dateEnd = LocalDate.parse(dateEndStr);

        RoomsDAO roomsDAO = new RoomsDAO();
        ArrayList<Rooms> list_room = roomsDAO.RoomCheck(typeId, dateStart, dateEnd);

        request.setAttribute("roomquery", list_room);
        request.setAttribute("bookId", bookId);

        request.getRequestDispatcher("changeroom.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int newRoomId = Integer.parseInt(request.getParameter("newRoomId"));

        BookDAO bookDAO = new BookDAO();
        int oldRoomId = bookDAO.getRoomIdByBookingId(bookId);

        RoomsDAO roomsDAO = new RoomsDAO();
        roomsDAO.updateRoomStatus(oldRoomId, "available");
        roomsDAO.updateRoomStatus(newRoomId, "unavailable");

        boolean success = bookDAO.updateRoomId(bookId, newRoomId);

        if (success) {
            double newBookingPrice = calculateBookingPrice(request, newRoomId, bookId);

            boolean priceUpdateSuccess = bookDAO.updateBookingPrice(bookId, newBookingPrice);

            if (priceUpdateSuccess) {
                response.sendRedirect("managebooking.jsp");
            } else {
                // Handle booking price update failure
            }
        } else {
            // Handle room change failure
        }
    }

    private double calculateBookingPrice(HttpServletRequest request, int newRoomId, int bookId) {
        RoomsDAO rDAO = new RoomsDAO();
        Rooms selectedRoom = rDAO.getRoomById(newRoomId);

        double roomPrice = selectedRoom.getType().getPrice();
        ExtraPriceDAO extraPriceDAO = new ExtraPriceDAO();
        ExtraPrice extraPrice = extraPriceDAO.getExtraPrice(1);
        float foreignPercent = extraPrice.getForeignPercent();
        float threePeoplePercent = extraPrice.getThreePeoplePercent();

        PersonInDetailDAO personDAO = new PersonInDetailDAO();

// Get the booking details from the database
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookingById(bookId);

// Get the list of people associated with the booking from the database
        ArrayList<PersonInDetail> personList = personDAO.getPersonInDetail(bookId);

// Calculate the room price based on the number of people and their types
        int numberOfPeople = book.getNumberOfPeople();
        if (numberOfPeople >= 3) {
            roomPrice *= (threePeoplePercent + 100) / 100;
        }

        for (PersonInDetail pid : personList) {
            if (pid.getType().equals("Nước Ngoài")) {
                roomPrice *= foreignPercent;
                break;
            }
        }

            String dateStartStr = request.getParameter("dateStartStr");
            String dateEndStr = request.getParameter("dateEndStr");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

// Parse the strings into LocalDate objects
            LocalDate checkin = LocalDate.parse(dateStartStr, formatter);
            LocalDate checkout = LocalDate.parse(dateEndStr, formatter);

// Calculate the number of days between the two dates
            long daysBetween = ChronoUnit.DAYS.between(checkin, checkout);
            request.setAttribute("days", daysBetween);
            request.setAttribute("dateStartStr", dateStartStr);
            request.setAttribute("dateEndStr", dateEndStr);
        roomPrice *= daysBetween;

        return roomPrice;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
