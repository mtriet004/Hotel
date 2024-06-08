package controller;

import DAO.RoomsDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteroom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

            request.getRequestDispatcher("roommanager.jsp").forward(request, response);


        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            RoomsDAO roomsDAO = new RoomsDAO();
            roomsDAO.updateRoomStatus(roomId, "unavailable");
            // Send a success response back to the client
            response.sendRedirect("roommanager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
