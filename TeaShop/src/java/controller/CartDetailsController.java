/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDetailsDAO;
import entity.CartDetails;
import entity.Orders;
import entity.Product;
import entity.Topping;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
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
        HttpSession session = request.getSession(true);

        CartDetailsDAO cartDetailsDAO = new CartDetailsDAO();

        try (PrintWriter out = response.getWriter()) {
            // Retrieve the value of the "service" parameter from the request
            String service = request.getParameter("service");

            // If the "service" parameter is null, set it to "showcart"
            if (service == null || service.isEmpty()) {
                service = "showcart";
            }

            // Handle different service requests
            if (service.equals("add2cart")) {
                String product_id = request.getParameter("product_id");
                CartDetails cartItem = (CartDetails) session.getAttribute("cartItem" + product_id);
                if (cartItem == null) {
                    cartItem = new CartDetails();
                    cartItem.product = new Product();
                    cartItem.topping = new Topping();
                    CartDetails cartInfo = cartDetailsDAO.getInfo(Integer.parseInt(product_id));
                    cartItem.product.setProduct_id(cartInfo.product.getProduct_id());
                    cartItem.product.setProduct_name(cartInfo.product.getProduct_name());
                    cartItem.product.setImage(cartInfo.product.getImage());
                    cartItem.product.setPrice(cartInfo.product.getPrice());
                    cartItem.setQuantity(1);
                    cartItem.topping.setTopping_name(null);

                    session.setAttribute("cartItem" + product_id, cartItem);
                }
                response.sendRedirect("shop");
            }
            if (service.equals("add2cart2")) {
                String order_id = request.getParameter("order_id");
                String product_id = request.getParameter("product_id");
                String quantity = request.getParameter("quantity");
                String topping_name = request.getParameter("topping_name");
                CartDetails cartItem = (CartDetails) session.getAttribute("cartItem" + product_id);
                if (cartItem == null) {
                    cartItem = new CartDetails();
                    cartItem.product = new Product();
                    cartItem.topping = new Topping();
                    CartDetails cartInfo = cartDetailsDAO.getInfo(Integer.parseInt(product_id));
                    cartItem.product.setProduct_id(cartInfo.product.getProduct_id());
                    cartItem.product.setProduct_name(cartInfo.product.getProduct_name());
                    cartItem.product.setImage(cartInfo.product.getImage());
                    cartItem.product.setPrice(cartInfo.product.getPrice());
                    cartItem.setQuantity(Integer.parseInt(quantity));
                    if (topping_name == null || topping_name.isEmpty()) {
                        topping_name = null;
                    } else {
                        cartItem.topping.setTopping_name(topping_name);
                    }

                    session.setAttribute("cartItem" + product_id, cartItem);
                }
                response.sendRedirect("OrderInformation?order_id=" + order_id);
            }
            if (service.equals("updateQuantity")) {
                // Update cart item quantity
                String quantity = request.getParameter("quantity");
                int intQuantity = 1;
                if (quantity != null && !quantity.isEmpty()) {
                    try {
                        // Attempt to parse the quantity as an integer
                        intQuantity = Integer.parseInt(quantity);
                    } catch (NumberFormatException e) {
                        // If parsing fails, set quantity to 1
                        intQuantity = 1;
                    }
                }
                String product_id = request.getParameter("product_id");
                CartDetails cartItem = (CartDetails) session.getAttribute("cartItem" + product_id);
                if (intQuantity > 0) {
                    cartItem.setQuantity(intQuantity);
                } else {
                    cartItem.setQuantity(1);
                }
                response.sendRedirect("CartDetails?service=showcart");
            }
            if (service.equals("updateTopping")) {
                // Update cart item quantity
                String topping_name = request.getParameter("topping_name");
                if (topping_name == null || topping_name.isEmpty()) {
                    topping_name = null;
                }
                String product_id = request.getParameter("product_id");
                CartDetails cartItem = (CartDetails) session.getAttribute("cartItem" + product_id);
                cartItem.topping = new Topping();
                cartItem.topping.setTopping_name(topping_name);
                response.sendRedirect("CartDetails?service=showcart");
            }
            if (service.equals("delete")) {
                String product_id = request.getParameter("product_id");
                session.removeAttribute("cartItem" + product_id);
                response.sendRedirect("CartDetails?service=showcart");
            }
            if (service.equals("showcart")) {
                // Show cart details

                // Retrieve cart information and topping list
                List<CartDetails> cartInfo = new ArrayList<>();
                Enumeration<String> em = session.getAttributeNames();
                while (em.hasMoreElements()) {
                    String key = em.nextElement();

                    if (key.startsWith("cartItem")) {
                        CartDetails cartItem = (CartDetails) session.getAttribute(key);
                        cartInfo.add(cartItem);
                    }
                }
                List<String> toppingList = cartDetailsDAO.getTopping();

                // Calculate total cart amount
                int totalCartAmount = 0;
                for (CartDetails item : cartInfo) {
                    int price = item.product.getPrice();
                    int quantity = item.getQuantity();
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
