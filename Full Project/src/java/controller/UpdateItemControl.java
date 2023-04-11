/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.ItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.items;

/**
 *
 * @author DELL
 */
public class UpdateItemControl extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateItemControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateItemControl at " + request.getContextPath () + "</h1>");
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
        String item_id = request.getParameter("item_id");
        DAO d = new DAO();
        items i = d.getItemById(item_id);
        request.setAttribute("item", i);
        request.getRequestDispatcher("updateitem.jsp").forward(request, response);
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
        String item_id = request.getParameter("item_id");
        String item_name = request.getParameter("item_name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String stock_raw = request.getParameter("stock");
        String category_id_raw = request.getParameter("category_id");
        String image = request.getParameter("image");
        
        String item_id_origin = request.getParameter("item_id_origin");
        
        int stock, category_id;
        double price;
        DAO d = new DAO();
        ItemDAO dao = new ItemDAO();
        try {
            stock = Integer.parseInt(stock_raw);
            category_id = Integer.parseInt(category_id_raw);
            price = Integer.parseInt(price_raw);
            
            items cNew = new items(item_id, item_name, description, price, stock, d.getCategoryById(category_id), image);
            dao.update(cNew, item_id_origin);
            
        } catch(NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("listitems");
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
