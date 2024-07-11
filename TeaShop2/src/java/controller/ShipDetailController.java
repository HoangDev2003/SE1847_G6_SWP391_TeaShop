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
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author HoangPC
 */
public class ShipDetailController extends HttpServlet {

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
        request.getRequestDispatcher("view/dashboard/shipper/order-detail.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
}

private String extractFileName(Part part) {
    
}

}
