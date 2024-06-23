/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrdersDAO;
import dal.StatusDAO;
import entity.Orders;
import entity.Status;
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
public class ShippingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrdersDAO orderDAO = new OrdersDAO();
        StatusDAO statusDAO = new StatusDAO();
        List<Orders> listOrders = orderDAO.getAllListOrder();
        List<Status> listStatus = statusDAO.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("listOrders", listOrders);
        session.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("view/dashboard/shipper/order-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrdersDAO orderDAO = new OrdersDAO();
        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int statusId = Integer.parseInt(request.getParameter("statusId"));
            orderDAO.updateOrderStatus(orderId, statusId);
            response.sendRedirect("ship"); // Redirect lại trang danh sách đơn hàng
        } else {
            doGet(request, response); // Chuyển lại doGet cho các hành động khác
        }
    }

}
