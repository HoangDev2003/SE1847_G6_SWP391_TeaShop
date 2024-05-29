/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import entity.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huyen Tranq
 */
public class SignupController extends HttpServlet {
    
    private static final String SIGNUP_JSP = "Signup.jsp";
    private static final String LOGIN_JSP = "login.jsp";
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SignupController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();

        // check xem co kick vao link create new product k?
        if (request.getParameter("mode") != null && request.getParameter("mode").equals("1")) {

            request.getRequestDispatcher(SIGNUP_JSP).forward(request, response);
        }
        request.getRequestDispatcher(LOGIN_JSP).forward(request, response);
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
        String email = request.getParameter("email");
        String pass_word = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        String user_name = request.getParameter("user");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");

       // check password
            if (pass_word != null && !(pass_word.equals(re_pass))) {
                request.setAttribute("mess", "Check password and repassword");
                request.getRequestDispatcher(SIGNUP_JSP).forward(request, response);
            } else {
                AccountDAO dao = new  AccountDAO();

                Accounts a = dao.checkAccountExist(email);
                if (a == null) {
                    // duoc sign up
                  dao.Signup(user_name, pass_word, email, gender, address, phone_number);
                    request.setAttribute("email", email);
                    request.setAttribute("pass", pass_word);
                   request.getRequestDispatcher(LOGIN_JSP).forward(request, response);

                } else {
                    //day ve trang login
                    request.setAttribute("mess", "Email are exist! Please enter another email!");  
                    request.getRequestDispatcher(SIGNUP_JSP).forward(request, response);
                }
            }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
