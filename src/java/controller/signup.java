/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import DTO.Account;
import Validator.validator;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class signup extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        //processRequest(request, response);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        validator validator = new validator();
        Account newAccount = new Account();
        String firstName = request.getParameter("fname").trim();
        String lastName = request.getParameter("lname").trim();
        String fullName = firstName + " " + lastName;
        String identityCard = request.getParameter("identitynum");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String sex = request.getParameter("sex");
        int status = 0;
        switch (sex) {
            case "male":
                sex = "Nam";
                break;
            case "female":
                sex = "Nữ";
                break;
            default:
                sex = "Khác";
                break;
        }
        String type = request.getParameter("type");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        if (validator.checkIfRegistered(phone,identityCard)) {
            // Phone number already exists, display error message
            request.setAttribute("errorMessage", "Số điện thoại/CCCD đã được sử dụng. Vui lòng chọn số điện thoại/CCCD khác.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            newAccount.setAddress(address);
            newAccount.setFullName(fullName);
            newAccount.setIdentityCard(identityCard);
            newAccount.setPassword(password);
            newAccount.setPhone(phone);
            newAccount.setEmail(email);
            newAccount.setSex(sex);
            newAccount.setType(type);
            newAccount.setStatus(status);
            AccountDAO AccountDAO = new AccountDAO();
            AccountDAO.CreateAccount(newAccount);
            response.sendRedirect("login");
        }
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
