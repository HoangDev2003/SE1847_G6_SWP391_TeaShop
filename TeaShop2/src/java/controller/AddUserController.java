/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.AdminDAO;
import entity.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Huyen Tranq
 */
public class AddUserController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("AddUser.jsp").forward(request, response);
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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        // Kiểm tra khoảng trắng trong email, tên người dùng, mật khẩu và nhập lại mật khẩu
        if (containsSpace(email) || containsSpace(name) || containsSpace(pass)) {
            request.setAttribute("mess", "Kiểm tra khoảng trắng!");
            request.setAttribute("email", email);
            request.setAttribute("pass", pass);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            return;
        }
        
         if (!isValidEmail(email)) {
            request.setAttribute("mess", "Email không hợp lệ!");
            request.setAttribute("email", email);
            request.setAttribute("pass", pass);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            return;
        }
         
        // Kiểm tra số điện thoại không hợp lệ
        if (phone == null || !phone.matches("0\\d{9}")) {
            // Số điện thoại không hợp lệ
            request.setAttribute("mess", "Số điện thoại phải bắt đầu bằng 0 và bao gồm 10 số!");
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("pass", pass);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            return;
        }

        // check password
        if (pass.length() < 8 || pass.length() > 32) {
            // pass_word không hợp lệ
            request.setAttribute("mess", "Mật khẩu phải chứa từ 8-32 ký tự");
            request.setAttribute("email", email);
            request.setAttribute("pass", pass);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            return;
        } else {
            AdminDAO dao = new AdminDAO();
            AccountDAO da = new AccountDAO();
            int role_id = Integer.parseInt(role);
            int status_id = Integer.parseInt(status);
            System.out.println(name);
            System.out.println(email);
            System.out.println(pass);
            System.out.println(phone);
            System.out.println(gender);
            System.out.println(address);
            System.out.println(role);
            System.out.println(status);
            Accounts a = da.checkAccountExist(email);
            System.out.println(a);
            if (a == null) {
                if (role_id == 3) {
                    dao.addUser(email, pass, name, role_id, status_id, phone, gender, address);
                    response.sendRedirect("staffmanager");
                } else if (role_id == 4) {
                    dao.addUser(email, pass, name, role_id, status_id, phone, gender, address);
                    response.sendRedirect("shippermanager");
                } else {
                    dao.addUser(email, pass, name, role_id, status_id, phone, gender, address);
                    response.sendRedirect("customerManagement");
                }
            } else {
                request.setAttribute("error", "This username already exists");
                request.getRequestDispatcher("view/dashboard/staff1/customerManagement.jsp").forward(request, response);
            }
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
    // Hàm kiểm tra khoảng trắng

    private boolean containsSpace(String input) {
        return input != null && input.contains(" ");
    }
    private static final String EMAIL_PATTERN = 
        "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";

    private static final Pattern pattern = Pattern.compile(EMAIL_PATTERN);

    private boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

}
