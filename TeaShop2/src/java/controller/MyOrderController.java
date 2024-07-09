/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
@WebServlet(name = "MyOrder", urlPatterns = {"/MyOrder"})
public class MyOrderController extends HttpServlet {

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

        // Retrieve or create a session associated with the request
        HttpSession session = request.getSession(true);
        OrdersDAO ordersDAO = new OrdersDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null || service.isEmpty()) {
                service = "show";
            }

            if (service.equals("show")) {
                List<Orders> listOrders;
                String current_status_id = request.getParameter("current_status_id");
                if (current_status_id == null || current_status_id.isEmpty()) {
                    current_status_id = "0";
                }
                // Retrieve the account ID stored in the session
                Integer accountId = (Integer) session.getAttribute("accountId");
                if (!(accountId == null)) {
                    int statusId = Integer.parseInt(current_status_id);
                    if (statusId == 0) {
                        listOrders = ordersDAO.findByAccountId(accountId);
                    } else {
                        listOrders = ordersDAO.findByAccountIdAndStatusId(accountId, statusId);
                    }
                    // Retrieve the list of orders associated with the account ID

                    // Set the list of orders as a request attribute for access in the JSP page
                    request.setAttribute("listOrders", listOrders);
                } else {
                    request.setAttribute("message", "Quý khách cần đăng nhập để truy cập vào trang này");
                }
                request.setAttribute("current_status_id", current_status_id);
                // Forward the request to the "my-order.jsp" page for rendering
                request.getRequestDispatcher("view/orders/my-order.jsp").forward(request, response);
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
