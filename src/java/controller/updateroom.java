package controller;

import DAO.RoomsDAO;
import DTO.Rooms;
import DTO.Type;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateroom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String roomId = request.getParameter("roomId");
            request.setAttribute("roomId", roomId);
            request.getRequestDispatcher("updateroom.jsp").forward(request, response);
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
        int roomId = Integer.parseInt(request.getParameter("selectedRoomId"));
        int typeId =Integer.parseInt(request.getParameter("typeId"));
        String roomNumber = request.getParameter("roomNumber");
        
        Rooms room = new Rooms();
        room.setRoomId(roomId);
        room.setRoomNumber(roomNumber);
        Type t = new Type();
        t.setTypeId(typeId);
        room.setType(t);
        RoomsDAO roomsDAO = new RoomsDAO();
        roomsDAO.updateRoom(room);
        response.sendRedirect("roommanager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
