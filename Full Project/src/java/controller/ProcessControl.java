package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


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
public class ProcessControl extends HttpServlet {
   
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
            out.println("<title>Servlet ProcessControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessControl at " + request.getContextPath () + "</h1>");
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
//        HttpSession session = request.getSession();
//        carts cart = null;
//        Object o = session.getAttribute("cart");  //lay ve 1 session ten la cart o dau do
//        
//        if(o!=null) {
//            cart = (carts) o;
//        } else {
//            cart = new carts();
//        }

        //get the user_id from the session
        HttpSession session = request.getSession();
        users u = (users)session.getAttribute("acc");
        int user_id = u.getUser_id();
        
        //create a new CartDAO for the current user
        CartDAO cart = new CartDAO();
        
        String num_raw = request.getParameter("num").trim();
        String item_id = request.getParameter("id");
        int num;
            
        try {
            num = Integer.parseInt(num_raw);
            
            if((num==-1) && (cart.getItemQuantity(user_id, item_id)<=1)) {
                cart.removeItem(user_id, item_id);
            } else {
                cart.addItemToCart(user_id, item_id, num);
            }
        } catch(NumberFormatException e) {
            System.out.println(e);
        }
        
        request.getRequestDispatcher("showcart").forward(request, response);
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
        HttpSession session = request.getSession();
        carts cart = null;
        Object o = session.getAttribute("cart");  //lay ve 1 session ten la cart o dau do
        
        //co roi
        if(o!=null) {
            cart = (carts) o;
        } else {
            //chua co (mua hang lan dau)
            cart = new carts();
        }
        
        String item_id = request.getParameter("item_id");
        cart.removeItem(item_id);
        
        List<cart_items> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        session.setAttribute("item_id", item_id);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
