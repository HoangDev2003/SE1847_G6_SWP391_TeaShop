/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDetailsDAO;
import dal.OrdersDAO;
import dal.StatusDAO;
import entity.OrderDetails;
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
import java.sql.Timestamp;

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

        String statusOrderParam = request.getParameter("statusOrder");
        int statusOrder = (statusOrderParam != null) ? Integer.parseInt(statusOrderParam) : 3;
        List<Orders> listOrders = orderDAO.findOrdersStatusId(statusOrder);
        List<Status> listStatus = statusDAO.statusShipper();
        HttpSession session = request.getSession();
        request.setAttribute("statusOrder", statusOrder);
        session.setAttribute("listOrders", listOrders);
        session.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("view/dashboard/shipper/order-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrdersDAO orderDAO = new OrdersDAO();
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int statusId = Integer.parseInt(request.getParameter("statusId"));

            // Kiểm tra xem trạng thái là "Hoàn thành" (giả sử statusId = 4 là "Hoàn thành")
            if (statusId == 4) {
                List<OrderDetails> listOrderDetails = orderDetailsDAO.findByOrderId(orderId);
                boolean imageMissing = false;
                for (OrderDetails od : listOrderDetails) {
                    if (od.getImage_after_ship() == null || od.getImage_after_ship().isEmpty()) {
                        imageMissing = true;
                        break;
                    }
                }
                if (imageMissing) {
                    // Nếu không có ảnh sau khi giao hàng, hiển thị thông báo lỗi
                    request.setAttribute("errorMessage", "Vui lòng tải lên ảnh sau khi giao hàng trước khi hoàn thành đơn hàng.");
                    doGet(request, response); // Hiển thị lại danh sách đơn hàng với thông báo lỗi
                    return;
                }
            } else if (statusId == 5) { // Giả sử 5 là id của trạng thái "Đơn hàng bị hủy"
                Orders order = orderDAO.findByOrderId(orderId);
                if (order.getShipper_note() == null || order.getShipper_note().isEmpty()) {
                    // Nếu không có ghi chú của shipper, hiển thị thông báo lỗi
                    request.setAttribute("errorMessage", "Vui lòng thêm ghi chú cho đơn hàng trước khi hủy.");
                    doGet(request, response); // Hiển thị lại danh sách đơn hàng với thông báo lỗi
                    return;
                }
            }

            // Cập nhật trạng thái và thời gian giao hàng của shipper
            orderDAO.updateOrderStatus(orderId, statusId);
            if (statusId == 4) { // Nếu trạng thái là "Hoàn thành"
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                orderDAO.updateShipperDeliveryTime(orderId, currentTime);
            }

            response.sendRedirect("ship");  // Redirect lại trang danh sách đơn hàng
        } else {
            doGet(request, response); // Chuyển lại doGet cho các hành động khác
        }
    }

}
