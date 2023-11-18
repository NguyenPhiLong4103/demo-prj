/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Cart;
import entity.CartItems;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOProduct;

/**
 *
 * @author nguye
 */
public class AddCart extends HttpServlet {

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
            DAOProduct dao = new DAOProduct();
            Cart cart = new Cart(new Vector<CartItems>(), 0);
            try {
                HttpSession session = request.getSession();
                if (session.getAttribute("cart") != null) {  //cart đã có
                    cart = (Cart) session.getAttribute("cart");
                }
                int pid = Integer.parseInt(request.getParameter("pid"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                Product product = dao.getProductById(pid);
                if(quantity > product.getQuantity()) {  //quá số lượng stock
                    String mess = "qua so luong";
                    PrintWriter out2 = response.getWriter();
                    out2.println(mess);
                    //session.setAttribute("mess", mess);
                }else {  //ko quá số lương
                    CartItems item = new CartItems(product, quantity);
                    cart.addItem(item);
                    
                }
                session.setAttribute("cart", cart);
                //response.sendRedirect("./store");  //add xong trả về trang
                
                
                response.sendRedirect("productdetail?pid=1");
            } catch (Exception e) {
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
