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
        // Set the content type of the response to HTML with UTF-8 encoding
        response.setContentType("text/html;charset=UTF-8");

        // Create an instance of CartDetailsDAO to interact with the database
        CartDetailsDAO cartDetailsDAO = new CartDetailsDAO();

        // Retrieve or create a session associated with the request
        HttpSession session = request.getSession(true);

        try (PrintWriter out = response.getWriter()) {
            // Retrieve the value of the "service" parameter from the request
            String service = request.getParameter("service");

            // Retrieve the account ID stored in the session
            int accountId = (int) session.getAttribute("accountId");

            // If the "service" parameter is null, set it to "showcart"
            if (service == null) {
                service = "showcart";
            }

            // Handle different service requests
            if (service.equals("update")) {
                // Update cart item quantity
                int cart_id = cartDetailsDAO.getCartIdFromAccountId(accountId);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                cartDetailsDAO.updateQuantity(quantity, cart_id, product_id);
                response.sendRedirect("CartDetails?service=showcart");
            } else if (service.equals("delete")) {
                // Delete cart item
                int cart_id = cartDetailsDAO.getCartIdFromAccountId(accountId);
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                cartDetailsDAO.deleteFromCart(cart_id, product_id);
                response.sendRedirect("CartDetails?service=showcart");
            } else if (service.equals("showcart")) {
                // Show cart details
                
                // Retrieve cart information and topping list
                List<String[]> cartInfo = cartDetailsDAO.getinfo(accountId);
                List<String> toppingList = cartDetailsDAO.getTopping();

                // Calculate total cart amount
                int totalCartAmount = 0;
                for (String[] item : cartInfo) {
                    int price = Integer.parseInt(item[2]);
                    int quantity = Integer.parseInt(item[3]);
                    totalCartAmount += price * quantity;
                }

                // Set attributes for access in the JSP page
                request.setAttribute("totalCartAmount", totalCartAmount);
                request.setAttribute("toppingList", toppingList);
                request.setAttribute("cartInfo", cartInfo);

                // Forward the request to the "cart-details.jsp" page for rendering
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