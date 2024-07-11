/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AdminDAO;
import entity.AccountStatus;
import entity.Accounts;
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
 * @author Huyen Tranq
 */
@WebServlet(name = "FilterShipperController", urlPatterns = {"/filtershipper"})
public class FilterShipperController extends HttpServlet {
   
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
        HttpSession session = request.getSession();
            if (!AuthorizationController.isAdmin((Accounts) session.getAttribute("acc"))) {
                AuthorizationController.redirectToHome(session, response);
            } else {
                AdminDAO dao = new AdminDAO();
                //Lấy thông tin gender, status
                List<AccountStatus> listas = dao.getAllStatus();
                request.setAttribute("listas", listas);

                String status = request.getParameter("status");
                String gender = request.getParameter("gender");

                if (gender.equals("Gender") && status.equals("Status")) {
                    response.sendRedirect("shippermanager");
                } else if (!gender.equals("Gender") && status.equals("Status")) {
                    int countf = dao.countFemaleShipper();
                    int countm = dao.countMaleShipper();

                    String index1 = request.getParameter("indexf");
                    String index2 = request.getParameter("indexm");
                    if (index1 == null) {
                        index1 = "1";
                    }
                    if (index2 == null) {
                        index2 = "1";
                    }
                    int indexf = Integer.parseInt(index1);
                    int indexm = Integer.parseInt(index2);

                    if (gender.equals("Male")) {
                        List<Accounts> listm = dao.getAllAccountMaleShipper(indexm);
                        if (listm.isEmpty()) {
                            request.setAttribute("error", "No result found !");
                            request.setAttribute("gender", gender);
                            request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                        } else {
                            request.setAttribute("indexm", indexm);
                            request.setAttribute("listShipper", listm);
                            request.setAttribute("gender", gender);
                            request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                        }
                    } else if (gender.equals("Female")) {
                        List<Accounts> listf = dao.getAllAccountFemaleShipper(indexf);
                        if (listf.isEmpty()) {
                            request.setAttribute("error", "No result found !");
                            request.setAttribute("gender", gender);
                            request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                        } else {
                            request.setAttribute("gender", gender);
                            request.setAttribute("indexf", indexf);
                            request.setAttribute("listShipper", listf);
                            request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                        }
                    }
                } 
                else if ((gender.equals("Gender") || gender == null) && !(status.equals("Status"))) {

                //List accout active
                int countActive = dao.countActiveAccountShipper();
                String index4 = request.getParameter("indexa");
                if (index4 == null) {
                    index4 = "1";
                }
                int indexa = Integer.parseInt(index4);

                //List account inactive
                int countInActive = dao.countInActiveAccountShipper();                
                String index5 = request.getParameter("indexi");
                if (index5 == null) {
                    index5 = "1";
                }
                int indexI = Integer.parseInt(index5);
                if (status.equals("1")) {
                    List<Accounts> lista = dao.getAccountsActiveShipper(indexa);
                    if (lista.isEmpty()) {
                        request.setAttribute("error", "No result found !");
                        request.setAttribute("status", "1");
                        request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                    } else {
                        request.setAttribute("status", "1");
                        request.setAttribute("indexa", indexa);
                        request.setAttribute("listShipper", lista);
                        request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                    }

                } else if (status.equals("2")) {
                    List<Accounts> listi = dao.getAccountsInActiveShipper(indexI);
                    if (listi.isEmpty()) {
                        request.setAttribute("error", "No result found !");
                        request.setAttribute("status", "2");
                        request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                    } else {
                        request.setAttribute("status", "2");
                        request.setAttribute("indexi", indexI);
                        request.setAttribute("listShipper", listi);
                        request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                    }
                }
            } else {
                int status_id = Integer.parseInt(status);
                int count = dao.countAccountByGenderAndStatusShipper(gender, status_id);
                String index9 = request.getParameter("index");
                if (index9 == null) {
                    index9 = "1";
                }
                int index = Integer.parseInt(index9);
                List<Accounts> list = dao.getAccountByGenderAndStatusShipper(gender, status_id, index);
                if (list.isEmpty()) {
                    request.setAttribute("error", "No result found !");
                    request.setAttribute("gender", gender);
                    request.setAttribute("status", status_id);
                    request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                } else {
                    request.setAttribute("listShipper", list);
                    request.setAttribute("gender", gender);
                    request.setAttribute("status", status_id);                  
                    request.setAttribute("index", index);
                    request.getRequestDispatcher("./view/dashboard/admin/shipperManagement.jsp").forward(request, response);
                }
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
