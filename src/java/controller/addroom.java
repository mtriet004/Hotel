package controller;

import DAO.RoomsDAO;
import DTO.Rooms;
import DTO.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addroom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("addroom.jsp").forward(request, response);
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
        String roomNumber = request.getParameter("roomNumber");
        String typeIdString = request.getParameter("typeId");


        int typeId = Integer.parseInt(typeIdString);

        Rooms room = new Rooms();
        room.setRoomNumber(roomNumber);
        Type t = new Type();
        t.setTypeId(typeId);
        room.setType(t);
        room.setStatus("available");
        RoomsDAO roomsDAO = new RoomsDAO();
        roomsDAO.addRoom(room);
        response.sendRedirect("roommanager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
