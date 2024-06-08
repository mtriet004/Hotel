package controller;

import DAO.DiscountDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class togglediscountstatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This servlet doesn't render any HTML response directly, it just handles the POST request to toggle the discount status
        // You can leave this method empty or add logging if needed.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        int newStatus = Integer.parseInt(request.getParameter("status"));

        // Toggle discount status
        DiscountDAO discountDAO = new DiscountDAO();
        boolean success = discountDAO.toggleDiscountStatus(code, newStatus);

        // Redirect back to the page showing all discounts
        if (success) {
            response.sendRedirect("managediscount"); // Assuming "managediscount" is the URL pattern for the managediscount servlet
        } else {
            // Handle failure, maybe show an error message
            response.sendRedirect("managediscount"); // Redirect back to the page showing all discounts
        }
    }

    @Override
    public String getServletInfo() {
        return "Toggle Discount Status Servlet";
    }
}
