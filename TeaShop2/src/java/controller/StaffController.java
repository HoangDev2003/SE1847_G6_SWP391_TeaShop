/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.OrderDetailsDAO;
import dal.OrdersDAO;
import dal.StaffDAO;
import entity.OrderDetails;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

/**
 *
 * @author This PC
 */
@WebServlet(name = "Staff", urlPatterns = {"/Staff"})
public class StaffController extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        StaffDAO staffDAO = new StaffDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null || service.isEmpty()) {
                service = "show";
            }

            if (service.equals("update")) {
                OrdersDAO orderDAO = new OrdersDAO();
                OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                String current_status_id = request.getParameter("current_status_id");
                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int status_id = Integer.parseInt(request.getParameter("status_id"));

                Orders order = orderDAO.findByOrderId(order_id);
                if (status_id == 3) {  // Kiểm tra khi chuyển sang trạng thái hoàn thành
                    List<OrderDetails> listOrderDetails = orderDetailsDAO.findByOrderId(order_id);
                    boolean imageMissing = false;
                    for (OrderDetails od : listOrderDetails) {
                        if (od.getImage() == null || od.getImage().isEmpty()) {
                            imageMissing = true;
                            break;
                        }
                    }
                    if (order.getFormattedEstimated_delivery_date() == null) {
                        
                        request.setAttribute("errorMessage", "Vui lòng điền thời gian giao hàng dự kiến.");
                        String link = "Staff?service=show&current_status_id=" + 2;
                        request.getRequestDispatcher(link).forward(request, response); // Hiển thị lại danh sách đơn hàng với thông báo lỗi
                        return;
                    }
                    if (imageMissing) {
                        request.setAttribute("errorMessage", "Vui lòng tải lên 'Ảnh trước khi giao hàng' để giao cho shipper.");
                        String link = "Staff?service=show&current_status_id=" + 2;
                        request.getRequestDispatcher(link).forward(request, response);// Hiển thị lại danh sách đơn hàng với thông báo lỗi
                        return;
                    }
                }

                staffDAO.updateOrderStatus(order_id, status_id);

                String link = "Staff?service=show&current_status_id=" + current_status_id;
                request.getRequestDispatcher(link).forward(request, response);
            }


            if (service.equals("show")) {
                String current_status_id = request.getParameter("current_status_id");
                List<Orders> listOrders;
                if (current_status_id == null || current_status_id.isEmpty()) {
                    current_status_id = "0";
                }
                int statusId = Integer.parseInt(current_status_id);
                if (statusId == 0) {
                    listOrders = staffDAO.getAllOrder();
                } else {
                    listOrders = staffDAO.getOrderByStatusId(statusId);
                }
                request.setAttribute("listOrders", listOrders);
                request.setAttribute("current_status_id", current_status_id);
                request.getRequestDispatcher("view/dashboard/staff1/order-manage.jsp").forward(request, response);
            }
            if (service.equals("refund")) {
                String payment_method = request.getParameter("payment_method");
                String current_status_id = request.getParameter("current_status_id");
                int status_id = Integer.parseInt(request.getParameter("status_id"));
                String order_id = request.getParameter("order_id");

                if (payment_method.equals("VNPay")) {
                    String vnp_RequestId = Config.getRandomNumber(8);
                    String vnp_Version = "2.1.0";
                    String vnp_Command = "refund";
                    String vnp_TmnCode = Config.vnp_TmnCode;
                    String vnp_TransactionType = "02";
                    String vnp_TxnRef = new StaffDAO().getVnp_TxnRefFromOrderId(Integer.parseInt(order_id));
                    long amount = Integer.parseInt(request.getParameter("amount")) * 100;
                    String vnp_Amount = String.valueOf(amount);
                    String vnp_OrderInfo = "Hoan tien GD OrderId:" + order_id;
                    String vnp_TransactionNo = "";
                    String vnp_TransactionDate = new StaffDAO().getTranscationDateFromOrderId(Integer.parseInt(order_id));
                    String vnp_CreateBy = "Dream Coffee Staff";

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String vnp_CreateDate = formatter.format(cld.getTime());

                    String vnp_IpAddr = Config.getIpAddress(request);

                    JsonObject vnp_Params = new JsonObject();

                    vnp_Params.addProperty("vnp_RequestId", vnp_RequestId);
                    vnp_Params.addProperty("vnp_Version", vnp_Version);
                    vnp_Params.addProperty("vnp_Command", vnp_Command);
                    vnp_Params.addProperty("vnp_TmnCode", vnp_TmnCode);
                    vnp_Params.addProperty("vnp_TransactionType", vnp_TransactionType);
                    vnp_Params.addProperty("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.addProperty("vnp_Amount", vnp_Amount);
                    vnp_Params.addProperty("vnp_OrderInfo", vnp_OrderInfo);

                    if (vnp_TransactionNo != null && !vnp_TransactionNo.isEmpty()) {
                        vnp_Params.addProperty("vnp_TransactionNo", vnp_TransactionNo);
                    }

                    vnp_Params.addProperty("vnp_TransactionDate", vnp_TransactionDate);
                    vnp_Params.addProperty("vnp_CreateBy", vnp_CreateBy);
                    vnp_Params.addProperty("vnp_CreateDate", vnp_CreateDate);
                    vnp_Params.addProperty("vnp_IpAddr", vnp_IpAddr);

                    String hash_Data = String.join("|", vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
                            vnp_TransactionType, vnp_TxnRef, vnp_Amount, vnp_TransactionNo, vnp_TransactionDate,
                            vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);

                    String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hash_Data.toString());

                    vnp_Params.addProperty("vnp_SecureHash", vnp_SecureHash);

                    URL url = new URL(Config.vnp_ApiUrl);
                    HttpURLConnection con = (HttpURLConnection) url.openConnection();
                    con.setRequestMethod("POST");
                    con.setRequestProperty("Content-Type", "application/json");
                    con.setDoOutput(true);
                    DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                    wr.writeBytes(vnp_Params.toString());
                    wr.flush();
                    wr.close();
                    int responseCode = con.getResponseCode();
                    System.out.println("nSending 'POST' request to URL : " + url);
                    System.out.println("Post Data : " + vnp_Params);
                    System.out.println("Response Code : " + responseCode);
                    BufferedReader in = new BufferedReader(
                            new InputStreamReader(con.getInputStream()));
                    String output;
                    StringBuffer resp = new StringBuffer();
                    while ((output = in.readLine()) != null) {
                        resp.append(output);
                    }
                    in.close();
                    System.out.println(resp.toString());
                    String responseString = resp.toString();
                    String vnp_ResponseCode = extractValue(responseString, "vnp_ResponseCode");

                    if (vnp_ResponseCode.equals("00")) {
                        String staff_note = request.getParameter("staff_note");
                        new OrdersDAO().updateStaffNote(Integer.parseInt(order_id), staff_note);
                        staffDAO.updateOrderStatus(Integer.parseInt(order_id), status_id);
                        Orders orderInfo = new OrdersDAO().findByOrderId(Integer.parseInt(order_id));
                        request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                        request.setAttribute("orderInfo", orderInfo);
                        request.getRequestDispatcher("view/dashboard/staff1/staff-refund.jsp").forward(request, response);
                    } else {
                        String vnp_Message = extractValue(responseString, "vnp_Message");
                        request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                        request.setAttribute("vnp_Message", vnp_Message);
                        request.getRequestDispatcher("view/dashboard/staff1/staff-refund.jsp").forward(request, response);
                    }

                } else if (payment_method.equals("COD")) {
                    String staff_note = request.getParameter("staff_note");
                    new OrdersDAO().updateStaffNote(Integer.parseInt(order_id), staff_note);
                    staffDAO.updateOrderStatus(Integer.parseInt(order_id), status_id);
                    String link = "Staff?service=show&current_status_id=" + current_status_id;
                    request.getRequestDispatcher(link).forward(request, response);
                }
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

    private static String extractValue(String jsonString, String key) {
        String keyPattern = "\"" + key + "\":\"";
        int startIndex = jsonString.indexOf(keyPattern) + keyPattern.length();
        int endIndex = jsonString.indexOf("\"", startIndex);
        return jsonString.substring(startIndex, endIndex);
    }
}
