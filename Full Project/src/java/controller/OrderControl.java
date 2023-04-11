/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.DAO;
import dal.ItemDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.OrderHistory;
import model.cart_items_infor;
import model.items;
import model.users;

/**
 *
 * @author DELL
 */
public class OrderControl extends HttpServlet {

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
            out.println("<title>Servlet OrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath() + "</h1>");
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
        //get the user_id from the session
        HttpSession session = request.getSession();
        users u = (users) session.getAttribute("acc");
        int user_id = u.getUser_id();

        DAO dao = new DAO();
        OrderDAO d = new OrderDAO();
        CartDAO c = new CartDAO();

        List<Order> orders = d.getOrderByCart(user_id);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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

        //if the user is admin or seller, then they cannot buy stuff
        if (u.getIsAdmin() == 1 || u.getIsSell() == 1) {
            response.sendRedirect("home");
        } else {
            DAO dao = new DAO();
            OrderDAO d = new OrderDAO();
            CartDAO c = new CartDAO();
            ItemDAO i = new ItemDAO();

            //get all cart items in the current user'cart
            List<cart_items_infor> items = c.getCartItems(user_id);
            //if the cart has item (not empty) then we can checkout
            if (items.size() != 0) {
                
                //add new order (bill)
                int n = d.addOrder(user_id);
                //if add order success
                if (n > 0) {
                    //get the order_id of the lastest order (the order just been added)
                    int order_id = d.getAllOrder().get(d.getAllOrder().size() - 1).getOrder_id();
                    //from the order just added, create the order detail for it
                    //add sequently the items in the cart to the order detail
                    int m = d.addOrderHistory(order_id, user_id);
                    //if create order detail success
                    if (m > 0) {
                        //delete all items from the current cart (items have been purchased)
                        c.deleteAll(user_id);
                        
                        //update the stock of the items have been purchased
                        //get all the items in order detail
                        List<OrderHistory> listOrderHistory = d.getAllOrderHistoryByOrderId(order_id);
                        //for one of the item in the order detail, we get the item by item_id and the quantity of it have been purchased
                        for(OrderHistory item : listOrderHistory) {
                            items a = i.getItemById(item.getItem_id());
                            int quantityBeenPurchased = item.getQuantity();
                            //then update the item in store by the item_id and the quantity been purchased
                            i.updateStock(a, quantityBeenPurchased);
                        }
                    }
                    List<OrderHistory> orderHistory = d.getAllOrderHistoryByOrderId(order_id);
                    List<Order> orders = d.getOrderByCart(user_id);
                    request.setAttribute("orderHistory", orderHistory);
                    request.setAttribute("orders", orders);
                }

                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
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
