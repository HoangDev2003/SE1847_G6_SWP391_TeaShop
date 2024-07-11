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
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String appPath = request.getServletContext().getRealPath("");
    String savePath = appPath + File.separator + "uploadImages";

    File fileSaveDir = new File(savePath);
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdirs();
    }

    int orderId = Integer.parseInt(request.getParameter("order_id"));
    String deliveryTimeStr = request.getParameter("deliveryTime");
    Timestamp deliveryTime = Timestamp.valueOf(deliveryTimeStr.replace("T", " ") + ":00");
    
    OrdersDAO ordersDAO = new OrdersDAO();
    ordersDAO.updateDeliveryTime(orderId, deliveryTime);
    
    for (Part part : request.getParts()) {
        if (part.getName().startsWith("fileUpload")) {
            int orderDetailsId = Integer.parseInt(part.getName().substring(10));
            String fileName = extractFileName(part);
            String filePath = savePath + File.separator + fileName;
            try {
                part.write(filePath);
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error uploading file: " + e.getMessage());
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            String dbFilePath = "uploadImages/" + fileName;

            OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
            orderDetailsDAO.updateImagePath(orderDetailsId, dbFilePath);
        }
    }
    
    HttpSession session = request.getSession();
    session.setAttribute("savedTime", deliveryTimeStr);
        
    response.sendRedirect("shipdetail?order_id=" + orderId);
}

private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
        if (s.trim().startsWith("filename")) {
            return s.substring(s.indexOf("=") + 2, s.length() - 1);
        }
    }
    return "";
}

}
