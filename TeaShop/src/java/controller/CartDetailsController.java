/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDetailsDAO;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author This PC
 */
@WebServlet(name = "CartDetails", urlPatterns = {"/CartDetails"})
public class CartDetailsController extends HttpServlet {

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
        CartDetailsDAO cartDetailsDAO = new CartDetailsDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "showcart";
            }
            if (service.equals("update")) {
                int account_id = 1;
                int cart_id = cartDetailsDAO.getCartIdFromAccountId(account_id);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                cartDetailsDAO.updateQuantity(quantity, cart_id, product_id);
                response.sendRedirect("CartDetails?service=showcart");
            }
            if (service.equals("delete")) {
                int account_id = 1;
                int cart_id = cartDetailsDAO.getCartIdFromAccountId(account_id);
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                cartDetailsDAO.deleteFromCart(cart_id, product_id);
                response.sendRedirect("CartDetails?service=showcart");
            }
            if (service.equals("showcart")) {
                int accountId = 1;
                
                HttpSession session = request.getSession();

                // Assuming you want to retrieve orders for a specific account ID
                List<String[]> cartInfo = cartDetailsDAO.getinfo(accountId);
                List<String> toppingList = cartDetailsDAO.getTopping();
                // FoList<String[]> rward the request to the JSP page
                int totalCartAmount = 0;
                for (Object[] item : cartInfo) {
                    int price = Integer.parseInt(item[2].toString());
                    int quantity = Integer.parseInt(item[3].toString());
                    totalCartAmount += price * quantity;
                }
                request.setAttribute("totalCartAmount", totalCartAmount);
                request.setAttribute("toppingList", toppingList);
                session.setAttribute("cartInfo", cartInfo);
                request.getRequestDispatcher("view/cart/cart-details.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
