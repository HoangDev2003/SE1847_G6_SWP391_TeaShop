package controller;

import entity.CartDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author This PC
 */
@WebServlet(name = "PaymentResult", urlPatterns = {"/PaymentResult"})
public class PaymentResultController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
            List<CartDetails> cartInfo = new ArrayList<>();
            Enumeration<String> em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                String key = em.nextElement();

                if (key.startsWith("cartItem")) {
                    CartDetails cartItem = (CartDetails) session.getAttribute(key);
                    cartInfo.add(cartItem);
                }
            }
            String service = request.getParameter("service");
            if (service == null || service.isEmpty()) {
                service = "pay-online";
            }
            if (service.equals("cash-on-delivery")) {
                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String vnp_CreateDate = formatter.format(cld.getTime());
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                Date date;
                try {
                    date = inputFormat.parse(vnp_CreateDate);
                    String formattedDate = dateFormat.format(date);
                    String formattedTime = timeFormat.format(date);

                    request.setAttribute("formattedDate", formattedDate);
                    request.setAttribute("formattedTime", formattedTime);
                } catch (ParseException ex) {
                    Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
                }

                String amount = request.getParameter("amount");
                String fullname = request.getParameter("fullname");
                String address = request.getParameter("address");
                String phonenumber = request.getParameter("phonenumber");
                String status = "Giao dịch thành công";
                String OrderInfo = "Thanh toan hoa don Dream Coffee. So tien: " + amount + " dong";

                request.setAttribute("amount", amount);
                request.setAttribute("status", status);
                request.setAttribute("OrderInfo", OrderInfo);
                request.setAttribute("cartInfo", cartInfo);
                session.setAttribute("fullname", fullname);
                session.setAttribute("address", address);
                session.setAttribute("phonenumber", phonenumber);

                request.getRequestDispatcher("view/cart/payment-result.jsp").forward(request, response);
            } else if (service.equals("pay-online")) {
                Map fields = new HashMap();
                for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                    String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                    String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        fields.put(fieldName, fieldValue);
                    }
                }

                String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                if (fields.containsKey("vnp_SecureHashType")) {
                    fields.remove("vnp_SecureHashType");
                }
                if (fields.containsKey("vnp_SecureHash")) {
                    fields.remove("vnp_SecureHash");
                }
                String signValue = Config.hashAllFields(fields);

                int amount = Integer.parseInt(request.getParameter("vnp_Amount")) / 100;
                request.setAttribute("amount", amount);

                String OrderInfo = request.getParameter("vnp_OrderInfo");
                request.setAttribute("OrderInfo", OrderInfo);

                String vnp_PayDate = request.getParameter("vnp_PayDate");
                try {
                    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                    Date date = inputFormat.parse(vnp_PayDate);
                    String formattedDate = dateFormat.format(date);
                    String formattedTime = timeFormat.format(date);

                    request.setAttribute("formattedDate", formattedDate);
                    request.setAttribute("formattedTime", formattedTime);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                String status;
                if (signValue.equals(vnp_SecureHash)) {
                    if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                        status = "Giao dịch thành công";
                        while (em.hasMoreElements()) {
                            String key = em.nextElement();

                            if (key.startsWith("cartItem")) {
                                session.removeAttribute(key);
                            }
                        }
                    } else {
                        status = "Giao dịch thất bại";
                    }

                } else {
                    status = "Giao dịch thất bại";
                }
                request.setAttribute("status", status);
                request.setAttribute("cartInfo", cartInfo);
                request.getRequestDispatcher("view/cart/payment-result.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PaymentResultController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PaymentResultController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

