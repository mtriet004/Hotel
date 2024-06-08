package controller;

import DAO.RoomsDAO;
import DTO.Rooms;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class toggleroom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int RoomId = Integer.parseInt(request.getParameter("selectedRoomId"));
        String status = request.getParameter("roomStatus");
        RoomsDAO rdao = new RoomsDAO();
        if(status.equals("available")){
            rdao.toggleRoom(RoomId, "unavailable");
        }
        else if(status.equals("unavailable")){
            rdao.toggleRoom(RoomId, "available");
        }else{
            //Do nothing yet
        }
        response.sendRedirect("roommanager");
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
