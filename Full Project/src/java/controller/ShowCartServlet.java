/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.cart_items_infor;
import model.items;
import model.users;

/**
 *
 * @author DELL
 */
public class ShowCartServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowCartServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowCartServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        //get the user_id from the session
        HttpSession session = request.getSession();
        users u = (users)session.getAttribute("acc");
        int user_id = u.getUser_id();
        
        
        //create a new CartDAO for the current user
        CartDAO cart = new CartDAO();
        
        try {
            //check if the user's cart is exist
            cart.createCartIfNotExist(user_id);
            
            //get the list items in the user's cart
            List<cart_items_infor> items = cart.getCartItems(user_id);
            
            //get total money
            double total=cart.getTotalPrice(user_id);

            //send the list items to jsp
            request.setAttribute("items", items);
            request.setAttribute("size", items.size());
            request.setAttribute("total", total);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch(IOException e) {
            System.out.println(e);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //get the user_id from the session
        HttpSession session = request.getSession();
        users u = (users)session.getAttribute("acc");
        int user_id = u.getUser_id();
        
        //create a new CartDAO for the current user
        CartDAO cart = new CartDAO();
        
        try {
            //check if the user's cart is exist
            cart.createCartIfNotExist(user_id);
            
            //get the list items in the user's cart
            List<cart_items_infor> items = cart.getCartItems(user_id);
            
            //get total money
            double total=cart.getTotalPrice(user_id);

            //send the list items to jsp
            request.setAttribute("items", items);
            request.setAttribute("size", items.size());
            request.setAttribute("total", total);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch(IOException e) {
            System.out.println(e);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
