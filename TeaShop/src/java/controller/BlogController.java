/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BlogDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import entity.Blog;
import entity.Category;
import entity.Product;

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
 * @author ADMIN
 */
public class BlogController extends HttpServlet {
   


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     
    BlogDAO blogDAO = new BlogDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String search = request.getParameter("search");
        try {
            //nếu không tim kiem
            if (search == null) {
                List<Blog> listBlog = blogDAO.findAll();
                session.setAttribute("listBlog", listBlog);
                request.getRequestDispatcher("view/homepage/blog.jsp").forward(request, response);
            } else {
                List<Blog> searchBlog = blogDAO.getBlogBySearch(search);
               //nếu tìm không thấy thì hiển thị "Không có dữ liệu hiển thị"
                if (searchBlog.isEmpty()) {
                    request.setAttribute("error", "Không có dữ liệu hiển thị");
                    request.getRequestDispatcher("view/homepage/blogDetail.jsp").forward(request, response);
                } else {
//nếu tìm thấy
                    session.setAttribute("listBlog", searchBlog);
                    request.getRequestDispatcher("view/homepage/blog.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            out.print(e);
        }
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
