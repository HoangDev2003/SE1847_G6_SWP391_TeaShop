/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDetailsDAO;
import dal.OrdersDAO;
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
@WebServlet(name = "OrderInformation", urlPatterns = {"/OrderInformation"})
public class OrderInformationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request The servlet request object containing the client's
     * request.
     * @param response The servlet response object to send the response back to
     * the client.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true); // Get or create the session

        try (PrintWriter out = response.getWriter()) {
            int orderId = Integer.parseInt(request.getParameter("order_id")); // Get order ID from request parameter
            OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
            OrdersDAO orderDAO = new OrdersDAO();

            // Retrieve information related to the order
            List<String[]> infoList = orderDetailsDAO.getinfo(orderId);
            Orders orderInfo = orderDAO.findByOrderId(orderId);
            String[] accInfo = orderDetailsDAO.accInfo(orderId);

            // Calculate the total order amount
            int totalOrderAmount = 0;
            for (String[] item : infoList) {
                int price = Integer.parseInt(item[4]); // Convert price to integer
                int quantity = Integer.parseInt(item[5]); // Convert quantity to integer
                totalOrderAmount += price * quantity; // Calculate total order amount
            }

            // Set the attributes to be accessed in the JSP page
            request.setAttribute("totalOrderAmount", totalOrderAmount);
            request.setAttribute("infoList", infoList);
            request.setAttribute("accInfo", accInfo);
            request.setAttribute("orderInfo", orderInfo);

            // Forward the request to the order information JSP page for display
            request.getRequestDispatcher("view/orders/order-information.jsp").forward(request, response);
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
