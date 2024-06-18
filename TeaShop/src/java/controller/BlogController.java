/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogCategoryDAO;
import dal.BlogDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import entity.Blog;
import entity.BlogCategory;
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

   
    BlogDAO blogDAO = new BlogDAO();
    BlogCategoryDAO blogCategoryDao = new BlogCategoryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String search = request.getParameter("search");
        try {
            List<BlogCategory> CategoryBlog = blogCategoryDao.getAll();
            BlogDAO topblogs= new BlogDAO();
             List<Blog> topblog = topblogs.getTop3Newest();
            session.setAttribute("listCategory", CategoryBlog);
            session.setAttribute("topblog", topblog);

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

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
