/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDetailsDAO;
import dal.OrdersDAO;
import entity.OrderDetails;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author HoangPC
 */
public class StaffOrderDetailsController extends HttpServlet {
   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        OrdersDAO orderDAO = new OrdersDAO();
    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

    int order_id = Integer.parseInt(request.getParameter("order_id"));
    List<OrderDetails> listOrderDetails = orderDetailsDAO.findByOrderId(order_id);
    Orders orders = orderDAO.findByOrderId(order_id);

    HttpSession session = request.getSession();
    session.setAttribute("listOrderDetails", listOrderDetails);
    session.setAttribute("orders", orders);

    // Chuyển đổi Timestamp sang chuỗi định dạng
    String orderTimeFormatted = orders.getOrder_date().toLocalDateTime().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
    request.setAttribute("orderTimeFormatted", orderTimeFormatted);

    request.getRequestDispatcher("view/dashboard/staff1/orderdetail-manage.jsp").forward(request, response);
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
        
    }

}
