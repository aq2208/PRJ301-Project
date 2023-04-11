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
import java.util.List;
import model.cart_items;
import model.carts;
import model.items;
import model.users;

/**
 *
 * @author DELL
 */
public class AddToCartControl extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        String item_id = request.getParameter("item_id");
//        request.setAttribute("item_id", item_id);
//        request.getRequestDispatcher("login.jsp");
        String item_id = request.getParameter("item_id");
        //request.setAttribute("item_id", item_id);
        HttpSession session = request.getSession();
        session.setAttribute("current", item_id);
        request.getRequestDispatcher("login").forward(request, response);
        //response.sendRedirect("login");
//        HttpSession session = request.getSession();
//        carts cart = null;
//        //check xem gio hang da ton tai chua
//        Object o = session.getAttribute("cart");  //lay ve 1 session ten la cart o dau do
//        //co roi
//        if(o!=null) {
//            cart = (carts) o;
//        } else {
//            //chua co (mua hang lan dau)
//            cart = new carts();
//        }
//        
//        //lay data tu form tu detail.jsp
//        String num_raw = request.getParameter("number");
//        String item_id = request.getParameter("item_id");
//        int num;
//        
//        
//            num = Integer.parseInt(num_raw);
//            
//            DAO d = new DAO();
//            items p = d.getItemById(item_id);
//            cart_items t = new cart_items(0, cart, p, num, p.getPrice());
//            cart.addItem(t);
//        
//        
//        List<cart_items> list = cart.getItems();
//        session.setAttribute("cart", cart);
//        session.setAttribute("size", list.size());
//        session.setAttribute("item_id", item_id);
//        request.getRequestDispatcher("detail?item_id="+item_id).forward(request, response);
//        //request.getRequestDispatcher("cart.jsp").forward(request, response);

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

        //get the user_id from the session
        HttpSession session = request.getSession();
        users u = (users) session.getAttribute("acc");
        int user_id = u.getUser_id();

        //create a new CartDAO for the current user
        CartDAO cart = new CartDAO();

        try {
            //get the item_id of the item to add to the user's cart
            String item_id = request.getParameter("item_id");
            //get the number of item you want to add to the cart
            int num = Integer.parseInt(request.getParameter("number"));

            cart.addItemToCart(user_id, item_id, num);

            //get size item
            request.setAttribute("size", cart.getCartSize(user_id));
            request.getRequestDispatcher("detail?item_id=" + item_id).forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
